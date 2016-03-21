##########
#' Import Airbnb ggplot2 theme. It builds on theme_classic. You can change font family or size.
#' 
#' @export theme_airbnb_fancy
#' @name theme_airbnb_fancy
#' @title Airbnb theme for ggplo2
#' @return A theme element
#' @examples
#' qplot(1) + theme_airbnb_fancy()
###

theme_airbnb_fancy <- function(base_size=2.5) {
# Generate the colors for the chart procedurally with RColorBrewer
  palette <- RColorBrewer::brewer.pal("Greys", n=9)
  color.background = palette[2]
  color.grid.major = palette[3]
  color.axis.text = palette[6]
  color.axis.title = palette[7]
  color.title = "#F14000"
  color.subtitle = "#F14000"

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
  theme(plot.subtitle=element_text(color=color.subtitle, size=base_size * 7.5, vjust=1.25)) +
  theme(axis.text.x=element_text(size=base_size * 7,color=color.axis.text)) +
  theme(axis.text.y=element_text(size=base_size * 7,color=color.axis.text)) +
  theme(axis.title.x=element_text(size=base_size * 8,color=color.axis.title, vjust=0)) +
  theme(axis.title.y=element_text(size=base_size * 8,color=color.axis.title, vjust=1.25)) +

  # Plot margins
  theme(plot.margin = grid::unit(c(0.35, 0.2, 0.3, 0.35), "cm")) + 
  theme(text=element_text(size=base_size*9, family="Circular Air Medium"))

}