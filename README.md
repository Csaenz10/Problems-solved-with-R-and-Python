# Problems solved with R and Python
### A collection of problems I used R and Python to solve from my computational biology class.
<details><summary>R PROBLEMS</summary>
<p>

* **Problem 1** 8.23.3 from *Computing Skills for Biologists: A Toolbox* 
  * In this excersize, we will get a glimpse of the image processing capabilities of R. We want to determine the projected leaf area of plants using photos, and analyze whether the leaves have grown significantly over the course of two days. The directory CSB/r/data/leafarea/ contains images of plants at two time points (t1 and t2). The data have been collected by Madlen.
  * 1.) Write a for loop that processes all images using the function getArea, which is provided in CSB/r/solutions/getArea.R. The function accepts a single file name as an argument, and returns the projected leaf area, measured in pixels. Your loop should record the leaf area for each image and store it in the data frame results. To loop over all files, you can use the function list.files along with its pattern matching option, to produce a list of all the files with extension .jpg in the directory SC/r/data/leafarea/. Work in your sandbox or change paths in the getArea.R function accordingly.
  * 2.) Plot the area of each plant as measured ar the time point 1 verses time point 2.
  * 3.) Determine whether the plants significantly differ at the time points 1 and 2 using a paired t-test.
  * [My Solution/Code](Assignments/assignment-06-Csaenz10-answers.R)

* [Problem 2](Assignments/ageCovidSummary.R)


</p>
</details>


<details><summary>PYTHON PROBLEMS</summary>
<p>

* [Problem 1](Assignments/assignment-11-Csaenz10.txt)

* [Problem 2](Assignments/assignment12.txt)


</p>
</details>

