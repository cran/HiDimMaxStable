\name{select.mean}
\alias{select.mean}
\title{Selects vectors for which the mean of the components is larger than a threshold}
\description{For a matrix, first computes the mean of each column, second drop all column 
  whose mean is less than a threshold, third returns the radial-angular decompositions}
\usage{select.mean(data,t)}
\arguments{
  \item{data}{a matrix representing the data.}
  \item{t}{a threshold value.}
}
\value{
  returns a list \code{l} including:
  \item{l$selected}{the normalized selected vectors (divided by the threshold)}
  \item{l$u}{their angular part}
  \item{l$gamma}{their radial part}
}
\seealso{
  \code{\link{excess.censor}}}

\examples{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,10),rep(2,10)),
               params=c(0.5,1,1.5,1.7),n=1000)
data<-select.mean(raw.data,t=10)
}
