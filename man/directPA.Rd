% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/directPA.R
\name{directPA}
\alias{directPA}
\title{Direction Analysis for Pathways}
\usage{
directPA(Tc, direction, annotation, minSize=5, gene.method="OSP", 
path.method="Stouffer", visualize=TRUE, ...)
}
\arguments{
\item{Tc}{a numeric matrix. Rows are genes and columns are treatments vs control statistics.}

\item{direction}{the direction to be tested for enrichment. Either specified as a degree for 
two-dimensional analysis or as contrast (in a triplet) for three-dimensional analysis.}

\item{annotation}{a list with names correspond to pathways and elements correspond to genes belong to 
each pathway, respectively.}

\item{minSize}{the size of annotation groups to be considered for calculating enrichment. Groups 
that are smaller than the minSize will be removed from the analysis.}

\item{gene.method}{the method to be used for integrating statistics across treatments for each gene. 
Available methods are Stouffer, OSP, Fisher, and maxP. 
Default method is OSP.}

\item{path.method}{the method to be used for integrating statistics of all genes that belongs to a 
pathway. Available methods are Stouffer, OSP, Fisher, and maxP. 
Default method is Stouffer.}

\item{visualize}{whether to visualize the plot.}

\item{...}{other visualization parameters to pass on.}
}
\value{
a list that contains directional p-values for each gene and directional enrichment for each pathway.
}
\description{
The main function of direction Analysis. This function takes in a matrix of test statistics with 
two (2-dimensional space) or three (3-dimensional space) columns, the direction of interests, and 
the annotation list such as pathway annotation, and test for enrichment of pathways on the specified 
direction.
}
\examples{

# load the proteomics dataset
data(PM)

# load pathway annotations
data(Pathways)

# display reactome pathways. Could be replaced by any other pathway databases
Pathways.reactome[1:5]

# direction pathway analysis in 3-dimensional space. Implemnted as rotating by contrast
# (1) test combined effect of all 3 treatments (stimulation and inhibitions) vs control (basal) 
# on the original direction.
dPA <- directPA(Tc=PM, direction=c(1,1,1), annotation=Pathways.reactome)
dPA$gst[order(unlist(dPA$gst[,1])),][1:20,]
# rank substrates on the direciton of interest
sort(dPA$gene.pvalues)[1:20]

# (2) test combined effect of all 3 treatments vs controls on direction c(1,-1, 0)
# this rotates Ins by 0 degree, Wmn by 90 degree, and MK by 45 degree.
dPA <- directPA(Tc=PM, direction=c(1,-1,0), annotation=Pathways.reactome)
dPA$gst[order(unlist(dPA$gst[,1])),][1:20,]

# (3) test combined effect of all 3 perturbations vs controls on direction c(1,-1, 1)
# this rotates Ins by 0 degree, Wmn by 90 degree, and MK by 0 degree.
dPA <- directPA(Tc=PM, direction=c(1,-1,1), annotation=Pathways.reactome)
dPA$gst[order(unlist(dPA$gst[,1])),][1:20,]

}
