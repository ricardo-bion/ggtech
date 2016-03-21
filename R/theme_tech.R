
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


    theme_airbnb_fancy <- function(base_size=1.5) {
    # Generate the colors for the chart procedurally with RColorBrewer
      palette <- RColorBrewer::brewer.pal("Greys", n=9)
      color.background = palette[2]
      color.grid.major = palette[3]
      color.axis.text = palette[6]
      color.axis.title = palette[7]
      color.title = palette[9]
    
      # Begin construction of chart
      theme_bw(base_size= base_size * 9) +
    
      # Set the entire chart region to a light gray color
      theme(panel.background=element_rect(fill=color.background, color=color.background)) +
      theme(plot.background=element_rect(fill=color.background, color=color.background)) +
      theme(panel.border=element_rect(color=color.background)) +
    
      # Format the grid
      theme(panel.grid.major=element_line(color=color.grid.major,size=.25)) +
      theme(panel.grid.minor=element_blank()) +
      theme(axis.ticks=element_blank()) +
    
      # Format the legend, but hide by default
      #theme(legend.position="none") +
      theme(legend.background = element_rect(fill=color.background)) +
      #theme(legend.text = element_text(size=1.2 * 7,color=color.axis.title)) +
      theme(legend.text = element_text(size= base_size * 7,color=color.axis.title)) +
      theme(legend.title=element_blank()) + 
    
      # Set title and axis labels, and format these and tick marks
      theme(plot.title=element_text(color=color.title, size=base_size * 10, vjust=1.25)) +
      theme(axis.text.x=element_text(size=base_size * 7,color=color.axis.text)) +
      theme(axis.text.y=element_text(size=base_size * 7,color=color.axis.text)) +
      theme(axis.title.x=element_text(size=base_size * 8,color=color.axis.title, vjust=0)) +
      theme(axis.title.y=element_text(size=base_size * 8,color=color.axis.title, vjust=1.25)) +
    
      # Plot margins
      theme(plot.margin = grid::unit(c(0.35, 0.2, 0.3, 0.35), "cm")) + theme(text=element_text(size=base_size*9, family="Circular Air Medium"))
    
    }

  if(theme = "airbnb_classic") return(theme_airbnb_fancy)

  theme_classic() + 
    theme(text=element_text(size=20, family=tech_key[[theme]]$family_text)) +
    theme(legend.title=element_blank()) + 
    theme(plot.title = element_text(size = 30, colour = tech_key[[theme]]$colour_title, family=tech_key[[theme]]$family_title)) + 
    theme(axis.text.x=element_text(color=tech_key[[theme]]$colour_text)) +
    theme(axis.text.y=element_text(color=tech_key[[theme]]$colour_text)) +
    theme(axis.title.x=element_text(color=tech_key[[theme]]$colour_text, vjust=0)) +
    theme(axis.title.y=element_text(color=tech_key[[theme]]$colour_text, vjust=1.25))



}