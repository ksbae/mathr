\name{erfccheb}
\alias{erfccheb}
\title{Complementary error function, kept for compatibility}
\description{
Retained for backward compatibility. Forwards to \code{erfc}. 
}
\usage{erfccheb(z)}
\arguments{
  \item{z}{a real value}
}
\details{
Retained for backward compatibility. Forwards to \code{erfc}, which now uses the incomplete gamma relation over the whole range.
This function works a value at a time: \code{z} must be a single number.
Use \code{sapply} for a vector.
}
\value{
complementary error function value, the same as \code{erfc(z)}
}
\references{
  Galassi M, et al. GNU Scientific Library Reference Manual. 3rd ed. Network Theory, 2009.
  Moshier SL. Methods and Programs for Mathematical Functions. Ellis Horwood, 1989.
  Abramowitz M, Stegun IA. Handbook of Mathematical Functions. Dover, 1972.
}
\examples{
erfccheb(1)                  # same as erfc(1)
}
\author{Kyun-Seop Bae <k@acr.kr>}

