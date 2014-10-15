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

\item{prior_label}{A character naming the prior used.}
}
\description{
\code{calc_pppd} returns the partial prior predictive
distribution for a logistic regression.
}
\details{
Calculate partial prior predictive distribution
}
