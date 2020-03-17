# notes

## Table of Contents

1. __CS260 - Computer Architecture II__

      * Taught by Pavel Shostak,
[Syllabus](https://github.com/joshnatis/notes/blob/master/260/syllabus/cs260_syllabus.pdf)
         * [Lecture 2](https://github.com/joshnatis/notes/blob/master/260/lecture2_260.pdf)
         * [Lecture 3](https://github.com/joshnatis/notes/blob/master/260/lecture3_260.pdf)
         * [Lecture 4](https://github.com/joshnatis/notes/blob/master/260/lecture4_260.pdf)
         * [Lecture 5](https://github.com/joshnatis/notes/blob/master/260/lecture5_260.pdf)
         * [Lecture 6](https://github.com/joshnatis/notes/blob/master/260/lecture6_260.pdf)
         * [Lecture 7](https://github.com/joshnatis/notes/blob/master/260/lecture7_260.pdf)
         * [Lecture 8](https://github.com/joshnatis/notes/blob/master/260/lecture8_260.pdf)
         * [Lecture 9](https://github.com/joshnatis/notes/blob/master/260/lecture9_260.pdf)
         * [Lecture 10](https://github.com/joshnatis/notes/blob/master/260/lecture10_260.pdf)
         * [Lecture 11](https://github.com/joshnatis/notes/blob/master/260/lecture11_260.pdf)



2. __CS265 - Computer Theory I__

    * Taught by Jaime Canizales,
[Syllabus](https://github.com/joshnatis/notes/blob/master/265/syllabus/cs265_syllabus.pdf)
         * [Lecture 1](https://github.com/joshnatis/notes/blob/master/265/lecture1_265.pdf)

3. __CS335 - Software Design and Analysis III__

    * Taught by Anita Raja,
[Syllabus](https://github.com/joshnatis/notes/blob/master/335/syllabus/cs335_syllabus.pdf)
         * [Lecture 1](https://github.com/joshnatis/notes/blob/master/335/lecture1_335.pdf)

## Background Information

This repository contains my notes for the aforementioned classes. The notes are typeset with `groff`.
Why? you might ask. To quote Andy Tanenbaum of MINIX (and Linus flame war) fame: 

> What's wrong with LaTeX?
> Nothing, but real authors use troff.

But really, I was desperate to set up a command-line note taking system that would allow me to __bold__ words and
output my result as a PDF. As it turns out, this wasn't so easy (of course, there's `pandoc` and `rmarkdown` and other
`LaTeX`-y stuff, but I don't have enough space on my computer to download anything bulky). I finally settled on `groff` and
`cupsfilter`, which were both already installed by default on my system (macintosh).

## Technical Information

When you start to use `groff`, you need to pick which set of macros you'll be using (macros are pretty
much the formatting options available to you). I chose the 'ms' macros.

__5 Steps to Perfection__
1. create a file named `filename.ms`
    * check out [my script](https://github.com/joshnatis/notes/blob/master/scripts/nota) that prefills some information into the file
2. check the macros available to you
    * check out [my script](https://github.com/joshnatis/notes/blob/master/scripts/cheatsheet) that lists out some of the common ms macros, for reference
3. type your document
4. compile `filename.ms` into postscript with `groff` (or skip steps 4 and 5 by using [my script](https://github.com/joshnatis/notes/blob/master/scripts/gack))
    * `groff -ms filename.ms > filename.ps`
5. convert the postscript file to PDF with `cupsfilter`
    * `groff` provides functionality to convert postscript to PDF, but it was apparently not installed on my system
    * `cupsfilter filename.ps > filename.pdf`
    * `rm filename.ps`
    
__A More Convenient Setup__
1. Use vim
2. Add the following to your `.vimrc` (after downloading my `gack` script and adding it to your PATH)
    * `nnoremap ,, :w<CR>:!gack %<CR><CR>`
    * this binds a double-tap of the comma key to save your file, compile it, turn it into a pdf, and open it
3. create a file with my `nota` script, edit it with vim (reference the `cheatsheet` script output), then compile with `,,`

## scripts

`nota` - create .ms file with some prefilled information (and open it in vim)
* `nota hello.ms`, `nota hello.ms cs265`
 
`gack` - compile a .ms file into a PDF
* `gack hello.ms`
 
`cheatsheet` - print out common groff-ms macros
* `cheatsheet`
