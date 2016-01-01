---
title: Haskell stack, Yesod and Docker
layout: post
categories:
  - Uncategorized
---

## The why

Over the break I've been working on a web app to replace a fairly old MS Access
Database that I built for my Dad to use in 2009 (he has a [mobile vet
business](https://www.facebook.com/Ross-Newman-Mobile-Vet-1461582037471594/)).

This seemed like a good chance to try out
[Yesod](http://www.yesodweb.com/), a web framework for Haskell. The Yesod
philosophy is to leverage the Haskell type system wherever possible. For
example, in the Hamlet templating language everything from generating URLs to
including static files and generating forms is checked at compile time.

[stack](http://haskellstack.org) is a cross platform build tool for developing
Haskell programs which (when combined with
[Stackage](https://www.stackage.org/) makes Haskell development much more
enjoyable.

I'd recommend stack for any new Haskell project, and hopefully this post can
point someone else in the right direction for a stack/Yesod/Docker project.

I built a very basic site with Yesod and stack locally on OS X, based off the
yesod-postgres template (`stack new mysite yesod-postgres`). The yesod dev
server makes this all very easy, just running `stack exec -- yesod devel` will
keep Yesod running and recompiling the app whenever any changes are made.

Soon it was time to make the app available somewhere in order to start
getting some feedback. At this stage, the most basic requirement for the
hosting was that it be low cost. Digital Ocean came to mind (use [this
link](https://www.digitalocean.com/?refcode=c55b676d3a2e) for $10 credit), and
I'm now using their one-click Docker droplet at USD $5 per month. This host can
run both the Yesod frontend and the PostgreSQL database.

Binaries built locally on OS X won't run on a Linux-based Digital Ocean droplet,
and it was a bit early to spend $$ on something like Snap or Travis, so I needed
a VM or container to run the build in.

## The how

### Set up

I wanted to take advantage of the Docker support in stack to run the build and
package the application, but it isn't currently supported when using
boot2docker (see [these](https://github.com/commercialhaskell/stack/issues/194)
[issues](https://github.com/commercialhaskell/stack/issues/488)), so I needed
another VM. Easy enough with Vagrant:

```ruby
Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/centos-6.6-64-nocm"
  # I already had this Vagrant box on my laptop, which
  # saved me the download time

  config.vm.provider "virtualbox" do |vb|

    vb.memory = "4096"
    vb.cpus = 8
    vb.customize ["modifyvm", :id, "--ioapic", "on"]

  end
end
```

I didn't bother setting up provisioning properly, but here are the commands
that are needed to get `stack` working:

```bash
# Add FP Complete repo & install stack
curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/centos/6/fpco.repo | sudo tee /etc/yum.repos.d/fpco.repo
sudo yum -y install stack

# Add EPEL repo and install Docker
sudo rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum -y install docker-io

# stack requires the Docker client to be able to connect
# to the daemon without root, so add vagrant user to dockerroot group
sudo gpasswd -a ${USER} dockerroot

# At this point, you'll need to log out and back in for the group change to take effect

# Setup iptables to allow Docker links to work
sudo iptables -t filter -A DOCKER -d 172.17.0.0/16 -i docker0 -j ACCEPT
```

Adding the vagrant user to dockerroot comes with all the usual security issues,
but I'm not too worried about that here. There are some other suggestions in
the [stack documentation]
(http://docs.haskellstack.org/en/stable/docker_integration.html#docker) for how
to handle this.

### Running the build

So, we've now got stack and Docker installed. I enabled the stack Docker integration
on the VM by modifying my `~/.stack/config` file:

```
[vagrant@localhost ~]$ cat ~/.stack/config.yaml
docker:
  enable: true
```

This gives the advantage of using Docker to run the builds on the VM, while not impacting
the `yesod devel` workflow on OS X.

By default stack will use the fpco/stack-build repository to obtain an image to
run the build in. This suits me, as there is also fpco/stack-run for running your
binaries once they're compiled. The build image includes everything that's necessary
for building the whole of Stackage, whereas stack-run is more trimmed down.

Running `stack build` kicked off the build in the Docker container, which
completed successfully as all required dependencies (e.g. libpq and pg_config)
were already in the image. Thanks to FPComplete for setting up these Docker
containers for everyone to use!

### Packaging to Docker image

stack's support for creating container images is a relatively recent addition,
and currently isn't covered well in the documentation. There is a reference to the
`image` configuration section [here]
(http://docs.haskellstack.org/en/stable/yaml_configuration.html#image), which
was enough for my needs. After added the relevant bits, my `stack.yml` looks
something like:

```yaml
resolver: lts-3.20

packages:
- '.'

extra-deps: []

flags:
  mysite:
    library-only: false
    dev: false

extra-package-dbs: []

# This isn't required as it's set in the user config on the VM
# docker:
#     enable: true

image:
  container:
    name: mdjnewman/mysite
    base: fpco/stack-run
    add:
      config: /app/config
      static: /app/static
```

With that in place, running `stack image container` produced a Docker container
ready to be pushed to Docker Hub:

```
[vagrant@localhost vagrant]$ stack image container
Sending build context to Docker daemon 34.25 MB
Sending build context to Docker daemon
Step 0 : FROM fpco/stack-run
 ---> db9b2a858ef5
Step 1 : ADD ./ /
 ---> e682c572d7ed
Removing intermediate container 1ce35ed1ccea
Successfully built e682c572d7ed
```

Running a regular `docker push` published the image to the registry.

### Deploying to Digital Ocean

After all these steps, the final package was in Docker Hub and it was just a
matter of running the following commands on the droplet, and the site was live:

```bash
docker run --name=postgres -e POSTGRES_PASSWORD=$(uuidgen) -e POSTGRES_USER=postgres -d postgres:9.3

# Yes, I know UUIDs don't make the best passwords :)

docker run              \
    -d                  \
    -w /app             \
    --link postgres:postgres         \
    -p 3000:3000        \
    mdjnewman/mysite    \
    /bin/bash -c 'PGHOST=$POSTGRES_PORT_5432_TCP_ADDR PGPASS=$POSTGRES_ENV_POSTGRES_PASSWORD /usr/local/bin/mysite'
```


The last command is running the Yesod server, with environment variables set to
the values provided by Docker (see
[here](https://github.com/yesodweb/yesod/wiki/Configuration#overriding-configuration-values-with-environment-variables) for info about setting configuration variables in Yesod).

## The results

I'm very happy with the Yesod workflow, and the stack Docker integration makes
deploying a lot easier as I don't have to worry about what packages are in my
build and test environments. Seems like a good compromise between manually
copying files around and having a full CI pipeline.

Using stack with a LTS resolver and an isolated container for builds is also
the holy grail of repeatable builds!

This whole process (including writing this post) took less than a day, and I
was learning a lot along the way. Decided where was the best place to host the site
and waiting for Docker to pull the fpco/stack-build image took up most of the time!
