% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_vline_interactive.R
\name{geom_vline_interactive}
\alias{geom_vline_interactive}
\title{Vertical interactive reference line}
\usage{
geom_vline_interactive(mapping = NULL, data = NULL, ..., xintercept,
  na.rm = FALSE, show.legend = NA)
}
\arguments{
\item{mapping}{The aesthetic mapping, see \code{\link[ggplot2]{geom_point}}.}

\item{data}{A data frame, see \code{\link[ggplot2]{geom_point}}.}

\item{...}{other arguments passed on to layer. See \code{\link[ggplot2]{geom_point}}.}

\item{xintercept}{controls the position of the line}

\item{na.rm}{See \code{\link[ggplot2]{geom_point}}.}

\item{show.legend}{See \code{\link[ggplot2]{geom_point}}.}
}
\description{
The geometry is based on \code{\link[ggplot2]{geom_vline}}.
See the documentation for those functions for more details.
}
\examples{
# add interactive reference lines to a ggplot -------
library(ggplot2)


g1 <- ggplot(diamonds, aes(carat)) +
  geom_histogram()

gg_vline1 <- g1 + geom_vline_interactive(
  aes(xintercept = mean(carat),
      tooltip = round(mean(carat), 2),
      data_id = carat))

dataset <- data.frame(x = rnorm(100))

dataset$clickjs <- rep(paste0("alert(\\"",
                              round(mean(dataset$x), 2), "\\")"), 100)

g2 <- ggplot(dataset, aes(x)) +
  geom_density(fill = "#000000", alpha = 0.7)
gg_vline2 <- g2 + geom_vline_interactive(
  aes(xintercept = mean(x), tooltip = round(mean(x), 2),
      data_id = x, onclick = clickjs), color = "white")

ggiraph(code = print(gg_vline1))
ggiraph(code = print(gg_vline2),
        hover_css = "cursor:pointer;fill:orange;stroke:orange;")
}
\seealso{
\code{\link{ggiraph}}
}
