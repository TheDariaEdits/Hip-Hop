library(readr)
library(magick)
library(OpenImageR)

#Loading raw hip hop data
unfile="https://raw.githubusercontent.com/sjockers/bbc-best-rapmusic/master/data/polls.csv"
polls <- read_csv((url(unfile)))

unfile2="https://raw.githubusercontent.com/sjockers/bbc-best-rapmusic/master/data/ranking.csv"
rank <- read_csv((url(unfile2)))

#Loading image 
img <- image_read("/Users/dariamalone/Documents/Code/Hip-Hop/9dcf6b62ca56d16105e5145d38b4b3a7-removebg-preview.png")

#Convert image to a bitmap 
img <- as.numeric(img[[1]])

#Check dimensions of bitmap image 
dim(img)

img <- img[,,1] 

#Number of zeros 
n_zeros <- length(img[img == 0])
n_zeros

#Down sample, this takes some time due to the amount of down sampling required
targetPixels <- 311
for (i in seq(1,1000,0.0001)){
  
  img2 <- down_sample_image(img, i)
  n_zeros2 <- length(img2[img2 == 0])
  
  if (n_zeros2 == targetPixels){
    break
  } 
  
}


#Check that image is working 
image(img2)

# Rotate image
rotate <- function(x) t(apply(x, 2, rev))
img2 = rotate(img2)

# Extract matrix coordinates of 0's
coords <- as.data.frame(which(img2 == 0, arr.ind=TRUE))
names(coords) <- c("PixelX", "PixelY")

#Send coords to a csv file
write_csv(coords,"/Users/dariamalone/Documents/Code/Hip-Hop/Coords.csv", col_names = TRUE)
