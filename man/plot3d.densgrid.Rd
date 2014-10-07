\name{plot3d.densgrid}
\alias{plot3d.densgrid}
\title{3D visualisation of the computed values of the likelihood function on a grid.}
\usage{
plot3d.densgrid(dg,...)
}
\description{
  3D vizualisation for maximum likelihood computed by \code{densgrid}.
}
\arguments{
  \item{dg}{an object returned by a \code{dens.grid} call.}
  \item{...}{further arguments passed to \code{persp3d}.}
}
\seealso{
  \code{\link{maxstable.l.clusters}}, \code{\link{excess.l}}, \code{\link{simultoccur.l}} for the likelihood functions;
  \code{\link{dens.grid.maxstable}},
  \code{\link{dens.grid.excess}} and 
  \code{\link{dens.grid.simultoccur}} for some examples.
}
