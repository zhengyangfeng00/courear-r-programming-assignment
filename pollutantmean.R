pollutantmean <- function(directory, pollutant, id = 1:332) {
    dat <- data.frame()
    for (i in id)
    {
        file_path <- sprintf("%s/%03d.csv", directory, i)
        dat <- rbind(dat, read.csv(file_path)) 
    }
    if ("sulfate" == pollutant)
    {
        mean(dat$sulfate, na.rm = TRUE)
    }
    else
    {
        mean(dat$nitrate, na.rm = TRUE)  
    }
}