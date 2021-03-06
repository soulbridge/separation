% Generated by roxygen2 (4.0.2): do not edit by hand
\name{calc_pppd}
\alias{calc_pppd}
\title{Partial prior predictive distribution}
\usage{
calc_pppd(formula, data, prior_sims, sep_var_name, treat_one_low = FALSE,
  X_pred_list = NULL, prior_label = NULL)
}
\arguments{
\item{formula}{A formula for a logistic regression model.}

\item{data}{A data frame.}

\item{prior_sims}{Simulations from the desired prior distribution.}

\item{sep_var_name}{The name of the separating variable.}

\item{treat_one_low}{Treat \code{sep_var_at} as the low value when computing QIs. Defaults to
TRUE. If FALSE, the \code{sep_var_at} is treated as the high value.}

\item{X_pred_list}{A named list of values at which to set variables. The function
\link{set_at_median()} facilitates creating this list.}

\item{prior_label}{The name of the prior used.}
}
\description{
\code{calc_pppd} returns the partial prior predictive
distribution for a logistic regression.
}
\details{


Researchers can use this function to convert simulations from the
prior distribution to simulations from the partial prior predictive distribution
See Rainey (2014) for the details.
}
\examples{
# load data from Barrilleaux and Rainey (2014)
data(politics_and_need)

# prior simulations
normal1 <- rnorm(10000, sd = 1)

# formula
f <- oppose_expansion ~ gop_governor + percent_favorable_aca + percent_uninsured

# convert prior simulations of the coefficient to simulations of the
#   quantitie of interest
pppd <- calc_pppd(f, data = politics_and_need, prior_sims = normal1,
                  sep_var_name = "gop_governor", prior_label = "N(0, 1)")

# plot and print summaries of the PPPD
print(pppd)

par(mfrow = c(1, 1))
plot(pppd)  # predicted probability is the default
plot(pppd, qi_name = "rr")  # risk-ratio
plot(pppd, qi_name = "fd")  # first-difference
}
\references{
Rainey, Carlisle. 2014. "Dealing with Separation in Logistic Regression
Model." Working paper. Available at \url{http://crain.co/papers/separation.pdf}.
}

