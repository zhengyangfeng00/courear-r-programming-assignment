complete <- function(directory, id = 1:332) {
  summary <- data.frame()
  for (i in id)
  {
    file_path <- sprintf("%s/%03d.csv", directory, i)
    dat <- read.csv(file_path)
    dat_complete <- dat[complete.cases(dat), ]
    summary <- rbind(summary, list(id = i, nobs = nrow(dat_complete)))
  }
  rownames(summary) <- 1:nrow(summary)
  summary
}