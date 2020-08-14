library(readr)
library(magick)
library(OpenImageR)

#Loading raw hip hop data
unfile="https://raw.githubusercontent.com/sjockers/bbc-best-rapmusic/master/data/polls.csv"
polls <- read_csv((url(unfile)))

unfile2="https://raw.githubusercontent.com/sjockers/bbc-best-rapmusic/master/data/ranking.csv"
rank <- read_csv((url(unfile2)))

#Loading image 
img <- image_read("https://images.unsplash.com/photo-1546528377-9049abbac32f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&dl=ben-wiens-Qcl98B8Bk3I-unsplash.jpg")

#Convert image to a bitmap 
img <- as.numeric(img[[1]])

#Check dimensions of bitmap image 
dim(img)

#Check that image is working 
image(img)
