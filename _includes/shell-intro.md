### Introduction to the Linux Shell

**Motivation:** The shell is one of the most basic ways you can interact with a
computer and it allows you to automate your. It is often the *only* way to
interact with scientific computing environments (e.g. SCC, SciNet), so you'll
have to learn it eventually. 

**Prerequisites:** Minimal familiarity with the shell (e.g. you should know
what the commands `cd`, `ls`, `mv`, `cp`, `rm` and `man` do).

Readings: 

 - [SWC: Files and Directories](http://swcarpentry.github.io/shell-novice/01-filedir.html)

**What you will learn:** Running commands on many files (globbing, looping, if
statements), reading and writing to files, sorting/filtering data in files

--------

### Getting started

```sh 
# connect to the SCC
ssh test_user@192.168.214.10

# make a folder for yourself, and cd into it
mkdir given-name_family-name          # e.g. jon_pipitone
cd jon_pipitone

# Run a script to generate the data for this workshop
bash ~jpipitone/make-data.sh
```

### Exploring the data
The script you ran generates a phoney dataset of imaging and genetics data for
a number of subjects in a folder called `data`. Have a look around.

```sh
# for example: 
ls data
cd data
ls S000
cd ..
```

Q: How do you see what is in the demographics file? 
> ```sh
> $ cat data/S000/demographics.csv
> $ less data/S000/demographics.csv     # alternatively
>
> ```

Q: How do you find out the size of the files in a subject folder? 
> ```sh
> $ ls -l data/S000
> total 16
> -rw-rw-r-- 1 jp jp   35 Mar  9 16:05 demographics.csv
> -rw-rw-r-- 1 jp jp 5050 Mar  9 16:05 genome.dat
> -rw-rw-r-- 1 jp jp 2471 Mar  9 16:05 T1.nii
> ```

Q: How many lines are there in the `genome.dat` file? 

For this you are going to need to know a new command, `wc`, which stands for
"word count". If you run `wc file` it will print three things: the number of
characters in the file, the number of words, and number of lines. Try it. 

> ```sh
> $ wc data/S000/genome.dat
>  50   50 5050 data/S000/genome.dat
> ```

You can also use the `-l` option to only show the number of lines: 
> ```sh
> $ wc -l data/S000/genome.dat
>  50 data/S000/genome.dat
> ```

Q: How many subjects are there? 

First, make a list of the subject folders using `ls`: 

> ```sh
> $ ls data
> ```

Then, *pipe* that list into the `wc` command: 
> ```sh
> $ ls data | wc -l
> 101
> ```

Anything you pipe into `wc` gets counted. Try it with the `history` command,
for instance. 

Q: How many subjects have a `T1.nii` image? 

You can use `ls` with a wildcard to match all of the subject folders: 
> ```sh
> $ ls data/*/TI.nii      # lists all of the T1.nii files in subfolders of data
> ```

And then you can pipe into `wc -l` to count that list. 

Q: How many subjects have a `T1.nii.gz` image? 
> ```sh
> # your turn
> ```

Q: How many subjects have either a`T1.nii` or a `T1.nii.gz` image? 
> ```sh
> # your turn
> ```

Q: Which subjects don't have a T1.nii file? 
> ```sh
> # This is trickier. We'll cover this one next time. :-)
> ```

### Merging and filtering text
Since each subject had a `demographics.csv` file, it would be nice to collect
all of it into a single CSV so that we could analyse it.

- Use the `cat` command to concatenate all of the demographic data (hint: use
   a wildcard). 

     > ```sh
     > $ cat data/*/demographics.csv
     > ```

We can use the program `grep` to filter lines that match a certain pattern.
For instance, to show only the males ('`M`'), we could pipe the output to
`grep` like so: 

```sh
$ cat data/*/demographics.csv | grep M
```

- Q: How do you search for only the female subjects? 

- Q: How many male subjects are there? (hint: use `wc`)
     > ```sh
     > $ cat data/*/demographics.csv | grep M | wc -l
     > ```

- Q: How many female subjects and total # of subjects are there? (hint: use
  `wc`)


Hmm.. looks like there are some subjects we don't know the sex of. We can use
the `sort` to order text by line. Since sex is the first column, it will sort
the lines by sex. 

- Q: Sort the demographic data by piping it into the `sort` command. 
     > ```sh
     > $ cat data/*/demographics.csv | sort
     > ```

- Q: Pipe the results into `head` to show the top part of the sorted list. 

- BONUS: `sort` can sort on a specific column only, but you have to tell it how
  to find the columns in your data. If you're feeling bold, check the `man`
  page or google. 
     > ```sh
     > # to sort the second column of CSV data
     > $ cat data/*/demographics.csv | sort --field-separator=, --key=2,2
     > 
     > # By default, sort sorts everything as text. To tell it to sort
     > # numerically, pass the -n option.
     > $ cat data/*/demographics.csv | sort --field-separator=, --key=2,2 -n
     > ```

Next, we'll save the concatenated data into a file by *redirecting* the output
of the command into a file using the `>` operator. 

    ```sh
    cat *files* > master.csv
    ```
  The `>` operator takes anything the command before it prints out and prints
  it to the named file instead of displaying it on the terminal.

- Q: How would you save just the male demographic data to a file? 

- Q: How would you use `grep` to filter your data in a file? 
     > ```sh
     > # You can pipe to grep
     > $ cat master.csv | grep M
     > 
     > # Or, more simply, you can tell grep to search through the file
     > $ grep M master.csv
     > ```

### Organizing your data

In order to do some analysis you now want to collect all of your data types
into separate folders by type (i.e. put all of your genome data together in one
folder, all of your imaging data together in another, etc). 

- Make a folder for your imaging data called `genomes`
    > ```sh
    > $ mkdir genomes
    > ```

- Copy a few subject's `genome.dat` files to the `genomes` folder. 
    > ```sh
    > $ cp data/S000/genome.dat genomes/
    > $ cp data/S001/genome.dat genomes/    # oops, name conflict.. 
    > 
    > # okay, we can use copy to rename as we go
    > $ cp data/S000/genome.dat genomes/S000_genome.dat
    > $ cp data/S001/genome.dat genomes/S001_genome.dat
    > ...
    > ```

We need a way to rename our files automatically. And this is where a loop comes
in handy. 

```sh
for variable in list 



