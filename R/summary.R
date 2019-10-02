#' Summary of a \code{bivrecReg} Object
#'
#' @description This function provides a summary for the fit from semiparametric regression analysis.
#' @param object A \code{bivrecReg} object.
#' @param ... Additional parameters if needed.
#'
#' @export

summary.bivrecReg <- function(object, ...){

  if (!inherits(object, "bivrecReg")) stop("Must be a bivrecReg object")

  #Make summary for Chang

  if (object$method=="Chang") {
    coeffs <- object$chang_fit$fit
  } else {coeffs <- object$leefit$fit}

  coeffs<- cbind(coeffs[,1:2], coeffs[,1] / coeffs[,2],
                                rep(0, nrow(coeffs)))
  for (i in 1:nrow(coeffs)) {
    coeffs[i,4] <- round(pnorm(abs(coeffs[i,3]), lower.tail = FALSE), digits=5)
    #coeffs_df[i,5] <- significance(coeffs_df[i,4])
  }
  colnames(coeffs) <- c("Estimates", "SE", "z", "Pr(>|z|)")
  conf_lev = 1 - ((1-0.95)/2)
  CIcalc <- t(apply(coeffs[,1:2], 1, function (x) c(x[1]+qnorm(1-conf_lev)*x[2], x[1]+qnorm(conf_lev)*x[2])))

  expcoeffs <- data.frame(exp(coeffs[,1]), exp(CIcalc))
  colnames(expcoeffs) <- c("exp(coefficients)", "lower .95", "upper .95")

  ans <- list(call = object$call, n=object$data$response$n,
              coefficients = coeffs,
              expcoeffs = expcoeffs)

  class(ans) <- "summary.bivrecReg"

  return(ans)
}
