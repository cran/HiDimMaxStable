\name{maxlik}
\alias{maxlik.maxstable}
\alias{maxlik.excess}
\alias{maxlik.simultoccur}
\title{Maximum likelihood estimation}
\description{The \code{maxlik.*} function family computes the
  maximum likelihood from data of a max-stable distribution or in the maximum
  domain of attraction of a max-stable distribution. \code{*} 
  must be one of the following: "\code{maxstable}", "\code{excess}" or "\code{simultoccur}".}
\usage{
maxlik.maxstable(...)
maxlik.excess(...)
maxlik.simultoccur(...)}
\arguments{
  \item{...}{all the arguments to be passed to the
    likelihood function including:
    \describe{
      \item{\code{data}}{a matrix representing the data}
      \item{\code{params}}{a vector giving the arguments to be passed to the
	likelihood function. \code{NA} indicates the coordinates that
	will be used for the optimization of the likelihood function.
      }
      \item{\code{start}}{a vector giving the initial values of the
	parameters}
      \item{\code{trace}}{when \code{TRUE}, prints the values where the
	likelihood function is evaluated}
      \item{\code{iterlim}}{the maximum number of iterations}
    }
  }
}
\value{
  returns a list \code{l} including the following components:
  \code{l$estimate} giving the estimated parameter values, \code{l$message} 
   giving a short message describing if the convergence is successfull, 
   \code{l$iterations} giving the number of iterations...}
\seealso{
  \code{\link{maxLik}}, \code{\link{maxstable.l.clusters}}, \code{\link{excess.l}}, \code{\link{simultoccur.l}}.}
\examples{
# ML estimation for a sample from a Schlather max-stable distribution
# (Use larger values for n.site and n.obs to get good results!)
n.site<-2
n.obs<-2
xy<-matrix(runif(2 * n.site, 0, 0.5), ncol = 2)
param<-c(0.5,1.5)
library(SpatialExtremes)
data<-t(rmaxstab(n.obs, xy, "whitmat",
                 nugget = 0, range = param[1], smooth = param[2]))
ml<-maxlik.maxstable(data,params=c(NA,NA),start=c(1,1),
                      category="normal",
                      spatial=list(sites=xy,family=spatialWhittleMatern),
                      iterlim=4)

\donttest{
# ML estimation for a sample in the max domain of attraction
# of from an homogeneous clustered max-stable distribution
#
# WARNING: these exemples are quite time-consuming, but yet need
# larger values for n and the dimensions for correct results

# A) using excess

raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,3),rep(2,3)),
               params=c(0.5,1,1.5,1.7),n=20)
data<-excess.censor(raw.data)
d<-dens.grid.excess(data,c(NA,1,NA,1.7),
                    seq(0.1,1,length=5),seq(1,2,length=5),
                    category="copula",
                    copulas=c(copClayton,copGumbel),
                    margins=c(marginLnorm,marginFrechet),
                    classes=c(rep(1,3),rep(2,3)))
plot3d.densgrid(d)
ml<-maxlik.excess(data,
                  params=c(NA,NA,NA,NA),start=c(0.5,1,1.5,1.7),
                  trace=TRUE,iterlim=20,
                  category="copula",
                  copulas=c(copClayton,copGumbel),
                  margins=c(marginLnorm,marginFrechet),
                  classes=c(rep(1,3),rep(2,3)))

# B) using block maxima with occurences

raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,3),rep(2,3)),
               params=c(0.5,1,1.5,1.7),n=10)
data<-maxblocks(raw.data,n.blocks=2)
d<-dens.grid.simultoccur(data$normalized.max,occur=data$classes.max,
                         c(NA,1,NA,1.7),
                         seq(0.1,1,length=5),seq(1,2,length=5),
                         category="copula",
                         copulas=c(copClayton,copGumbel),
                         margins=c(marginLnorm,marginFrechet),
                         classes=c(rep(1,3),rep(2,3)))
plot3d.densgrid(d)
ml<-maxlik.simultoccur(data$normalized.max,
                       params=c(NA,NA,NA,NA),start=c(0.5,1,1.5,1.7),
                       trace=TRUE,iterlim=20,
                       occur=data$classes.max,
                       category="copula",
                       copulas=c(copClayton,copGumbel),
                       margins=c(marginLnorm,marginFrechet),
                       classes=c(rep(1,3),rep(2,3)))
}
}
