### Introduction to Python

**Motivation:** Python is a mainstay in scientific computing. It has tonnes of
libraries you can use and build on. Can be a replacement for MATLAB, and shell
scripting, etc..

**Prerequisites:** programming experience in any other language


**What you'll learn:** writing Python scripts (using the Pycharm IDE),
using/installing packages, reading/writing files, working with lists and
dictionaries of data, numpy/scipy basics

Things to read: 

- [Software Carpentry: Programming with Python](http://swcarpentry.github.io/python-novice-inflammation/)
  Intro to Python for scientists. 

- [Codecademy: Python](http://www.codecademy.com/en/tracks/python) 
  An online and interactive course teaching language fundamentals, but not
  immediately practical stuff. 

- [Python for MATLAB users](http://wiki.scipy.org/NumPy_for_Matlab_Users)
  A "decoder ring" for NumPy if you already know MATLAB

- [NumPy Tutorial](http://wiki.scipy.org/Tentative_NumPy_Tutorial)
  A more detalied walkthrough of NumPy and doesn't assume you know MATLAB. 
  
- [Dive Into Python Book](http://www.diveintopython.net/)
  Really good book on basic Python if you're already a fluent programmer.  

- [Learn Python The Hard Way Book](http://learnpythonthehardway.org/book/)
  Good book (and online course) if you're new to Python and to programming

- [Python 2 Documentation](https://docs.python.org/2/)
  The source documentation for Python. Go here to learn the nitty-gritty for
  language features and baked-in modules. 

--------

## Why Python

- Freely available. 
- Easy to learn and to read language.
- Lots and lots of built-in and add on modules.
- Great for general purpose and scientific computing, as well as statistics,
  web, graphics, etc...
- Lots of learning material and help online (e.g.
  [stackoverflow](http://stackoverflow.com/questions/tagged/python)

### Getting started

With [Anaconda Python](http://continuum.io/downloads) installed, you have a few
options to work with Python:

  1. Run `python`, or `ipython` from the commandline, and type your code into
     the interpreter REPL (read-evaluate-print loop). You type a line of code,
     and it gets run, any result is printed, and you get prompted for more
     input. This is good for learning, or quick and dirty prototyping. It makes
     it hard to keep a record of what you've done, and make changes to your
     procedures later. 

     ![DOS python interpreter](http://www.aspylib.com/doc/_images/console.jpeg)

  2. Use an **I**ntegrated **D**evelopment **E**nvironment, like
     [PyCharm](http://jetbrains.com/pycharm). This gives you a file editor,
     interpreter REPL, debugger, visual display of variables and objects in
     memory, syntax checker, built-in help and documentation for code/modules
     you are using, etc. You'll want to use this when you start writing more
     involved python programs. 

     ![PyCharm IDE](http://twimgs.com/ddj/images/article/2010/1210/rile1.gif)

  3. Use the [IPython Notebook](http://ipython.org/notebook.html), which is a
     mashup of interpreter REPL, webpage and IDE. You write code and notes on a
     webpage, and the code can be run, and results displayed inline on that
     same webpage. It's a really great tool for exploring and analysing data,
     and keep track of what your analysis and thinking.  

     ![IPython Notebook](https://healthyalgorithms.files.wordpress.com/2012/02/capture.png)

     Using an IPython Notebook is often a good way to start building a more
     elaborate analysis script. 
     
We will use the IPython Notebook in this course because it's so easy to get
familiar with the language this way. To start your notebook, run the following: 

```sh
$ ipython notebook
```

Your web browser should open new page showing you a listing of the files and
folders in whatever folder you were in when you ran the ipython command.

![notebook browser](http://i.snag.gy/IhpOU.jpg)

Click *New Notebook* to create a new notebook, and click *Untitlted* to rename
it to something you'll remember later, e.g. "Python Workshop". 

**If you don't have Anaconda installed on your computer,** you can access the
IPython Notebook server running on my computer if you are on the *workshop*
wifi network by pointing your browser to: 

   http://192.168.1.101:8888

Create a notebook and title it with your name, e.g. "Jon Pipitone". 

### Hello World 

A good first task with any new language is to get it to print "Hello World!".
Doing so makes sure you've got everything set up correctly. 

Type `print "Hello World!" into the first cell, and then from the *Cell* menu,
choose *Run*. 

Some helpful IPython Notebook notes: 

- A **cell** is a container for a snippet of code, or notes. You can choose the
  type of cell from the dropdown menu.
- Press *Ctrl-Enter* to run the cell. 
- Press *Escape,h* to display keyboard shortcuts. 

### Hello Data

For the rest of the workshop, we'll be following along with the [Software
Carpentry Introduction to Python workshop
notes](https://github.com/swcarpentry/python-novice-inflammation).

First, download the following datafile: [inflammation-01.csv](https://raw.githubusercontent.com/swcarpentry/python-novice-inflammation/gh-pages/data/inflammation-01.csv)

Begin with the first section, [Analyzing Patient
Data](http://swcarpentry.github.io/python-novice-inflammation/01-numpy.html).

Before you go on with the tutorial, make sure you can run the first part: 

```python
import numpy
numpy.loadtxt('Downloads/inflammation-01.csv',delimiter=',')
```

### A very very brief tour of python

Python is an interpreted, weakly-typed language (no variable declarations
needed), that uses formatting as part of its syntax (i.e. indenting really
matters). 

- print to stdout: `print "hello"`, or `print("hello")`
- variable assignment: `animal = 'goat'`
- string literals: `"animal" == 'animal' == """animal"""`
- lists: `[1, 2, 3, 4]`, '[1,2,3]+[4,5,6]'
- immutable lists (aka tuples): `(1, 2, 3)`
- dictionaries/maps: `{ "apple": 1, "pear": 2 }
- loops: `for i in [1, 2, 3, 4]:`, `while condition:`
- functions: `def analyse(datafile):`
- classes: `class Analyser:`
