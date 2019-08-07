#' @title Tech geom
#' @description most of the code is from emoGG https://github.com/dill/emoGG
#' @author Ricardo Bion
#' @export geom_tech
#'
#' @export
techGrob <- function(x, y, size, theme, geom_key = list(
  airbnb = "http://logok.org/wp-content/uploads/2014/07/airbnb-logo-belo-880x628.png",
  etsy = "https://d3rnbxvnd0hlox.cloudfront.net/images/channels/64/icons/large.png",
  facebook = "http://logok.org/wp-content/uploads/2014/10/Facebook-logo-f.png",
  twitter = "http://logok.org/wp-content/uploads/2014/08/Twitter-logo-bird_logo_2012-1024x768.png",
  google = "http://logok.org/wp-content/uploads/2015/09/Google-logo-2015-G-icon.png",
  X23andme = "https://www.23andme.com/static/img/logos/meta_logo.5f584d06594e.png"
)) {
  img <- as.raster(png::readPNG(RCurl::getURLContent(geom_key[[theme[[1]]]])))

  grid::rasterGrob(x             = x,
                   y             = y,
                   image         = img,
                   # only set height so that the width scales proportionally and so that the icon
                   # stays the same size regardless of the dimensions of the plot
                   height        = size * ggplot2::unit(10, "mm"))
}

GeomTech <- ggplot2::ggproto(`_class` = "GeomTech",
                             `_inherit` = ggplot2::Geom,
                             required_aes = c("x", "y"),
                             non_missing_aes = c("size", "theme"),
                             default_aes = ggplot2::aes(size = 1, theme = "airbnb"),

                             draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
                               coords <- coord$transform(data, panel_scales)
                               ggplot2:::ggname(prefix = "geom_tech",
                                                grob = techGrob(x = coords$x,
                                                                y = coords$y,
                                                                size = coords$size,
                                                                theme = coords$theme))
                             })

#' @title Tech Icon Ggplot Layer
#' @description The geom is used to create scatterplots but with a Tech Company logo instead of the
#'   points. See \code{?ggplot2::geom_points} for more info. This geom works exactly the same as
#'   that geom except you cannot change the color as it is a PNG.
#' @inheritParams ggplot2::geom_point
#' @export
#' @examples \dontrun{
#'   sample.data <- data.frame(x = c(1:4, 1:4), y = c(1:4, 1.5:4.5), z = c(rep("A", 4), rep("B", 4)))
#'   ggplot2::ggplot(sample.data) +
#'   geom_tech(ggplot2::aes(x = x, y = y, size = z))
#' }
geom_tech <- function(mapping = NULL,
                      data = NULL,
                      stat = "identity",
                      position = "identity",
                      ...,
                      na.rm = FALSE,
                      show.legend = NA,
                      inherit.aes = TRUE) {
  # this was copy and pasted from ggplot2::geom_point, with GeomPoint replaced with GeomTech
  ggplot2::layer(data = data,
                 mapping = mapping,
                 stat = stat,
                 geom = GeomTech,
                 position = position,
                 show.legend = show.legend,
                 inherit.aes = inherit.aes,
                 params = list(na.rm = na.rm, ...))
}
