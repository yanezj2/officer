% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ppt_ph_with.R, R/ppt_ph_with_at.R
\name{ph_with_gg}
\alias{ph_with_gg}
\alias{ph_with_gg_at}
\title{add ggplot to a pptx presentation}
\usage{
ph_with_gg(x, value, type = "body", index = 1, width = NULL,
  height = NULL, location = NULL, ...)

ph_with_gg_at(x, value, width, height, left, top, ...)
}
\arguments{
\item{x}{a pptx device}

\item{value}{ggplot object}

\item{type}{placeholder type}

\item{index}{placeholder index (integer). This is to be used when a placeholder type
is not unique in the current slide, e.g. two placeholders with type 'body', the first
one will be added with index 1 and the second one with index 2.}

\item{width, height}{image size in inches}

\item{location}{a placeholder location object. This is a convenient
argument that can replace usage of arguments \code{type} and \code{index}.
See section \code{see also}.}

\item{...}{Arguments to be passed to png function.}

\item{left, top}{location of the new shape on the slide}
}
\description{
add a ggplot as a png image into an rpptx object
}
\examples{
if( require("ggplot2") ){
  doc <- read_pptx()
  doc <- add_slide(doc, layout = "Title and Content",
    master = "Office Theme")

  gg_plot <- ggplot(data = iris ) +
    geom_point(mapping = aes(Sepal.Length, Petal.Length), size = 3) +
    theme_minimal()

  if( capabilities(what = "png") ){
    doc <- ph_with_gg(doc, value = gg_plot )
    doc <- ph_with_gg_at(doc, value = gg_plot,
      height = 4, width = 8, left = 4, top = 4 )
  }

  print(doc, target = tempfile(fileext = ".pptx"))
}
}
