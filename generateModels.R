#generateModels.R
#Description: Driver script that uses functions from FittingUtilities.R script to conduct various statistical tests.

#Script takes commandline arguments from the bash shell input
args <- commandArgs(trailingOnly = TRUE)

#Script sources utitlities file to utilize functions for statistical tests 
source("FittingUtilities.R")

	#Error message generated if too many or too little arguments are put in the commandline
	if (length(args) != 2){
		cat("Error: Two arguments must be specified: File name and number representing hoice of analysis", "\n", "User Example: Rscript generateModels.R concussion.csv 2", "\n")
		quit()
	}

	#Error message generated if file specified in commandline is not found in the current directory holding the driver and utility script
	if(!(args[1] %in% list.files(getwd()))){
		cat("Error: File not found!", "\n", "User Example: Rscript generateModels.R concussion.csv 2", "\n")
		quit()
	}

	#Error message generated if second argument does not match one of the three options (1, 2 or 3)
	if(!(args[2] %in% c(1, 2, 3))){
		cat("Error: Second argument must be 1, 2 or 3.", "\n", "User Example: Rscript generateModels.R concussion.csv 2", "\n")
		quit()
	}

#Data is loaded and turned into a dataframe using the load.data function
conc.data <- load.data(args[1])

#Use these variables to specify variables of interests as strings
var1 <- "Nbr.of.concussions"
var2 <- "Nbr.of.TBIs"

	#If the second argument is 1, correlational test and linear regression is performed, with results displayed in the bash shell. Plot is generated and found in working directory
	if (args[2] == 1){
		cat("-------------------------------", "\n") 
		correlation(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
		linear(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
	}

	#If the second argument is 2, correlational test and quadratic regression is performed, with results displayed in the bash shell. Plot is generated and found in working directory
	if (args[2] == 2){
		cat("-------------------------------", "\n") 
		correlation(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
		quadratic(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
	}

	#If the second argument is 3, correlational test, linear AND quadratic regression is performed, with results displayed in the bash shell. Both the linear Plot is generated and found in working directory
	if (args[2] == 3){
		cat("-------------------------------", "\n") 
		correlation(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
		linear(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
		quadratic(conc.data, var1, var2)
		cat("-------------------------------", "\n") 
	}

	#Note: Both plots will be found in the same Rplots.pdf file 

