% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OMEROServer.R
\docType{methods}
\name{searchFor,OMEROServer-method}
\alias{searchFor,OMEROServer-method}
\title{Search for OMERO objects}
\usage{
\S4method{searchFor}{OMEROServer}(server, type, scope, query)
}
\arguments{
\item{server}{The server}

\item{type}{The type of the objects to search for, e.g. Image (default: Image)}

\item{scope}{Limit the scope to 'Name', 'Description' or 'Annotation' (optional)}

\item{query}{The search query}
}
\value{
The search results (collection of OMERO objects)
}
\description{
Search for OMERO objects
}
