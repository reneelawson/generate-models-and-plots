#Fitting.Utilities.R
#Description: Functions created to run various correlational and model fitting statistical analysis.

#Loads .csv file and turns it into a data frame, while ommitting any NA values
load.data <- function(data.file){
	cat("Processing file", data.file, "...", "\n")
	conc.data <- read.csv(data.file, sep = "\t")
	conc.data <- na.omit(conc.data)
}

#By passing the data frame and the names of the two variables of interest as strings, the function outputs a covariance and corellation coefficient, along with full details of the correlation analysis
correlation <- function(conc.data, var1, var2){
	cat("Computing correlation indicators...", "\n")
	x <- conc.data[, var1]
	y <- conc.data[, var2]
	result1 <- cov(x, y)
	result2 <- cor(x, y)
	result3 <- cor.test(x, y, method = 'pearson')
	cat("Covariance:", result1, "\n")
	cat("Correlation coefficient:", result2, "\n")
	cat("Correlation Test:", "\n")
	return(result3)
}

#By passing the data frame and the names of the two variables of interest as strings, this function conducts a linear regression analysis, prints the summary of the model, and plots the data with the new model created
linear <- function(conc.data, var1, var2){
	cat("Fitting a Linear Model...", "\n")
	x <- conc.data[, var1]
	y <- conc.data[, var2]
	model <- lm(x ~ y)
	print(summary(model))
	plot(x, y)
	abline(model)
}


#By passing the data frame and the names of the two variables of interest as strings,this function conducts a quadratic regression analysis, prints the summary of the model, and plots the data with the new model created
quadratic <- function(conc.data, var1, var2){
	cat("Fitting a Quadratic Model", "\n")
	x <- conc.data[,var1]
	y <- conc.data[,var2]
	y2 <- (conc.data[,var2])**2
	model <- lm(x ~ y + y2)
	print(summary(model))
	xx <- seq(min(y), max(y), len = 100)
	yy <- model$coef %*% rbind(1, xx, xx*xx)
	plot(x, y)
	lines(xx, yy, lwd = 2, col = "red")
}

