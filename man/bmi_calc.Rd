\name{bmi_calc}
\alias{bmi_calc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
bmi_calc(path)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{path}{
%%     ~~Describe \code{path} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (path) 
{
    setwd(path)
    q_weight <- "Wie viel kg betr<e4>gt Ihr Gewicht?\n"
    q_height <- "Wie gro<df> sind Sie in cm?\n"
    q_control <- "Sind Sie sich wirklich sicher?\n"
    input1 <- function(msg) {
        as.numeric(readline(q_weight))
    }
    input2 <- function(msg) {
        as.numeric(readline(q_height))
    }
    a_weight <- input1(q_weight)
    while (a_weight < 5 | a_weight > 200) {
        cat(q_control)
        a_weight <- input1(q_weight)
    }
    a_height <- input2(q_height)
    while (a_height < 50 | a_height > 230) {
        cat(q_control)
        a_height <- input2(q_height)
    }
    BMIoutput <- a_weight/((a_height/100)^2)
    outputtext <- "\nIhr Body-Mass-Index hat den Wert: "
    BMImask <- read.csv2("BMImask.csv", stringsAsFactors = FALSE, 
        header = TRUE, sep = ";")
    BMImask[1, "ID"] <- 1
    BMImask[1, "weight"] <- a_weight
    BMImask[1, "height"] <- a_height
    BMImask[1, "BMI"] <- BMIoutput
    write.table(BMImask, file = "BMIresults.csv", row.names = F)
    pre <- "<html><head></head><h1 align=\"center\">BMI-Rechner (Body-Mass-Index)</h1>"
    post <- "</html>"
    cat(pre, outputtext, BMIoutput, post, file = "BMI-Rechner.html")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
