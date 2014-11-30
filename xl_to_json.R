library(XLConnect)
library(jsonlite)
wb<-loadWorkbook(choose.files())
sheet<-readline(prompt="Enter the Sheet name: ")
if_result<-readline(prompt="Do you want to read the entire Sheet? [y/n]: ")
if(if_result == 'y')
{
	data<-readWorksheet(wb, sheet=sheet)
} else {
	startRow<-readline(prompt="Enter the Start Row Number: ")
	endRow<-readline(prompt="Enter the End Row Number: ")
	startCol<-readline(prompt="Enter the Start Column Number: ")
	endCol<-readline(prompt="Enter the End Column Number: ")
	data<-readWorksheet(wb, sheet=sheet, startRow = as.integer(startRow), endRow = as.integer(endRow), startCol = as.integer(startCol), endCol = as.integer(endCol))
}
#output_dest<-readline(prompt="Enter the Destination Path of the output file: ")
json_data<-prettify(toJSON(data))
cat(json_data,file="JSON_output.json")