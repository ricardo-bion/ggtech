#' Tech geom
#' @author Ricardo Bion
#' @export geom_tech
#'
#' @export

techGrob <- function(x, y, size, theme){

   geom_key <- list(
    airbnb = "http://logok.org/wp-content/uploads/2014/07/airbnb-logo-belo-880x628.png",
    etsy = "https://d3rnbxvnd0hlox.cloudfront.net/images/channels/64/icons/large.png",
    facebook = "http://blog.icracked.com/wp-content/uploads/2015/03/facebook-icon.png",
    twitter = "https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300",
    google = "http://logok.org/wp-content/uploads/2015/09/Google-logo-2015-G-icon.png"
    )
   
   img <- as.raster(png::readPNG(RCurl::getURLContent(geom_key[[theme[[1]]]])))

   grid::rasterGrob(x             = x,
              y             = y,
              image         = img,
              default.units = "native",
              height        = size,
              width         = size)
}



GeomTech <- ggplot2::ggproto("GeomTech", ggplot2::Geom,

  #draw_panel = function(., data, scales, coordinates, ...) {
  draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
    coords = coord$transform(data, panel_scales)
    ggplot2:::ggname("geom_tech",
      techGrob(coords$x, coords$y, coords$size, coords$theme)
    )
  },

  non_missing_aes = c("size", "theme"),
  required_aes = c("x", "y"),
  default_aes = ggplot2::aes(size=0.05, theme="airbnb"),

  icon = function(.){}, # a grob representing the geom for the webpage

  desc_params = list( # description of the (optional) parameters of draw
     ),

  seealso = list(
    geom_point = ggplot2::GeomPoint$desc
  ),

  examples = function(.) {
  }
)



geom_tech <- function(mapping = NULL, data = NULL, stat = "identity",
                       position = "identity", na.rm = FALSE,
                       show.legend = NA, inherit.aes = TRUE, ...) {
  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomTech,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}