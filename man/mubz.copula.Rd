\name{mubz.copula}
\alias{mubz.copula}
\title{\eqn{\mu(B,z)}{mu(B,z)} for the copula model}
\description{
  Computes \eqn{\mu(B,z)}{mu(B,z)} for the copula model.
}
\usage{
mubz.copula(details=FALSE,...)
}
\arguments{
  \item{details}{get more details in the return value?}
  \item{...}{See details section.}
}
\details{\code{mubz.copula} uses \code{integrate} to compute the value of
  \eqn{\mu(B,z)}{mu(B,z)}. If \code{details} is \code{TRUE},
  \code{mubz.copula} returns the \code{integrate} return value. If
  \code{details} is \code{FALSE}, \code{mubz.copula} returns the value
  only. 
  
  The types of distributions (with scalar parameter \eqn{p}{p}) in the 'margin' class 
  are the following: \code{marginUnif} is for the Uniform distribution with support 
  \eqn{[1-p,1+p]}{[1-p,1+p]}; \code{marginLnorm} is for the Lognormal distribution whose the 
  standard deviation of the normal distribution is equal to \eqn{p}{p}; \code{marginWeibull} is for 
  the Weibull distribution with shape parameter equal to \eqn{p}{p}; \code{marginFrechet} is for 
  the Frechet distribution with shape parameter equal to \eqn{p}{p}; \code{marginGamma} is for 
  the Gamma distribution with shape parameter equal to \eqn{p}{p}; \code{marginGPD} is for the 
  GPD distribution with shape parameter equal to \eqn{p}{p}. 

  The types of Archimedean copulas are those implemented in the package copula: \code{copAMH}, 
  \code{copClayton}, \code{copFrank}, \code{copGumbel}, \code{copJoe}.

  Parameters of \code{mubz.copula}:
  \describe{
    \item{b}{ a vector of TRUE or FALSE, of length \code{d} where \code{d=length(z)}, TRUE 
      indicating the coordinates of B}
    \item{z}{ a vector of positive constants}
    \item{params}{ a vector of length \code{2*max(classes)},
      giving successively the parameters of the archimedean copula and of
      the marginal distribution for each class}
    \item{cop}{ a vector of 'acopula' objects from package \code{copula} of length \code{max(classes)} 
      giving the archimedean copulas for each class}
    \item{margins}{ a vector of objects of 'margin' class of length \code{max(classes)} 
      giving the marginal distributions for each class}
    \item{classes}{ a vector of integers indicating for each coordinate of \code{z} the number of its class
      (from 1 to \code{max(classes)})}
  }
}

\seealso{\code{\link{mubz.normal}}, \code{\link{mubz.lnormal}}}

\examples{
# In this example, we compute mu(B,z) for the independent copula
# and Frechet margins.
z<-c(2,3)
kappa<-2
mu<-numeric(2)
mu[1]<-mubz.copula(b=c(TRUE,FALSE),z=z,params=c(1,kappa),
    cop=c(copGumbel),margins=c(marginFrechet),classes=c(1,1))
mu[2]<-mubz.copula(b=c(FALSE,TRUE),z=z,params=c(1,kappa),
    cop=c(copGumbel),margins=c(marginFrechet),classes=c(1,1))
# Compares mu({1},z)+mu({2},z) with the exact value:
t(mu) \%*\% z
(sum(1/z^kappa))^(1/kappa)

# For independent components with different distributions,
# one can use any "one-dimensional" copula:
mubz.copula(b=c(TRUE,FALSE),z=z,
    params=c(1,2,1,3),cop=c(copGumbel,copGumbel),
    margins=c(marginFrechet,marginGamma),classes=c(1,2))
}
