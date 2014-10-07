\name{excess.censor}
\alias{excess.censor}
\title{Transforms data to normalized exceedances with censoring}
\description{First transforms empirical marginal distributions to unit
  Pareto by using order statistics, second scales to 1/t, third censor values smaller than one,
  and then drops all vectors with no value greater than one.
}
\usage{
excess.censor(z,t=10)
}
\arguments{
  \item{z}{a matrix representing the data.}
  \item{t}{a threshold value.}
}
\examples{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,10),rep(2,10)),
               params=c(0.5,1,1.5,1.7),n=1000)
data<-excess.censor(raw.data)
}