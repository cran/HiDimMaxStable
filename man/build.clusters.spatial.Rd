\name{build.clusters.spatial}
\alias{build.clusters.spatial}
\title{Builds clusters with a given maximum size using a k-means clustering.}
\description{Builds clusters from the spatial locations of sites using a k-means clustering, 
  to get a partition (of the sites) whose block sizes are at most 5 so that
  the partition-composite likelihood for observations of a max-stable process at the sites 
  can be computed in a moderate time.}
\usage{
build.clusters.spatial(xy,max.size=5,plot=FALSE)
}
\arguments{
  \item{xy}{a matrix giving the coordinates of each location. Each row
    corresponds to one location.}
  \item{max.size}{an integer giving the maximum size of the blocks of the
    returned partition.}
  \item{plot}{Whether you also whant a plot or not.}
}
\value{
  the return value is a vector of integers giving the index of the set
  for each location. 
}
\examples{
n.site<-10
xy<-matrix(runif(2 * n.site, 0, 0.5), ncol = 2)

param<-c(0.5,1.5)
n.obs<-20
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, "whitmat",
                 nugget = 0, range = param[1], smooth = param[2]))
cl<-build.clusters.spatial(xy)
\donttest{
d<-maxstable.l.clusters(data,clusters=cl,
                        params=param,
                        category="normal",
                        spatial=list(sites=xy,family=spatialWhittleMatern))
}
}
