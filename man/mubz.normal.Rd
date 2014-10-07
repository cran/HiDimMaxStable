\name{mubz.normal}
\alias{mubz.normal}
\title{\eqn{\mu(B,z)}{mu(B,z)} for the Gaussian model}
\description{
  Computes \eqn{\mu(B,z)}{mu(B,z)} for the Gaussian model.
}
 
\usage{
mubz.normal(b,z,params=NULL,spatial=NULL,
    cor.matrix=spatial.cor.matrix(c(params,1),spatial),
    details=FALSE)
}

\arguments{
  \item{b}{ a vector of TRUE or FALSE, of length \code{d} where \code{d=length(z)}, TRUE 
    indicating the coordinates of \eqn{B}{B}}
  \item{z}{ a vector of positive constants}
  \item{params}{ a vector of length 2 that must be informed if \code{spatial}
    is given; the first component is for the range parameter and the second component
    is for the smoothness parameter}
  \item{spatial}{ the correlation model given as a list: 

\code{spatial$sites} is a matrix that gives the coordinates 
    of each location. Each row corresponds to one location. 

\code{spatial$family} is a object from the \code{spatial} class 
    that gives the spatial model. This must be one of the following family: \code{spatialWhittleMatern}
    for the Whittle Matern correlation model, \code{spatialCauchy} for the Cauchy correlation model,
    \code{spatialPowerExp} for the Power exponential model, \code{spatialBessel} for the Bessel correlation model}
  \item{cor.matrix}{ a correlation matrix if \code{spatial=NULL}}
  \item{details}{get more details in the return value?}
}

\details{\code{mubz.normal} uses \code{mnormpow} to compute the value of
  \eqn{\mu(B,z)}{mu(B,z)}. If the dimension of \eqn{z}{z} is too large (cannot exceed
   20), the computation may fail.  }

\seealso{\code{\link{mubz.lnormal}}, \code{\link{mubz.copula}}}

\examples{
# In this example, we compute mu(B,z) for Whittle Matern spatial model
# from 10 sites uniformly distributed on the square [0,2]x[0,2]
mubz.normal(b=c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE),
    z=rep(1,10),params=c(1,2),
    spatial=list(sites=matrix(2*runif(20),ncol=2),family=spatialWhittleMatern))
}
