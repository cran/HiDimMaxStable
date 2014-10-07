\name{maxblocks}
\alias{maxblocks}
\title{Computes the normalized componentwise maxima 
  with their occurrences for several blocks}
\description{Splits up the data into blocks and computes the normalized componentwise maxima 
  with their occurrences for each block}
\usage{maxblocks(y,n.blocks=50)}
\arguments{
  \item{y}{a matrix representing the data.}
  \item{n.blocks}{the numbers of blocks.}
}
\value{
  returns a list \code{l} including:
  \item{l$normalized.max}{the normalized maxima (divided by the number 
  of observation in a block}
  \item{l$classes.max}{the partitions that 
  gives which componentwise maxima occur simultaneously}
}
\examples{
raw.data<-rCMS(copulas=c(copClayton,copGumbel),
               margins=c(marginLnorm,marginFrechet),
               classes=c(rep(1,10),rep(2,10)),
               params=c(0.5,1,1.5,1.7),n=1000)
data<-maxblocks(raw.data,n.blocks=20)
}
