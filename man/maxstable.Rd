\name{maxstable.l.clusters}
\alias{maxstable.l.clusters}
\title{Partition-composite likelihood for multivariate max-stable distributions}
\description{
  Computes the partition-composite likelihood for observations sampled from a multivariate max-stable
  distribution whose spectral random vector is Gaussian, Log-normal or has a
  clustered copula distribution.
}
\usage{
maxstable.l.clusters(data,clusters=rep(1,dim(data)[1]),ln=FALSE,spatial=NULL,...)
}
\arguments{
  \item{data}{a matrix representing the data. Each column corresponds to one observation.
  }
  \item{clusters}{a vector of integers that gives the partition that is used to compute the 
  partition-composite likelihood. Blocks of the partition should be of size smaller or equal to 7 to avoid
  a too long computing time. \code{clusters=rep(1,dim(data)[1])} must be used to get the full
    likelihood. 
  }
  \item{ln}{logical. If \code{TRUE} log-density is computed.}
  \item{spatial}{argument passed to the \code{mubz.*} function (where
    \code{*} stands for the \code{category} of the model).}
  \item{...}{further arguments to be passed to \code{mubz.*} function
    (where \code{*} stands for the \code{category}
    of the model). In particular,  \code{category} is a character string
    indicating
    the model to be used:
    "\code{normal}", "\code{lnormal}" or "\code{copula}", and
    \code{params} gives the values of the
    parameters for which the likelihood is computed.}
}
%\details{}
\seealso{\code{\link{mubz.normal}},\code{\link{mubz.lnormal}}, \code{\link{mubz.copula}}.}
\examples{
n.site<-5
xy<-matrix(runif(2 * n.site, 0, 0.5), ncol = 2)

param<-c(0.5,1.5)
n.obs<-2
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, "whitmat",
                 nugget = 0, range = param[1], smooth = param[2]))

d<-maxstable.l.clusters(data,clusters=c(1,1,1,2,2),
                        params=param,
                        category="normal",
                        spatial=list(sites=xy,family=spatialWhittleMatern))
}
