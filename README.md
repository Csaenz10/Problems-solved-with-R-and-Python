# Problems solved with R and Python
### A collection of problems I used R and Python to solve from my computational biology class.
<details><summary>R PROBLEMS</summary>
<p>

* **Problem 1** 8.23.3 from *Computing Skills for Biologists: A Toolbox* In this excersize, we will get a glimpse of the image processing capabilities of R. We want to determine the projected leaf area of plants using photos, and analyze whether the leaves have grown significantly over the course of two days. The directory CSB/r/data/leafarea/ contains images of plants at two time points (t1 and t2). The data have been collected by Madlen.
  * a.) Write a for loop that processes all images using the function getArea, which is provided in CSB/r/solutions/getArea.R. The function accepts a single file name as an argument, and returns the projected leaf area, measured in pixels. Your loop should record the leaf area for each image and store it in the data frame results. To loop over all files, you can use the function list.files along with its pattern matching option, to produce a list of all the files with extension .jpg in the directory SC/r/data/leafarea/. Work in your sandbox or change paths in the getArea.R function accordingly.
  * b.) Plot the area of each plant as measured ar the time point 1 verses time point 2.
  * c.) Determine whether the plants significantly differ at the time points 1 and 2 using a paired t-test.
  * [My Solution/Code](Assignments/assignment-06-Csaenz10-answers.R)

* **Problem 2** We will be analyzing the `age_count_2020-07-13_2020-10-11.xlsx` data set. This data consists of the date that a COVID-19 test from somebody residing in Nueces County comes back positive (LABDATE) the age of the person (AGE_YEARS). Each row is a person.  There are 4 worksheets in the excel workbook, one per month from July to October. Your goal is to complete the tasks and create an R script that will work when this repo is cloned to any computer. I encourage you to make tidyverse pipelines, where the responses from several questions are assembled in one or a few pipelines. When you are complete, submit by pushing the changes to github. 
  * Create an R script named `ageCovidSummary.R` in your exam repo and set the working directory with the following command: setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  * Load the following libraries (install if necessary):
    * tidyverse
    * readxl
    * janitor
    * lubridate
  * Referring to lecture 8 (some code will need to be altered), read the data from age_count_2020-07-13_2020-10-11.xlsx into a tibble named covid_cases_age and then do the following in a single pipeline:
    * format the column names
    * make a new column called date and format it as YYYY-MM-DD using ymd()
    * make a new column called age_class that evaluates the the values in age_years and assigns them to the proper 20 yr age bin: 0-19, 20-39, 40-59, 60-79, 80+
      * use case_when() for this
    * group the tibble by date and age_class
    * use summarise() to transform the tibble so that each row is a unique combination of date and age_class, and the number of positive cases in each age class on each date is stored in a column called new_cases
    * If done properly, this is how covid_cases_age will look:
* [My Solution/Code](Assignments/ageCovidSummary.R)


</p>
</details>


<details><summary>PYTHON PROBLEMS</summary>
<p>

* **Problem 1a** 3.8.1 Measles Time Series from *Computing Skills for Biologists: A Toolbox*
In their article, Dalziel et al. (2016) provide a long time series reporting the number of cases of measles before mass vacination, for many US cities. The data consist of cases in a given US city for a given year, and a given biweek of the year (i.e., first two weeks, second two weeks, etc.). The time series is contained in the file Dalziel2016_data.csv.
  * a.) Write a program that extracts the names of all the cities in the database (one entry per city).
  * b.) Write a program that creates a dictionary where the keys are the cities and the values are the number of records (rows) for that city in the data.
  * c.) Write a program that calculates the mean population for each city obtained by averaging the values of pop.
  * d.) Write a program that calculates the mean population for each city and year.
* **Problem 1b** 3.8.2  Red Queen in Fruit Flies from *Computing Skills for Biologists: A Toolbox* 
Singh et al. (2015) show that, when infected with a parasite, the four genetic lines of *D. melanogaster* respond by increasing the production of recombinant offspring (arguably, trying to produce new recombinants able to escape the parasite). They show that the same outcome is not achieved by artificially wounding the flies. The data needed to replicate the main claim (figure 2 of the original article) is contained in the file Singh2015_data.csv. Open the file, and compute the mean RecombinantFraction for each *Drosophilia* Line, and InfectionStatus (W for wounded and I for infected). Print the results in the following form:
Line 45 Average Recombination Rate:
W : 0.187
I : 0.191
* [My Solution/Code](Assignments/assignment-11-Csaenz10.txt)

* **Problem 2** 4.10.1 Assortative Mating in Animals from *Computing Skills for Biologists: A Toolbox*
Jiang et al. (2013) studied the assortative mating in animals. They compiled a large database, reporting the results of many experiments on mating. In particular, for several taxa they provide the value of correlation among the sizes of the mates. A positive value of r stands for assortative mating (large animals tend to mate with large animals), and a negative value for disassortative mating.
  * a.) You can find the data in good_code/data/Jiang2013_data.csv. Write a function that takes as input the desired Taxon and returns the mean value of r.
  * b.) You should see that fish have a positive value of r, but that this is also true for other taxa. Is the mean value of r especially high for fish? To test this, compute a *p-value* by repeatedly sampling 37 values of r(37 experiments on fish are reported in the database) at random, and calculating the probability of observing a higher mean value of r. To get an accurate estimate of the *p-value*, use 50,000 randomizations.
  * c.) Repeat the procedure for all taxa.
* [My Solution/Code](Assignments/assignment12.txt)


</p>
</details>

