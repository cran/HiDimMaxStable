\name{maxgrid}
\alias{maxgrid}
\title{Identifies the coordinates of the maximum on a grid}
\description{Finds the maximum likelihood point from a maxgrid object.}
\usage{maxgrid(dg)}
\arguments{
  \item{dg}{an object returned by a \code{dens.grid} call.}
}
\value{
  returns a list \code{l} including parameters used in the \code{dens.grid} call of \code{l$params},
  the coordinates of the maximum on the grid \code{l$xy}, and the value of the maximum \code{l$value}.}
\seealso{
  \code{\link{plot3d.densgrid}} for a 3D visualisation of the computed values on the grid.
}
\examples{
n.site<-3
xy<-matrix(runif(2 * n.site, 0, 0.5), ncol = 2)
param<-c(0.5,1.5)
n.obs<-2
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, "whitmat",
                 nugget = 0, range = param[1], smooth = param[2]))
d<-dens.grid.maxstable(data,c(NA,NA),seq(0.1,1,length=5),seq(1,2,length=5),
                       category="normal",
                       spatial=list(sites=xy,family=spatialWhittleMatern))
maxgrid(d)$xy
}
