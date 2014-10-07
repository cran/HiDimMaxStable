\name{rSchlatherExcess}
\alias{rSchlatherExcess}
\title{Simulation of vectors in the maximum domain of attraction 
  of a spatial Schlather max-stable distribution}
\description{Generates realisations of vectors in the maximum domain of attraction 
  of a spatial Schlather max-stable distribution.}
\usage{rSchlatherExcess(n=500,spatial,params)}
\arguments{
  \item{n}{an integer giving the number of observations}
  \item{spatial}{ the correlation model given as a list: 

    \code{spatial$sites} is a matrix that gives the coordinates 
    of each location. Each row corresponds to one location. 

    \code{spatial$family} is an object from the \code{spatial} class 
    that gives the spatial model. This must be one of the following family: \code{spatialWhittleMatern}
    for the Whittle Matern correlation model, \code{spatialCauchy} for the Cauchy correlation model,
    \code{spatialPowerExp} for the Power exponential model, \code{spatialBessel} for the Bessel correlation 
    model}

  \item{params}{A vector of length 2 that must be informed if \code{spatial}
    is given; the first component is for the range parameter and the second component
    is for the smoothness parameter.}
}
\details{a vector is generated as the product of two independent random variables:
  a unit Pareto random variable and a Gaussian random vector whose covariance matrix is derived
  from the \code{spatial} model. The package \code{MASS} must be loaded to generate Gaussian random vectors 
}
\examples{
library(MASS)
rSchlatherExcess(n=500,
  spatial=list(sites=matrix(2*runif(20),ncol=2),family=spatialWhittleMatern),
  params=c(1,2))
}
