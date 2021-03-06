% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/biv.rec.np.R
\name{biv.rec.np}
\alias{biv.rec.np}
\title{Deprecated: Use \verb{bivrecNP}}
\usage{
biv.rec.np(formula, data, CI, ai, u1, u2, conditional, given.interval)
}
\arguments{
\item{formula}{A formula with six variables indicating the bivariate alternating gap time response on the left of the ~ operator and the covariates on the right.
The six variables on the left must have the same length and be given as \verb{id + episode + xij + yij + d1 + d2 ~ 1}, where:
\itemize{
 \item \verb{id}: Vector of subject's unique identifier (i).
 \item \verb{episode}: Vector indicating the observation or episode (j) for a subject (i). This will determine order of events for each subject.
 \item \verb{xij}: Vector with the lengths of time spent in event of Type I for individual i in episode j.
 \item \verb{yij}: Vector with the lengths of time spent in event of Type II for individual i in episode j.
 \item \verb{d1}: Vector of censoring indicator corresponding to Type I gap times (xij): = 1 for uncensored, and = 0 for censored gap times.
 \item \verb{d2}: Vector of censoring indicator corresponding to Type II gap times (yij): = 1 for uncensored, and = 0 for censored gap times.
}}

\item{data}{A data frame that includes all the vectors listed in the formula.}

\item{CI}{The level for confidence intervals the joint cdf, marginal survival and conditional cdf. Must be between 0.50 and 0.99. Default is 0.95.}

\item{ai}{See details.}

\item{u1}{A vector or single number to be used for the estimation of joint cdf \eqn{P(Type I gap times \le u1, Type II gap times \le u2)} in the nonparametric method.}

\item{u2}{A vector or single number to be used for the estimation of joint cdf \eqn{P(Type I gap times \le u1, Type II gap times \le u2)} in the nonparametric method.}

\item{conditional}{A logical value. If TRUE, this function will calculate the conditional cdf for the Type II gap time given an interval of the Type I gap time and the bootstrap standard error and confidence interval at the specified confidence level. Default is FALSE.}

\item{given.interval}{A vector c(v1, v2) that must be specified if conditional = TRUE. The vector indicates an interval for the Type I gap time to use for the estimation of the cdf of the Type II gap time given this interval.
If given.interval = c(v1, v2), the function calculates \eqn{P(Type II gap times \le y | v1 \le Type I gap times \le v2)}. The given values v1 and v2 must be in the range of gap times in the estimated marginal survival.}
}
\value{
See \verb{bivrecNP}.
}
\description{
Deprecated function from the previous version. Use \verb{bivrecNP}.
}
\details{
\verb{ai} indicates a real non-negative function of censoring times to be used as weights in the nonparametric method. This variable can take on values of 1 or 2 which indicate:
\itemize{
\item \verb{ai=1}: the weights are simply 1 for all subjects, \eqn{a(Ci) = 1} (default).
\item \verb{ai=2}: the weight for each subject is the subject's censoring time, \eqn{a(Ci) = Ci}.
}
}
\references{
Huang CY, Wang MC. (2005). Nonparametric estimation of the bivariate recurrence time distribution. Biometrics, 61: 392-402.
\url{doi.org/10.1111/j.1541-0420.2005.00328.x}
}
