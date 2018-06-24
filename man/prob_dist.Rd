\name{prob_dist}
\alias{prob_dist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Empirical cumulative distribution function for harvest_tolerance()}
\description{
Computes an empirical cumulative distribution function for the outcome of the Monte Carlo distributions produced by harvest_tolerance().
}


\usage{
prob_dist(productivity, net=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{productivity}{Value of annual net or gross productivity, typically in kgs}
  \item{net}{Logical - whether net productivity (default, or TRUE) or gross productivity (FALSE) is being assessed }
  }

\details{
A wrapper for the ecdf {stats} function. The edcf function draws from the data.frame "Monte.Carlo" which is sent to the global environment by harvest.tolerance().
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
  name = "Bay Duiker",
  site = "Somewhere in DRC",
  iterations = 100000,
  area = 25,
  units = "ha",
  threshold = 0,
  growth = rnorm(100000, mean=1.13, sd =0.03),
  density = runif(100000, min=10, max=100),
  biomass = rnorm(100000, mean=2.275, sd =0.386),
  offtake = 365 * rnorm(100000, mean=0.5, sd =0.1)*biomass
  )

# empirical cumulative distribution function for gross production of 20 kg
prob_dist(20, net=FALSE)

# empirical cumulative distribution function for net production of 20 kg
prob_dist(20, net=TRUE)

# empirical cumulative distribution function for net production of 20 kg (default)
prob_dist(20)
}
