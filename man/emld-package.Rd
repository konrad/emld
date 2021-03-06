% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/emld.R
\docType{package}
\name{emld-package}
\alias{emld}
\alias{emld-package}
\title{emld: Ecological Metadata as Linked Data}
\description{
The goal of emld is to provide a way to work with EML metadata
in the JSON-LD format. At it's heart, the package is simply a
way to translate an EML XML document into JSON-LD and be able
to reverse this so that any semantically equivalent JSON-LD
file can be serialized into EML-schema valid XML.
}
\details{
The package has only three core functions:
\itemize{
\item \code{\link[=as_emld]{as_emld()}} Convert EML's \code{xml} files (or the \code{json} version created
by this package) into a native R object (an S3 class called \code{emld},
essentially just a \code{list}).
\item \code{\link[=as_xml]{as_xml()}} Convert the native R format, \code{emld}, back into
XML-schema valid EML.
\item \code{\link[=as_json]{as_json()}} Convert the native R format, \code{emld}, into \code{json}(LD).
}
}
\seealso{
Useful links:
\itemize{
  \item \url{https://github.com/ropensci/emld}
  \item Report bugs at \url{https://github.com/ropensci/emld/issues}
}

}
\author{
\strong{Maintainer}: Carl Boettiger \email{cboettig@gmail.com} (http://orcid.org/0000-0002-1642-628X) [copyright holder]

}
