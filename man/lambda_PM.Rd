\name{lambda_PM}
\alias{lambda_PM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Lambda estimates using Slade et al's 1998 PM approach}
\description{
A calculation of the finite rate of increase (lambda) using the Slade et al (1998) "PM" model. The model is based on age of first reproduction, number of female offspring per female, maximum age of reproduction, and two pieces of empirical survival data: 1) the juvenile survival rate through to adulthood, and 2) annual survival rate for adults.

The method is equivalent to the finite rate of increase produced by a population projection matrix under the assumptions of a pality at maximum age.
}
\usage{
lambda_PM(a, b, w, la, p)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{Age of first reproduction}
  \item{b}{Number of female offspring per female}
  \item{w}{Maximum age of reproduction}
  \item{la}{Survival rate of juveniles through to adulthood (not annual survival rate)}
  \item{p}{Annual survival rate of adults}
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
# e.g. life history data from Ochotona princeps (Slade et al. 1998)

lambda_PM(
  a = 1, # age of first reproduction,
  b = 3.25, # number of female offspring per female,
  w = 6, # max age of reproduction,
  la = 0.11, # survival rate to adult (not annual),
  p =0.7,  # annual survival rate as adult
  )
}
