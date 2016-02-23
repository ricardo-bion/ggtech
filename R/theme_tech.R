
##########
#' tech theme
#' 
#' @export
#' @name theme_tech
#' @author Ricardo Bion
#' @title Tech themes  for ggplot2
#' @examples
#' theme_tech(theme="etsy")

theme_tech <- function(theme="airbnb", tech_key = list(
                  airbnb = list(
                    family_title="Circular Air Bold"
                    , family_text = "Circular Air Medium"
                    , colour_title = "#F14000"
                    , colour_text = "#535353"),
                  facebook = list(
                    family_title="Facebook Letter Faces"
                    , family_text = "Facebook Letter Faces"
                    , colour_title = "#3D579D"
                    , colour_text = "#535353"),
                  google = list(
                    family_title="Product Sans"
                    , family_text = "Product Sans"
                    , colour_title = "#dd4b39"
                    , colour_text = "black"),
                  etsy = list(
                    family_title="."
                    , family_text = "."
                    , colour_title = "#F14000"
                    , colour_text = "#535353"),
                  twitter = list(
                    family_title="PicoBlackAl"
                    , family_text = "[z] Arista Light"
                    , colour_title = "#5380E4"
                    , colour_text = "black")
                    )) {

  theme_classic() + 
    theme(text=element_text(size=20, family=tech_key[[theme]]$family_text)) +
    theme(legend.title=element_blank()) + 
    theme(plot.title = element_text(size = 30, colour = tech_key[[theme]]$colour_title, family=tech_key[[theme]]$family_title)) + 
    theme(axis.text.x=element_text(color=tech_key[[theme]]$colour_text)) +
    theme(axis.text.y=element_text(color=tech_key[[theme]]$colour_text)) +
    theme(axis.title.x=element_text(color=tech_key[[theme]]$colour_text, vjust=0)) +
    theme(axis.title.y=element_text(color=tech_key[[theme]]$colour_text, vjust=1.25))
}