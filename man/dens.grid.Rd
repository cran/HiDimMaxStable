\name{dens.grid}
\alias{dens.grid.maxstable}
\alias{dens.grid.excess}
\alias{dens.grid.simultoccur}
\title{Computes the likelihood function on a grid of parameters}
\description{The \code{dens.grid.*} function family is used to compute the
  likelihood at several points on a grid. \code{*} 
  must be one of the following: "\code{maxstable}", "\code{excess}" or
  "\code{simultoccur}".
}
\usage{
dens.grid.maxstable(...)
dens.grid.excess(...)
dens.grid.simultoccur(...)
}
\arguments{
  \item{...}{see details.}
}
\details{
  \code{dens.grid} specific arguments are the following:
  \describe{
    \item{\code{data}}{a matrix representing the data.}
    \item{\code{params}}{a vector giving the arguments to be passed to the
      likelihood function; \code{NA} indicates that the coordinate has
      to be replaced by multiple values on a grid (there must be two \code{NA}'s
      in the vector).}
    \item{\code{seqx,seqy}}{vectors giving the values to be used to compute the
      likelihood for the two coordinates that are set to \code{NA} in the
      \code{params} vector.}
    \item{\code{ln}}{logical. If \code{TRUE} log-density is computed.}
    \item{\code{parallel}}{logical. If \code{TRUE} a parallel computation of the log-likelihood
      function is performed, using the \code{snowfall} package (\code{sfInit} must be
      called before).}
  }
  Other arguments are passed to the likelihood function.
}
\value{
  returns a list \code{l} including parameters used in the call
  (\code{l$params}, \code{l$seqx}, \code{l$seqy}), and a matrix for the 
   computed values of the log-likelihood: \code{l$dens}.
}
\seealso{
  \code{\link{maxstable.l.clusters}}, \code{\link{excess.l}}, \code{\link{simultoccur.l}} for the likelihood functions;
  \code{\link{plot3d.densgrid}} for a 3D visualisation of the computed values of the log-likelihood.
}
\examples{
# Log density of the Max-stable distribution of the Schlather process
# with the Whittle Matern correlation function
n.site<-3
n.obs<-2
xy<-matrix(runif(2*n.site,0,2),ncol=2)
param<-c(0.5,1.5)
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, "whitmat",
    nugget = 0, range = param[1], smooth = param[2]))
cl<-build.clusters.spatial(xy)
d<-dens.grid.maxstable(data,c(NA,NA),seq(0.1,1,length=5),seq(1,2,length=5),
    category="normal",
    spatial=list(sites=xy,family=spatialWhittleMatern),
    parallel=FALSE,
    clusters=cl)
\donttest{plot3d.densgrid(d)}

\donttest{
#  Log density of the Max-stable distribution of the Brown Resnick process
n.site<-100
xy<-matrix(runif(2 * n.site, 0, 2), ncol = 2)
param<-c(0.5,1)
n.obs<-20
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, cov.mod = "brown", range = param[1], smooth = param[2]))
cl<-build.clusters.spatial(xy)
library(snowfall)
sfInit(parallel=TRUE,cpus=4)
sfLibrary(HiDimMaxStable)
d<-dens.grid.maxstable(data,c(NA,NA),seq(0.1,1,length=5),seq(0.1,1.8,length=5),
    category="lnormal",
    spatial=list(sites=xy,family=spatialPower),
    parallel=TRUE,
    clusters=cl)
sfStop()
plot3d.densgrid(d)

#   Log density of the distribution of the vector of excesses for an
# homogeneous clustered max-stable distribution
# 
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
    margins=c(marginLnorm,marginFrechet),
    classes=c(rep(1,50),rep(2,50)),
    params=c(0.5,1,1.5,1.7),n=1000)
data<-excess.censor(raw.data)
library(snowfall)
sfInit(parallel=TRUE,cpus=48)
sfLibrary(HiDimMaxStable)
d<-dens.grid.excess(data,c(NA,1,NA,1.7),
    seq(0.1,1,length=5),seq(1,2,length=5),
    category="copula",
    copulas=c(copClayton,copGumbel),
    margins=c(marginLnorm,marginFrechet),
            parallel=TRUE,
    classes=c(rep(1,50),rep(2,50)))
sfStop()
plot3d.densgrid(d)
    
# Log density of the distribution of the componentwise maxima
# with occurences for an homogeneous clustered max-stable distribution
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
    margins=c(marginLnorm,marginFrechet),
    classes=c(rep(1,50),rep(2,50)),
    params=c(0.5,1,1.5,1.7),n=1000)
data<-maxblocks(raw.data,n.blocks=20)
library(snowfall)
sfInit(parallel=TRUE,cpus=4)
sfLibrary(HiDimMaxStable)
d<-dens.grid.simultoccur(data$normalized.max,occur=data$classes.max,
    c(NA,1,NA,1.7),
    seq(0.1,1,length=5),seq(1,2,length=5),
    category="copula",
    copulas=c(copClayton,copGumbel),
    margins=c(marginLnorm,marginFrechet),
    classes=c(rep(1,50),rep(2,50)),
    parallel=TRUE)
sfStop()
plot3d.densgrid(d)
}
}
