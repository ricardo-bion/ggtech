
##########
#' tech scale fill
#' 
#' @export
#' @name scale_fill_tech
#' @author Ricardo Bion
#' @title Tech scale fill for ggplot2
#' @examples
#' scale_fill_tech(theme="etsy")


scale_fill_tech <- function(theme="airbnb") {
  
  tech_key <- list(
                  airbnb = c("#FF5A5F", "#FFB400", "#007A87",  "#FFAA91", "#7B0051"),
                  facebook = c("#3b5998", "#6d84b4", "#afbdd4", "#d8dfea"),
                  google = c("#5380E4", "#E12A3C", "#FFBF03", "#00B723"),
                  etsy = c("#F14000", "#67B6C3", "#F0DA47", "#EBEBE6", "#D0D0CB"),
                  twitter = c("#55ACEE", "#292f33", "#8899a6", "#e1e8ed")
                    )
  
  scale_fill_manual(values=tech_key[[theme]])
  
}