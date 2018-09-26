
residuals.cmp <- function(object, type = c("deviance","pearson","response"), ...){
  type <- match.arg(type)
  y <- object$y
  mu <- object$fitted.values
  nu <- object$nu
  lambda <- object$lambda
  res <- switch(type, deviance = object$d.res,
                pearson = (y-mu)/sqrt(comp_variances(lambda, nu)),
                response = y - mu
  )
  return(res)
}

logLik.cmp <- function(x,...)
{ #cat("\n'log Lik. '", x$maxl, "(df=", length(x$coefficients),")")
  out <- x$maxl
  attr(out, "df") <- length(x$coefficients)+1
  class(out) <- "logLik.cmp"
  return(out)}

nobs.cmp <- function(x,...)
{ return(length(x$nobs))}

AIC.cmp = function(x,..., k =2){
  temp <- logLik(x)
  aic <- -2*as.numeric(temp)+k*attr(temp,"df")
  return(aic)
}

print.logLik.cmp <- function(x,...){
  cat("'log Lik. ' ", x, " (df=", attr(x,"df"),")",sep="")
}


print.cmp <- function(x,...)
{
  cat("\nCall: ", paste(deparse(x$call), sep = "\n", collapse = "\n"),
      "\n", sep = "")
  cat("\nLinear Model Coefficients:\n")
  print.default(format(signif(x$coefficients,3)), print.gap = 2,quote = FALSE)
  cat("\nDispersion (nu):", x$nu)
  cat("\nDegrees of Freedom:", x$df.null, "Total (i.e. Null); ",
      x$df.residuals, "Residual")
  cat("\nNull Deviance:", x$null.deviance, "\nResidual Deviance:",
      x$residuals.deviance, "\nAIC:", format(AIC(x)), "\n\n")
}

summary.cmp <- function(x, digits = max(3L, getOption("digits") - 3L), ...)
{
  cat("\nCall: ", paste(deparse(x$call), sep = "\n", collapse = "\n"),
      "\n", sep = "")
  cat("\nDeviance Residuals:" , "\n")
  if (x$df.residual > 5) {
    residuals.dev = setNames(quantile(x$d.res, na.rm = TRUE),
                             c("Min", "1Q", "Median", "3Q", "Max"))
  }
  xx <- zapsmall(residuals.dev, digits + 1L)
  print.default(xx, digits = digits, na.print = "", print.gap = 2L)
  cat("\nLinear Model Coefficients:\n")
  cmat <- cbind(x$coefficients, x$se_beta)
  cmat <- cbind(round(cmat,4), cmat[, 1]/cmat[, 2])
  cmat <- cbind(cmat, 2*pnorm(-abs(cmat[,3])))
  colnames(cmat) <- c("Estimate", "Std.Err", "Z value", "Pr(>|z|)")
  printCoefmat(cmat, digits = 3, P.values = TRUE)
  cat("\n(Dispersion parameter for Mean-CMP(", signif(x$nu, digits), ") family taken to be 1)\n\n",
      apply(cbind(paste(format(c("Null", "Residual"), justify = "right"), "deviance:"),
                  format(unlist(x[c("null.deviance","residuals.deviance")]),
                         digits = max(5L, digits + 1L)), " on",
                  format(unlist(x[c("df.null", "df.residuals")])), "degrees of freedom\n"),
            1L, paste, collapse = " "), sep = "")
  cat("\nAIC:", format(AIC(x)), "\n\n")
}