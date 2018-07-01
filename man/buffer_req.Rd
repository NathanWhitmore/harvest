\name{buffer_req}
\alias{buffer_req}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Estimating buffer required for harvest_tolerance()}
\description{
Computes an empirical cumulative distribution function for the outcome of the Monte Carlo distributions produced by harvest_tolerance().
}


\usage{
buffer_req(productivity, net=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{productivity}{Value of buffer/threshold for annual net or gross productivity, typically in kgs}
  \item{net}{Logical - whether net productivity (default, or TRUE) or gross productivity (FALSE) is being assessed }
  }

\details{
A wrapper for the ecdf {stats} function. The edcf function draws from the data.frame "Monte.Carlo" which is sent to the global environment by harvest_tolerance(). The function determines the proportion of the productivity estimate falling below a given threshold.
}

\value{
A proportion representing the probability of the empirical cumulative distribution function of a given productivity value.

}
\references{
See ?edcf() for orginal decsription

}
\author{
Nathan Whitmore based on the ecdf function developed by Martin Maechler.
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# harvest tolerance must first be run
harvest_tolerance(
  seed = 0,
  name = "Admiralty cuscus",
  site = "Welei",
  iterations = 100000,
  area = 21,
  units ="ha",
  threshold = 0,
  growth = rnorm(100000, mean=1.15, sd =0.03),
  density = runif(100000, min=3, max=10),
  biomass = rnorm(100000, mean=2.28, sd =0.39),
  offtake = rnorm(100000, mean=52, sd =6)
)

# empirical cumulative distribution function for gross production of 20 kg
buffer_req(20, net=FALSE)

# empirical cumulative distribution function for net production of 20 kg
buffer_req(20, net=TRUE)

# empirical cumulative distribution function for net production of 20 kg (default)
buffer_req(20)
}
