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

* **Problem 1** 3.8.1 from *Computing Skills for Biologists: A Toolbox*
Description
* **Problem 2** 3.8.2 from *Computing Skills for Biologists: A Toolbox*
Description
* [My Solution/Code](Assignments/assignment-11-Csaenz10.txt)

* **Problem 3** 4.10.1 from *Computing Skills for Biologists: A Toolbox*
* [My Solution/Code](Assignments/assignment12.txt)


</p>
</details>

