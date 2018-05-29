\name{harvest.tolerance.explainer}
\alias{harvest.tolerance.explainer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Estimating wildlife sustainability}
\description{
Graphically depicts gross productivity (no harvest) and net productivity (inclusive of harvest)
}
\usage{
harvest.tolerance.explainer(seed, name,site, iterations, area, growth, density, biomass, offtake)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seed}{A number which acts as a random seed to allow replication of results}
  \item{name}{Text representing the name of the site}
  \item{iterations}{The number of resampling iterations to generate Monte Carlo estimates, good results are achieved around 100,000}
  \item{area}{The size of the study area in square kilometers}
  \item{growth}{Samples representing the distribution of the finite rate of growth of the population}
  \item{density}{Samples representing the number of individuals within the area}
  \item{biomass}{Samples representing the biomass (weight) of individuals within the area}
    \item{offtake}{Samples representing the weight of individuals harvested from the area annually}
}
\details{
The grey distribution shown in the background represents the gross productivit (no harvest). It is from this distribution that the annual harvestable biomass is calculated. Net productivity (inclusive of harvest) is represented by the foreground distribution. The difference between the two graphical peaks represents the impact of the harvest. If net productivity is unsustainable (i.e. <0) those elements become red
}
\value{
Returns a frequency histogram and summary of gross productivity (no harvest)and net productivity (inclusive of harvest). Also returns a graphical depiction of the comparative variability of parameters.
}
\references{
%% ~put references to the literature/web site here ~
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
harvest.tolerance.explainer(
  seed = 0,
  name = "Bay Duiker",
  site = "Somewhere in DRC",
  iterations = 100000,
  area = 25,
  growth = rnorm(100000, mean=1.13, sd =0.03),
  density = runif(100000, min=10, max=100),
  biomass = rnorm(100000, mean=2.275, sd =0.386),
  offtake = 365 * rnorm(100000, mean=0.5, sd =0.1)*biomass
  )
}
