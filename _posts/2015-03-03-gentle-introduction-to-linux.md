---
published: true
layout: post
title: "Gentle Introduction to Linux"
---

Download the slides I presented with:

- http://pipitone.github.io/computing-skills/files/slides_gentle_intro_to_linux_march_2015.pdf


### Operating Systems

An operating system (OS) is one of the most basic bits of software that sits
between you and the computer hardware. It "operates" the "system". Windows, or
Mac OS X are both familiar examples of operating systems. An operating system
allows you to do very fundamental things like: 

  - display things on your monitor
  - react to typing and mouse movements
  - read/write files from your harddrive
  - connect to the internet

### The Unix/Linux Operating Systems

Unix is an operating system developed in the 1970s. Linux is an open source
clone of Unix. Linux is widely used in scientific computing because it is
freely available, has a large community of users and developers, and many
scientific computing tools are available for it. 

Mac OS X is also started as a clone of Unix, and so shares many of the same
features. 

### What is the SCC? 

The [Specialised Computing Cluster (SCC)](http://info2.camh.net/scc) is a
research computer located at CAMH.  Actually, it is several computers
"clustered" together to make it easy to divide up computing work among them.
This becomes important when you have lots of data, or many different tasks to
perform, or both and a single computer does not have the power to do your work
in a reasonable amount of time. 

Linux (specifically a flavour of linux called CentOS) is the operating system
for the SCC.

Every CAMH researcher can apply for access to the SCC. If you are interested,
send an email to david.rotenberg@camh.ca. 

### The terminal / the shell / the command line

aka the scary black window. 

In Windows and Mac OS X, you pretty much only use the operating system through
the desktop, by pointing and clicking with your mouse, etc. For scientific
computing, you will often want to also use a command-line interface -- that is,
you will want a way of typing out the commands you want the computer to do,
rather than gesturing with your mouse. 

Why? Because:

  - Many tools are *only* available as command line tools
  - It is faster when you get used to it. 
  - It is more precise. 
  - You can automate what you you want to do. That is, you can record every
    step you take, and "play it back" on new datasets.
  - The SCC and other compute clusters often only allow you command-line access
    (ie. no desktop). 

The **shell** is just a program. It is an interactive command-line interface we
will use to do work and run other programs, and it is what the next two
workshops focus on. It is called the 'shell' because on the surface you use it
by typing, but inside it speaks directly to the operating system. Not a very
good name, I know.  There are different kinds of shells; we will use `bash`. 

The **terminal** is the program used to display the shell and allow you to
interact with it. In Windows, you will need to install
[cygwin](http://cygwin.com) to get a terminal window for a `bash` shell, and in
Mac OS, you can use the Terminal program. 

### SSH: the secure shell for remote access

SSH is a program that allows you to remotely connect to another computer and
start a shell on it in order to do work. It is what you will have to use in
order to access the SCC. 

  - On Windows, use [mobaxterm](http://mobaxterm.mobatek.net) for SSH
  - On Mac, use Terminal

To connect to the SCC (if you are on the CAMH network): 

    ssh test_user@scc.pipitone.ca

Use the password: `scc_user`

### The filesystem: how files and folders are organized on linux

  - folders are organized in a heirarchy, a tree structure, with folders and
    files inside of folders. 
  - `/` is the top most folder. It is called the "root" folder. 
  - Each file and folder can be exactly named using its **path**, e.g. 
    - `/home`, `/home/jp`, `/home/jp/Documents/paper.doc`

### A brief tour of the shell

Basic commands: 

  - `who`, `whoami`
  - `pwd`: **p**rint **w**orking **d**irectory 
  - `ls`: list files in a folder
  - `cd`: change directory, e.g. `cd /home`
  - `mkdir`: make a directory, e.g. `mkdir newdir`
  - `touch`: make an empty file, e.g. `touch file.txt`
  - `cp`: make a copy of a file, e.g. `cp file.txt copy.txt`
  - `mv`: move a file to a new location, e.g. `mv file.txt renamed.txt`
  - `rm`: remove a file, or folder, e.g.  `rm file.txt`, `rm -i file.txt`, `rm -rf newdir`
  - edit a file using: `nano file.txt`
  - Command history - up key, ```history``` command
  - getting help: `man`, `help`

Relative paths: 

  - `ls .`, `ls ..`, `ls /`, `ls ./`
  - `ls /home/jp/../`, `ls /home/jp/../..`
  - `mkdir ./newdir`
