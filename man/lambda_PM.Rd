\name{lambda_PM}
\alias{lambda_PM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Lambda estimates using Slade et al's 1998 PM approach}
\description{
A calculation of the finite rate of increase (lambda) using the Slade et al (1998) "PM" model. The model based on age of first reproduction, number of female offspring per female, maximum age of reproduction, and  two pieces of empirical survival data: 1) the juvenile survival rate through to adulthood, and annual survival rate for adults)
}
\usage{
lambda_PM(A, b, W, La, P)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{Age of first reproduction}
  \item{b}{Number of female offspring per female}
  \item{W}{Maximum age of reproduction}
  \item{La}{Survival rate of juveniles through to adulthood}
  \item{P}{Annual survival rate of adults}
  }

\details{
The function is an implementation of the  Slade et al (1998) equation which provides a more accurate estimate of the finite rate of increase for animal populations compared to that of Cole (1954) or Robinson and Redford (1991).
}
\value{
Returns an estimate of the finite rate of increase for a given poopulation based on the juvenile survival rate through to adulthood, and the adult annual survival rate.
}
\references{
Slade, N. A., Gomulkiewicz, R., & Alexander, H. M. (1998). Alternatives to Robinson and Redford's method of assessing overharvest from incomplete demographic data. Conservation Biology, 12(1), 148-155.
}
\author{
Nathan Whitmore
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
lambda_PM(
  A = 1 # age of first reproduction,
  b = 3.25 # number of female offspring per female,
  W = 6 # max age of reproduction,
  La = 0.11 # survival rate to adult (not annual),
  P =0.7  # annual survival rate as adult
  )
}
