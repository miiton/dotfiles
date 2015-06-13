# .Rprofile
require(utils)
repos <- "http://cran.md.tsukuba.ac.jp/"
pkgs <- c("ggplot2","ggthemes","scales","dplyr","tidyr","grid","Cairo","TTR","RMySQL")
installed_pkgs <- as.data.frame(installed.packages())
for(p in pkgs) {
    if(nrow(installed_pkgs[installed_pkgs$Package == p,]) == 0) {
        cat("install",p," ")
        install.packages(p,repos=repos)
    }
}

library(ggplot2)
library(ggthemes)
library(scales)
library(dplyr)
library(tidyr)
library(grid)
library(Cairo)

grDevices::quartz.options(width=7, height=4)

CairoFonts(
           regular="Noto Sans Japanese,Noto Sans Japanese Light:style=regular",
           bold="Noto Sans Japanese,Noto Sans Japanese Medium:style=bold"
           )

my_ggtheme <- function (
                        base_size = 10,
                        base_family = "NotoSansJP-Light",
                        bold_family = "NotoSansJP-Medium",
                        x_angle = FALSE
                        ) 
{
    if(x_angle == TRUE) {
        x_angle = 45
        x_hjust = 1
        x_vjust = 1
    } else {
        x_hjust = 0.5
        x_vjust = 1
    }
    theme(
          line = element_line(colour = "black", size = 0.5, linetype = 1, lineend = "butt"),
          rect = element_rect(fill = "white", colour = "black", size = 0.5, linetype = 1),
          text = element_text(family = base_family, face = "plain", colour = "grey20", size = base_size, hjust = 0.5, vjust = 0.5, angle = 0, lineheight = 0.9),
          axis.text = element_text(size = rel(0.8), colour = "grey50"),
          strip.text = element_text(size = rel(0.8)),
          axis.line = element_blank(),
          axis.text.x = element_text(hjust = x_hjust, vjust = x_vjust,size = rel(1),angle = x_angle), 
          axis.text.y = element_text(hjust = 1, size = rel(1)),
          axis.ticks = element_line(colour = "grey80"),
          axis.title.x = element_text(),
          axis.title.y = element_text(angle = 90),
          axis.ticks.length = unit(0.15, "cm"),
          axis.ticks.margin = unit(0.1, "cm"),
          legend.background = element_rect(colour = NA),
          legend.margin = unit(0.2, "cm"),
          legend.key = element_rect(fill = "grey95", colour = "white"),
          legend.key.size = unit(1.2, "lines"),
          legend.key.height = NULL,
          legend.key.width = NULL,
          legend.text = element_text(size = rel(0.8)), 
          legend.text.align = NULL,
          legend.title = element_text(size = rel(0.8), face = "bold", hjust = 0),
          legend.title.align = NULL, 
          legend.position = "right",
          legend.direction = NULL,
          legend.justification = "center", 
          legend.box = NULL,
          panel.background = element_rect(fill = "grey95", colour = NA),
          panel.border = element_rect(fill = NA,colour = "grey80"),
          panel.grid.major = element_line(colour = "grey80", size = 0.25), 
          panel.grid.minor = element_line(colour = "grey80", size = 0.10), 
          panel.margin = unit(0.25, "lines"),
          strip.background = element_rect(fill = NA, colour = NA),
          strip.text.x = element_text(),
          strip.text.y = element_text(angle = -90), 
          plot.background = element_rect(colour = "white"),
          plot.title = element_text(face = "bold",family = bold_family,size = rel(1.2),vjust=1), 
          plot.margin = unit(c(0.5, 0.5, 0.5, 0.5), "lines"),
          complete = TRUE)
}


zs <- function(x) {
    z <- (x - mean(x, na.rm=T)) / sd(x, na.rm=T)
    return(z)
}

dv <- function(x) {
    z <- zs(x)
    dv <- z * 10 + 50
}

univ_colors <- c( "#3169b3", "#ec6110", "#07af7b", "#f4a000", "#a53d92",
                 "#68c8f2", "#ef908a", "#eee100", "#8a3b2c", "#f7c7c7"
                 )

ggtemplate <- list(scale_colour_manual(values=univ_colors),
                   my_ggtheme())
ggline <- list(ggtemplate,geom_line(alpha=0.5,size=0.2))
ggpoint <- list(ggtemplate,geom_point(size=3),
                geom_point(size=1.5,colour="white",alpha=0.1))
