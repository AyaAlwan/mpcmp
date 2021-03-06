% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize_extract.R
\name{summary.cmp}
\alias{summary.cmp}
\title{Summary of COM-Poisson Model Fit}
\usage{
\method{summary}{cmp}(object, digits = max(3L, getOption("digits") - 3L),
  ...)
}
\arguments{
\item{object}{an object class 'cmp', obtained from a call to \code{glm.cmp}.}

\item{digits}{numeric; minimum number of significant digits to be used for most numbers.}

\item{...}{other arguments passed to or from other methods  (currently unused).}
}
\description{
\code{summary} method for class \code{cmp}.
}
\details{
\code{summary.glm} tries to be smart about formatting the coefficients, standard errors 
and gives 'signifiance starts'. The \code{coefficients} component of the result gives the 
estimated coefficients and their estimated standard errors, together with their ratio. This 
third column is labelled as \code{Z value} as the dispersion is fixed for this family. A
forth column gives the two-tailed p-value corresponding to \code{Z value} based on 
the asymptotic Normal reference distribuiton.
}
\examples{
## For examples see example(glm.cmp)
}
\seealso{
\code{\link{coef.cmp}}, \code{\link{fitted.cmp}}, \code{\link{glm.cmp}}.
}
