\name{harvest_tolerance}
\alias{harvest_tolerance}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Estimating wildlife sustainability}
\description{
Returns a report on the sustainability of harvest using existing knowledge (real data, surrogates, and informed guestimates) using a simple Monte Carlo recombination technique. If safety margins or buffers are required these can be introduced by a threshold value in kilograms. The user can then see the likelihood of sustainability given the knowledge at hand, as well as the minimum intervention required to attain sustainability.
}
\usage{
harvest_tolerance(seed, name, iterations, area, units, growth, density, biomass, offtake)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{seed}{A number which acts as a random seed to allow replication of results}
  \item{name}{Text representing the name of the site}
  \item{iterations}{The number of resampling iterations to generate Monte Carlo estimates, good results are achieved around 100,000}
  \item{area}{The size of the study area}
  \item{units}{Text naming the units of area and density}
  \item{threshold}{User defined net productivity threshold for sustainabililty}
  \item{growth}{Samples representing the distribution of the finite rate of growth of the population}
  \item{density}{Samples representing the number of individuals within a unit area}
  \item{biomass}{Samples representing the biomass (weight) of individuals within the area}
    \item{offtake}{Samples representing the weight of individuals harvested from the area annually}
}
\details{
The left graphics panel depicts the distribution function  of the gross productivity (grey: background = "no harvest" scenario) and net productivity (foreground: black / red = "harvest" scenario) grey distribution shown in the background of the left graphics panel represents the gross productivity (no harvest). The difference between the two graphical peaks represents the impact of the harvest. If net productivity is unsustainable (i.e. < 0 by default, or the value of a set threshold) those elements display as red.

The right graphics panel depicts the distribution of each parameter contributing to the net productivity standardised by dividing by the median (not mean, as some distributions may be non-linear). The distributions shown represent the intervals between the 1st and 99th percentiles.  As a rule of thumb the measurement of offtake is the most important parameter (as it is the value which differentiates net productivity from gross producitivity). Thereafter the most variable (imprecise component) of gross productivity should be prioritised to improve the overall precision of estimate.
}

\value{
Returns a summary report of productivity / sustianability inclusive of graphical depictions of  gross and net productivity, and comparative variability of parameters. Sends a data.frame of results "Monte.Carlo" to global environment for further graphing or analysis.
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
}
