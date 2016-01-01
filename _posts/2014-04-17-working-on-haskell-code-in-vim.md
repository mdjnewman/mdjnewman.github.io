---
title: Working on Haskell code in vim
layout: post
---

I decided to get a fresh vim install properly set up for some Haskell development, and went down the road of using [hdevtools][1], [vim-hdevtools][2] and [Syntastic][3]. Below are notes on some issues I encountered setting up vim-hdevtools.

* * *

The instructions on the GitHub page for hdevtools & vim-hdevtools linked above are simple enough, but I ran into a couple of issues. I’m using the sandbox feature added in Cabal 1.18, and by default hdevtools doesn’t know to look for a .cabal-sandbox folder. So, when I tried to use any of the hdevtools commands, I received an error message similar to the following:

    Error loading targets
    (file):
    Could not find module `(module)'
    Use -v to see a list of the files searched for.

This is an issue that a few people have run into, and I found a link to [this solution][4] in the archives of the [#Haskell][5] IRC channel.
Adding it to my .vimrc seems to have fixed this error, and I can now use all the hdevtool commands in vim. I’m still having issues with 
\*.cabal files that specify default-extensions (vim-hdevtools doesn’t seem to pick these up).

Also, if you get an error message similar to the following:

    E492: Not an editor command: ...

make sure that hdevtools is on your path and that you have plugin files for specific file types enabled by adding

    filetype plugin on

to your .vimrc.

 [1]: https://github.com/bitc/hdevtools "hdevtools on GitHub"
 [2]: https://github.com/bitc/vim-hdevtools "vim-hdevtools on GitHub"
 [3]: https://github.com/scrooloose/syntastic "syntastic on GitHub"
 [4]: http://lpaste.net/94999 "vim config for hdevtools and cabal sandboxes"
 [5]: http://www.haskell.org/haskellwiki/IRC_channel "View source for IRC channel - HaskellWiki"