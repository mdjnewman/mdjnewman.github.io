https://unix.stackexchange.com/a/155553

ts, man ts shows -i opt but timing not consistent in subshells


Recently I found that opening a new `bash` session (e.g. when opening a new
terminal windo) was getting a bit slow on my machine.  I take reasonable care
to make sure my dotfiles don't get too crufty, and I keep them all in [version
control](https://github.com/mdjnewman/dotfiles).

So, how does one go about profiling what `bash` is doing when starting a login
shell/interactive shell?

My initial thought was to use some kind of system call tracing to see what
files were being opened/executed. `dtrace` exists on OS X, so let's try that:

```bash
sudo dtruss -ef bash
```

Sadly, the output isn't overly useful due to [System Integrity
Protection](https://unix.stackexchange.com/a/276219). We don't want to boot
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
TS(1)                                                                                                                                                                               TS(1)


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

ENVIRONMENT
       The standard TZ environment variable controls what time zone dates are assumed to be in, if a timezone is not specified as part of the date.

AUTHOR
       Copyright 2006 by Joey Hess <id@joeyh.name>

       Licensed under the GNU GPL.


moreutils                                                                               2017-04-19                                                                                  TS(1)
```

So far so good, it looks like we could use `ts -i` and get the duration of
every command! I'd like to try this out, but how can we redirect the `xtrace`
output to `ts`?
