.f <- function(){

dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data") ## this unzips the file in the working directory

list.files("diet_data") ## this should unzip the five files in the working directory

}

### for now we save this in a unused function inorder to prevent computer from downloading the file everytime we execute the program.
readKey <- 0
if (readKey == 1) {
andy <- read.csv("diet_data/Andy.csv")

length(andy$Day)     ## this gives us the number of rows looking specifically at the number of days.
        # 30 rows,  note length(andy[ ,1]) also work.
## we could have also used dim(andy) to find the dimentions of the data frame

## the last few commands give us a feel for what the data looks like.
}
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end

print(andy_loss)

# now we want to look at all the participants
files_full <- list.files("diet_data", full.names = TRUE) 
        ## this creats a string vector with the names of all the files in "diet_data"
        ## note we need to direct R to the directory inside diet_data --> this is what fill.names is for 

## what if we want to create a dataframe with the data of all the participants?

weightmedian <- function(directory, day) {
        files_list <- list.files(directory, full.names = TRUE)
        dat <- data.frame() ## this creates an empty dataframe we need someplace to brind the participant data
        for(i in 1:length(files_full)) {
                ## loops through the files, row-binding them together
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day), ]         # Subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm = TRUE)            # identifies the meduan weight
                                                                # while stripping out the NAs
}

