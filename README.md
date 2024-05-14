# mdjnewman.github.io
Jekyll project for my [personal website](http://mdjnewman.me).

Built using https://github.com/poole/lanyon

Development in a container:

```sh
docker run --rm -it -p 4000:4000 -v $(pwd):/app/ -w /app ruby bash
bundle install
bundle exec jekyll serve --host 0.0.0.0
```
