corr <- function(directory, threshold = 0) {
  result <- integer()
  for (f in list.files(directory))
  {
    filepath <- sprintf("%s/%s", directory, f)
    dat <- read.csv(filepath)
    dat_complete <- dat[complete.cases(dat), ]
    if (nrow(dat_complete) > threshold)
    {
      result <- append(result, cor(dat_complete$sulfate, dat_complete$nitrate))
    }
  }
  result
}