## Introduction to R

**Motivation** R is a featureful and sometimes magical language for doing
statistical analysis. And it's free. This workshop won't cover much about the
stats you can do with R, but will help you get your data in order.

**Prerequisites:** programming/scripting experience in any other language (e.g.
you've used a for loop before, used functions/libraries)

**What you'll learn:** writing R scripts (using the Rstudio IDE),
using/installing packages, reading/sorting/merging/filtering tabular data (e.g.
CSV files), some basic statistics (incl. linear regression), visualising
data/models

Things to read: 

- [SWC: Programming with R](http://swcarpentry.github.io/r-novice-inflammation)
- [Quick-R](http://www.statmethods.net/)
- [ggplot2 plotting library docs](http://docs.ggplot2.org/current/)
- [R Cheat Sheet](http://cran.r-project.org/doc/contrib/Short-refcard.pdf)
- [An Introduction to Statistical Learning -- with applications in R](http://www-bcf.usc.edu/~gareth/ISL/)

### Getting started

In this workshop you'll need the following software installed on your computer: 

- [R](http://cran.utstat.utoronto.ca/) programming system 
- [Rstudio](http://www.rstudio.com/products/rstudio/download/) development
  "environment". It's a fancy tool that makes programming in R much better. 

Once installed, launch Rstudio and follow along. 

![Rstudio](http://1.bp.blogspot.com/-BCAWGBV9ze4/USjitphaQoI/AAAAAAAAMzI/-hlfvxFfbVg/s1600/Screenshot+from+2013-02-23+09%3A38%3A38.png)

Some things to note about Rstudio: 

 - Editor pane
 - Command pane
 - Environment pane
 - Help/Display pane

Download the data files we'll be using in this workshop:

 - [data.csv](http://pipitone.github.io/computing-skills/files/data.csv) 
 - [data_gi.csv](http://pipitone.github.io/computing-skills/files/data_gi.csv)

Open the data file in the Rstudio file editor: `File->Open file...`. Note how
unlovely a CSV file is when you look at it as just plain text. 

Before we go any further, open a new R script file: `File->New File->RScript`.
We'll use this to put our R code in as we go. Save the blank file to somewhere
sensible (e.g. your Desktop, your Documents folder). Call it `workshop.R`. 

### Loading data

Loading CSV data in R is easy using the `read.csv()` function: 

```r
data <- read.csv('data.csv')   # you may need to put something else, e.g. 
                               #     /User/jp/Downloads/data.csv
                               # or, 
                               #     C:\Downloads\data.csv
```

Notice: 

 - `data` variable appears in the environment. Also, check `ls()`. 
 - Click `data` to explore the variable. 
 - `<-` and `=` are mostly equivalent for assignment. 
 - Use `?read.csv` for help
 - Use `??read.csv` to search help

### Data types

R has several data types. You should at least know about: 

 - Vectors: `a = c(1,2,3,4)`. Reference using brackets, `[]`, e.g. first
   element: `a[1]` 
 - Lists: `a = list(1,2,3,4)`. Reference using double brackets, `[[]]`, e.g.
   first element: `a[[1]]`. Lists can also be "named lists", e.g. `heights =
   list(alice=180,bob=160,charlie=165)`, and reference: `heights[["alice"]]`,
   or `heights$alice`
 - Factors: a nominal vector.  `gender = factor(c("M","F"))`
 - Data frames: a table-like data structure with named columns and rows.
   Somewhat like a list of lists/vectors/factors. 

More on data.frames:

```r
# Getting one column (like a list)
data$dx
data$sex

summary(data$sex)
summary(data)

mean(data$Age)
sd(data$Age)
max(data$Age)

# Converting
data$dx = as.factor(data$dx)
as.numeric(data$dx)
```

### Merge and filter

Grabbing parts of a data.frame by indices: 

```r
data[1:10,]            # rows 1-10
data[,1:10]            # columns 1-10
data[c(1,4,7),]        # rows 1,4 and 7
data$SubjectID[1:10]   # first 10 subject IDs 
```

Filter/subset: 

```r
females = subset(data, sex = "F")

# ooooops
females = subset(data, sex == "F")    # use ==


# merging row-wise
eth1 = subset(data, ethnicity == 1)
eth2 = subset(data, ethnicity == 2)
eth1_2 = rbind(eth1,eth2)

# more complex subsets
females_eth1 = subset(data, sex == "F" & ethnicity == 1) 
```

Merging data.frames: 

```r
gi = read.csv('data_gi.csv')

merged = merge(data, gi)

merged_all_x = merge(data, gi, all.x = T)
```

## Linear models

```r
fit = lm(cerebral_vol_l ~ Age, data = data)
summary(fit)

# extract residual
res = resid(fit)
qqnorm(res)
qqline(res)
```

### Plotting

```r
plot(cerebral_vol_l ~ Age, data = data)
abline(fit)

# Now, using ggplot2
install.packages(ggplot2)
library(ggplot2)
ggplot(data = data, aes(x=Age, y=cerebral_vol_l)) + geom_point()
ggplot(data = data, aes(x=Age, y=cerebral_vol_l)) + geom_point() + geom_smooth(method='lm')


# histogram 
hist(data$cerebral_vol_l)
ggplot(data, aes(x=cerebral_vol_l)) + geom_histogram()
```
