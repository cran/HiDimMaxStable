\name{excess.l}
\alias{excess.l}
\title{Likelihood for vectors of exceedance with censored components}
\description{
  Computes the likelihood for observations of vectors of exceedances 
  that belong to the maximum domain of attraction of a multivariate max-stable distribution 
  whose spectral random vector is Gaussian, Log-normal or has a
  clustered copula distribution.
}
\usage{
excess.l(data,ln=FALSE,...)
}
\arguments{
  \item{data}{a matrix representing the data. Each column corresponds to one observation of a vector of
    exceedance with censored components. Note that all components must be larger or equal to one.}
  \item{ln}{logical. If \code{TRUE} log-density is computed.}
  \item{...}{further arguments to be passed to \code{mubz.*} function
    (where \code{*} stands for the \code{category}
    of the model). In particular, \code{category} is a character string
    indicating
    the model to be used:
    "\code{normal}", "\code{lnormal}" or "\code{copula}", and
    \code{params} 
    gives the values of the
    parameters for which the likelihood is computed.}
}
%\details{}
\seealso{\code{\link{mubz.normal}},\code{\link{mubz.lnormal}}, \code{\link{mubz.copula}}.}
\examples{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,4),rep(2,4)),
               params=c(0.5,1,1.5,1.7),n=50)
data<-excess.censor(raw.data)

d<-excess.l(data,params=c(0.5,1,1.5,1.7),
            category="copula",
            copulas=c(copClayton,copGumbel),
            margins=c(marginLnorm,marginFrechet),
            classes=c(rep(1,4),rep(2,4)))
}
