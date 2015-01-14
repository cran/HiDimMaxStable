\name{simultoccur.l}
\alias{simultoccur.l}
\title{Likelihood for vectors of componentwise maxima with additional information on maxima occurences}
\description{
  Computes the likelihood for observations of vectors of componentwise maxima with additional information on maxima occurences.  
  The data that are used to compute componentwise maxima must belong to the maximum domain of attraction of a multivariate max-stable distribution 
  whose spectral random vector is Gaussian, Log-normal or has a
  clustered copula distribution.
}
\usage{
simultoccur.l(data,occur,ln=FALSE,...)
}
\arguments{
  \item{data}{a matrix representing the data. Each column corresponds to one observation of a vector of
    componentwise maxima. }
  \item{occur}{a matrix representing the data. Each column corresponds to one observation of a vector that 
  gives which componentwise maxima occur simultaneously.}
  \item{ln}{logical. If \code{TRUE} log-density is computed.}
  \item{...}{further arguments to be passed to \code{mubz.*} function
    (where \code{*} stands for the \code{category}
    of the model). In particular, \code{category} is a character string
    indicating
    the model to be used:
    "\code{normal}", "\code{lnormal}" or "\code{copula}", and
    \code{params} gives the values of the
    parameters for which the likelihood is computed.}
}
%\details{}
\seealso{\code{\link{mubz.normal}},\code{\link{mubz.lnormal}}, \code{\link{mubz.copula}}.}
\examples{
\donttest{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,3),rep(2,3)),
               params=c(0.5,1,1.5,1.7),n=20)

data<-maxblocks(raw.data,n.blocks=3)

d<-simultoccur.l(data$normalized.max,occur=data$classes.max,
            params=c(0.5,1,1.5,1.7),
            category="copula",
            copulas=c(copClayton,copGumbel),
            margins=c(marginLnorm,marginFrechet),
            classes=c(rep(1,3),rep(2,3)))
}
}
