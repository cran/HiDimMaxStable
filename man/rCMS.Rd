\name{rCMS}
\alias{rCMS}
\title{Simulation of vectors in the maximum domain of attraction 
  of an homogeneous clustered max-stable distribution}
\description{Generates realisations of vectors in the maximum domain of attraction 
  of an homogeneous clustered max-stable distribution.}
\usage{rCMS(copulas,margins,classes,params,n=100)}
\arguments{
  \item{copulas}{a vector of 'acopula' objects from package \code{copula} of length \code{max(classes)} 
    giving the archimedean copulas for each class}
  \item{margins}{a vector of objects of 'margin' class of length \code{max(classes)} 
    giving the marginal distributions for each class}
  \item{classes}{a vector of integers indicating for each component the number of its class
    (from 1 to \code{max(classes)})}
  \item{params}{a vector of length \code{2*max(classes)},
    giving successively the parameters of the archimedean copula and of
    the marginal distribution for each class}
  \item{n}{an integer giving the number of observations}
}
\details{a vector is generated as the product of two independent random variables:
  a unit Pareto random variable and a random vector whose components are independent 
  sub-vectors with distributions (copula,margin).  
}
\examples{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,10),rep(2,10)),
               params=c(0.5,1,1.5,1.7),n=1000)
data<-excess.censor(raw.data)
}
