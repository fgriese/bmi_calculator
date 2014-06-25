bmi_calc <-
function(path) {

setwd(path)

q_weight <- "Wie viel kg beträgt Ihr Gewicht?\n"
q_height <- "Wie groß sind Sie in cm?\n"
q_control <- "Sind Sie sich wirklich sicher?\n"

input1 <- function(msg) {
 as.numeric(readline(q_weight))
}

input2 <- function(msg) {
 as.numeric(readline(q_height))
}

a_weight <- input1(q_weight)

while(a_weight < 5 | a_weight > 200) {
 cat(q_control)
 a_weight <- input1(q_weight)
}

a_height <- input2(q_height)

while(a_height < 50 | a_height > 230) {
 cat(q_control)
 a_height <- input2(q_height)
}

BMIoutput <- a_weight/((a_height/100)^2)

outputtext <- "\nIhr Body-Mass-Index hat den Wert: "

BMImask <- read.csv2("BMImask.csv", stringsAsFactors=FALSE, header=TRUE, sep=";")

BMImask[1, "ID"] <- 1
BMImask[1, "weight"] <- a_weight #(cat(BMImask[1, "weight"], "\n"))
BMImask[1, "height"] <- a_height #(cat(BMImask[1, "height"], "\n"))
BMImask[1, "BMI"] <- BMIoutput #(cat(BMImask[1, "BMI"], "\n"))

write.table(BMImask, file="BMIresults.csv", row.names=F)

pre <- "<html><head></head><h1 align=\"center\">BMI-Rechner (Body-Mass-Index)</h1>"
post <- "</html>"
cat(pre, outputtext, BMIoutput, post, file="BMI-Rechner.html")
# file.show("BMI-Rechner.html")

}
