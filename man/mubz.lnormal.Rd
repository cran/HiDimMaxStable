\name{mubz.lnormal}
\alias{mubz.lnormal}
\title{\eqn{\mu(B,z)}{mu(B,z)} for the Log-normal model}
\description{
  Computes \eqn{\mu(B,z)}{mu(B,z)} for the Log-normal model.
}
 
\usage{
mubz.lnormal(b,z,params=NULL,spatial=NULL,
    cov.matrix=spatial.cor.matrix(params,spatial),
    details=FALSE)
}

\arguments{
  \item{b}{ a vector of \code{TRUE} or \code{FALSE}, of length \code{d} where \code{d=length(z)}, TRUE 
    indicating the coordinates of \eqn{B}{B}}
  \item{z}{ a vector of positive constants}
  \item{params}{a vector of length 2 if \code{spatial=spatialPower} (Brown-Resnick max-stable process): the first component is for the range parameter, 
         the second component is for the smoothness parameter.

   a vector of length 3 for the other \code{spatial} models (Geometric Gaussian max-stable process): the first component is for the range parameter, 
    the second component is for the smoothness parameter and the third component is for the scale parameter 
    }
  \item{spatial}{  the correlation model given as a list:

  \code{spatial$sites} is a matrix that gives the coordinates of each location. Each row corresponds to one
  location. 

  \code{spatial$family} is a object from the \code{spatial} class 
    that gives the spatial model. This must be one of the following family: 

   - Brown-Resnick max-stable process: \code{spatialPower}

   - Geometric Gaussian max-stable process: \code{spatialWhittleMatern}
    for the Whittle Matern correlation model, \code{spatialCauchy} for the Cauchy correlation model,
    \code{spatialPowerExp} for the Power exponential model,
    \code{spatialBessel} for the Bessel correlation model
        }
	\item{cov.matrix}{ a covariance matrix if \code{spatial=NULL}}
	\item{details}{get more details in the return value?}
}

\details{\code{mubz.lnormal} uses \code{pmnorm} to compute the value of
  \eqn{\mu(B,z)}{mu(B,z)}. If the dimension of \code{z} is too large (cannot exceed
   20), the computation may fail.  }

\seealso{\code{\link{mubz.normal}}, \code{\link{mubz.copula}}}

\examples{
# In this example, we compute mu(B,z) for Brown Resnick spatial model
# from 10 sites uniformly distributed on the square [0,2]x[0,2]
mubz.lnormal(b=c(TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE,FALSE,TRUE),
    z=rep(1,10),params=c(1,1),
    spatial=list(sites=matrix(2*runif(20),ncol=2),family=spatialPower))
}
