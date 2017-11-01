---
title: 'Debugging slow bash startup files'
layout: post
---

Recently I found that opening a new `bash` session (e.g. when opening a new
terminal window) was getting a bit slow on my machine.  I take reasonable care
to make sure my dotfiles don't get too crufty, and I keep them all in [version
control](https://github.com/mdjnewman/dotfiles).

The following is a walk through of how I went about debugging the issue.

---

So, how does one go about profiling what `bash` is doing when starting a login
shell/interactive shell?

My initial thought was to use some kind of system call tracing to see what
files were being opened/executed. `dtrace` exists on OS X, so let's try that:

```bash
sudo dtruss -ef bash
```

Sadly, the output isn't overly useful due to [System Integrity
Protection](https://unix.stackexchange.com/a/276219). I don't want to boot
into recovery mode, so what are our options?

I regularly add `set -o xtrace` to my bash scripts ... would the same thing
work for my `.bashrc`? I added the line, and executed `bash`:

```
+ source /Users/mnewman/.bash_profile
++ export PATH=/Users/mnewman/bin:/Users/mnewman/perl5/bin:/Users/mnewman/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/mnewman/.rvm/bin
++ PATH=/Users/mnewman/bin:/Users/mnewman/perl5/bin:/Users/mnewman/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/mnewman/.rvm/bin
++ for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}
++ '[' -r /Users/mnewman/.path ']'
++ for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}
++ '[' -r /Users/mnewman/.bash_prompt ']'
...
```

It looks like that works (the above is showing the start of my `.bash_profile`,
which is sourced from `.bashrc`). There is a lot of output there though, and we
still don't have any timing information. A little searching for variants of
`bash add timestamp to each line` led me to [an SO
answer](https://stackoverflow.com/a/9813614/415801) recommending `ts`. Looking at the manual page for `ts`:

```
$ man ts

NAME
       ts - timestamp input

SYNOPSIS
       ts [-r] [-i | -s] [format]

DESCRIPTION
       ts adds a timestamp to the beginning of each line of input.

       The optional format parameter controls how the timestamp is formatted, as used by strftime(3). The default format is "%b %d %H:%M:%S". In addition to the regular strftime
       conversion specifications, "%.S" and "%.s" are like "%S" and "%s", but provide subsecond resolution (ie, "30.00001" and "1301682593.00001").

       If the -r switch is passed, it instead converts existing timestamps in the input to relative times, such as "15m5s ago". Many common timestamp formats are supported. Note that
       the Time::Duration and Date::Parse perl modules are required for this mode to work. Currently, converting localized dates is not supported.

       If both -r and a format is passed, the existing timestamps are converted to the specified format.

       If the -i or -s switch is passed, ts timestamps incrementally instead. In case of -i, every timestamp will be the time elapsed since the last timestamp. In case of -s, the time
       elapsed since start of the program is used.  The default format changes to "%H:%M:%S", and "%.S" and "%.s" can be used as well.
```

So far so good, it looks like we could use `ts -i` and get the duration of
every command! I'd like to try this out, but how can we redirect the `xtrace`
output to `ts`?

Some further Googling led me to [this SO
answer](https://unix.stackexchange.com/a/155553), which suggests using the
`BASH_XTRACEFD` variable to tell bash where to write its `xtrace` output. After
some trial and error, I added a few lines to my `.bashrc`:

```bash
# open file descriptor 5 such that anything written to /dev/fd/5
# is piped through ts and then to /tmp/timestamps
exec 5> >(ts -i "%.s" >> /tmp/timestamps)

# https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
export BASH_XTRACEFD="5"

# Enable tracing
set -x

# Source my .bash_profile script, as usual
[ -n "$PS1" ] && source ~/.bash_profile;
```

Upon restarting bash, this produces (a lot of) output in `/tmp/timestamps`, and
each line contains an incremental timestamp, like so:

```
0.000046 ++ which brew
0.003437 +++ brew --prefix
0.025518 ++ '[' -f /usr/local/share/bash-completion/bash_completion ']'
0.000741 +++ brew --prefix
```

These particular lines tell me that a `brew --prefix` command executed and took
20ms.

With output like the above, I had enough info to track down a couple of slow loading
scripts (like sourcing `nvm.sh`) and remove them from my `.bashrc`/`.bash_profile`.

