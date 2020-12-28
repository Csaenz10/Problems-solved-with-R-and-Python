getwd()
setwd("C:/Users/Ceejay/Documents/CSB/r")

# Repository cloned through Ubuntu
git clone https://github.com/comp-bio-master/assignment-06-Csaenz10.git

setwd("C:/Users/Ceejay/Documents/CSB/r/sandbox")

# install the EBImage package
source("http://bioconductor.org/biocLite.R")
biocLite("EBImage")

# Needed to install for EBImage package
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.11")
BiocManager::install(c("EBImage))

# load the library
library(EBImage)

# Done in Ubuntu
git add assignment-06-Csaenz10-answers.R*
git commit -m "Had trouble downloading required packages"

# Source getArea.R to get function getArea
source("../solutions/getArea.R")

# Data frame to record data
# adds area column 
# Turns off default R setting converting strings to factors
results <- data.frame(JPG = character(), area = numeric(), stringsAsFactors = FALSE)

# collects file names with .JPG
files <- list.files("../data/leafarea", pattern = ".JPG")

# Q.1 for loop, uses function getArea, and stores area in results data frame
for (f in files) {
area <- getArea(f)
results[nrow(results) + 1, ] <- c(f, area)
}
results$area <- as.numeric(results$area)

# extracts time point information 
results$tp <- substr(results$JPG, 1, 2)
results$tp <- as.factor(results$tp)

# extracts plant information
results$plant <- sapply(results$JPG, function(x) unlist(strsplit(x, "[_]|[.]"))[2])
results$plant <- as.factor(results$plant)

# Q.2 rearranges data in a new data frame and plots it
tp1 <- results[results$tp == "t1", ]$area
tp2 <- results[results$tp == "t2", ]$area
plot(tp2 ~ tp1, xlab = "Projected leaf area, tp1", ylab = "Projected leaf area, tp2")
abline(c(0,1))
# add the 1-to-1 line

# Running the t-test
t.test(tp1, tp2, paired = TRUE, alternative = "less")

# Q.3: Paired t-test
# data:  tp1 and tp2
# t = -20.01, df = 21, p-value = 1.856e-15
# alternative hypothesis: true difference in means is less than 0
# 95 percent confidence interval:
#      -Inf -6486.002
# sample estimates:
# mean of the differences 
              -7096.227 
              
# difference(-7096.227) is <0; alternative hypothesis is true
# the plants significantly differ at time points 1 and 2

# Done in Ubuntu
git add assignment-06-Csaenz10-answers.R*
git commit -m "Packages ended up working, was able to finish assignment"
git push