##############################################################
### Title: "Plots for Attendance Paper"
### Created on: 04/01/2022
### Edits: 
####### [MB 04/01]: Created code (based on NR `garphs_mai.Rmd`)
##############################################################

# Clears memory
rm(list = ls())
# Clears console
cat("\014")

library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(firasans)
library(haven)
library(scales)
library(lemon)

# Directories
dir_data <- "C:/Users/mc72574/Dropbox/UT/UT Research/Asistencia/archivos_mai_18032022/"
dir_output <- "C:/Users/mc72574/Dropbox/Hugo/Sites/presentations/content/presentations/Attendance/Salem_20220405/images/"

# Color palettes:
cols <- c("#0D0887","#5601A4","#900DA4","#BF3984","#E16462","#F89441","#FCCE25")

results <- haven::read_dta(paste0(dir_data, "results.dta"))


# Builds a function that generates a graph 
graph_maker <- function(nyear, ngrado){
  graph <- ggplot(data = results %>% 
                    filter(agno == nyear & grado == ngrado & mod == 3 & gpa == 1)) + 
    geom_line(aes( y = est*100, x = t,  color = "LP (D1)")) + 
    geom_line(aes( y = cil*100, x = t, color = "LP (D1)"), linetype = "dashed") +
    geom_line(aes( y = ciu*100, x = t, color = "LP (D1)"), linetype = "dashed") +
    geom_point(aes( y = est*100, x = t, color = "LP (D1)", fill = "LP (D1)"), size = 4, pch=21) + 
    geom_line(data = results %>% 
                filter(agno == nyear & grado == ngrado & mod == 3 & gpa == 4), aes( y = est*100, x = t, color = "HP (D10)")) + 
    geom_line(data = results %>% 
                filter(agno == nyear & grado == ngrado & mod == 3 & gpa == 4), aes( y = cil*100, x = t, color = "HP (D10)"), linetype = "dashed") +
    geom_line(data = results %>% 
                filter(agno == nyear & grado == ngrado & mod == 3 & gpa == 4), aes( y = ciu*100, x = t, color = "HP (D10)"), linetype = "dashed") +
    geom_point(data = results %>% 
                 filter(agno == nyear & grado == ngrado & mod == 3 & gpa == 4), aes( y = est*100, x = t, color = "HP (D10)",
                                                                                     fill = "HP (D10)"),
               size = 4, pch = 21) + 
    geom_hline(yintercept = 0) + 
    #geom_hline(yintercept = -4, color = "gray" ) + 
    #geom_hline(yintercept = 4, color = "gray") + 
    geom_vline(xintercept = 0, color = cols[1], linetype = "dashed") +
    scale_x_continuous( labels = scales::number_format(accuracy = 1), breaks = -5:5 ) +
    scale_y_continuous( breaks = seq(from = -8, to = 8, by = 2), lim = c(-8, 8), labels = dollar_format(suffix = "%", prefix = "") ) + 
    xlab("Days since test") + ylab("Event study estimate")+
    theme(legend.title=element_blank()) +
    theme_ipsum_fsc() +
    theme(plot.margin=unit(c(1,1,1.5,1.2),"cm"),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.major.y = element_blank(),
          panel.grid.minor.y = element_blank(),
          axis.line = element_line(colour = "dark grey"))+
    scale_color_manual(values=c(cols[3], cols[6])) + scale_fill_manual(values=c(alpha(cols[3],0.4), alpha(cols[6],0.4))) + 
    theme(legend.position = "none") +
    theme(axis.title.x = element_text(size=18),#margin = margin(t = 10, r = 0, b = 0, l = 0)),
          axis.text.x = element_text(size=14),
          axis.title.y = element_text(size=18),#margin = margin(t = 0, r = 10, b = 0, l = 0)),
          axis.text.y = element_text(size=14),
          title = element_text(size=20))
  if (ngrado != 2) {
    graph <- graph + geom_vline(xintercept = 1, color = cols[1], linetype = "dashed") 
  }
  return(graph)
}

g2 <- graph_maker(2014, 2) + ggtitle("2nd grade") + theme(plot.title = element_text(hjust = 0.5))
g4 <- graph_maker(2014, 4) + ggtitle("4th grade") + theme(plot.title = element_text(hjust = 0.5))
g6 <- graph_maker(2014, 6) + ggtitle("6th grade") + theme(plot.title = element_text(hjust = 0.5))
g8 <- graph_maker(2014, 8) + ggtitle("8th grade") + theme(plot.title = element_text(hjust = 0.5))
g10 <- graph_maker(2014, 10) + ggtitle("10th grade") + theme(plot.title = element_text(hjust = 0.5))


# Graph 
temp1 <- haven::read_dta(paste0(dir_data, "temp_t3.dta"))
round_esp <- function(var){
  trunc(round(var, digits = 2)*100)/100
}
# Data to build the graph 
data_graph <- temp1 %>%
  dplyr::select(- stakes) %>% 
  filter(agno == 2014) %>%  
  pivot_longer(.,  starts_with("est") | starts_with("se") | starts_with("pval"), names_to = "variable", values_to = "value") %>% 
  mutate(variable = as.factor(variable)) %>% 
  mutate(variable = recode_factor(variable, `est1` = "D1", `est2` = "D2", `est3` = "D3D8", `est4` = "D9", `est5` = "D10", `est98` = "D10-D1", `est97` = "All")) %>% 
  filter(str_detect(variable, "se") == F & str_detect(variable, "pval") == F) %>%   
  mutate(value = value*100)  

gr <- data_graph  %>% 
  filter(variable != "All" & variable != "D10-D1") %>% 
  mutate(grado = as.factor(grado) %>% 
           forcats::fct_relevel("6", "8", "10", "2", "4") %>% 
           recode_factor(`6` = "6th Grade", `8` = "8th Grade", `10` = "10th grade", `2` = "2nd grade", `4` = "4th grade"),
         variable =  variable %>% recode_factor(`D1` = "1st Decile", `D2` = "2nd Decile", `D3D8` = "3rd-8th Decile", `D9` = "9th decile", `D10` = "10th decile")) %>% 
  ggplot(., aes(x = variable, y = value)) +
  geom_segment( aes(x = variable, xend = variable, y = 0, yend = value), color = "grey") + 
  geom_point( aes(x = variable, y = value, color = variable), size = 4) +
  theme_light() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.border = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  xlab("\n GPA Performance") +
  ylab("Attendance \n") + theme_ipsum_fsc() + 
  scale_y_continuous(limits= c(-6, 4), breaks =  seq(from = -6, to = 4, by = 2), labels = dollar_format(suffix = "%", prefix = "")) + 
  geom_hline(yintercept = 0, color = "grey") + 
  geom_hline(yintercept = 0, color = "grey") +  
  geom_hline(yintercept = -4, color = "grey90") +
  geom_hline(yintercept = -6, color = "grey90") + 
  geom_hline(yintercept = 4, color = "grey90") +  
  geom_hline(yintercept = 6, color = "grey90") +
  geom_hline(yintercept = -2, color = "grey90") +
  geom_hline(yintercept = 2, color = "grey90") + 
  facet_wrap(~grado, ncol = 3, as.table = F) + 
  scale_colour_discrete("GPA") + 
  theme(legend.title.align=0.5) + 
  scale_x_discrete(labels=c("1st Decile" = "D1", "2nd Decile" = "D2", "3rd-8th Decile" = "D3D8",
                            "9th decile" = "D9", "10th decile" = "D10")) + 
  theme(axis.text=element_text(size = 12), axis.title = element_text(size = 14,face="bold")) + 
  theme(legend.title = element_text(size = 12), 
        legend.text = element_text( size = 12),
        strip.text = element_text(size = 14,face="bold"), 
        plot.caption = element_text(size = 11)) + 
  scale_color_manual("GPA", values = c(cols[2], cols[3], cols[5], cols[6], cols[7])) + 
  labs(caption = "Note: p < 0.05 for all estimates except those touching the 0 bar. \n Markers symbols are the coefficients of the effect of testing on attendance.")

shift_legend2 <- function(p) {
  # ...
  # to grob
  gp <- ggplotGrob(p)
  facet.panels <- grep("^panel", gp[["layout"]][["name"]])
  empty.facet.panels <- sapply(facet.panels, function(i) "zeroGrob" %in% class(gp[["grobs"]][[i]]))
  empty.facet.panels <- facet.panels[empty.facet.panels]
  
  # establish name of empty panels
  empty.facet.panels <- gp[["layout"]][empty.facet.panels, ]
  names <- empty.facet.panels$name
  # example of names:
  #[1] "panel-3-2" "panel-3-3"
  
  # now we just need a simple call to reposition the legend
  reposition_legend(p, 'center', panel=names)
}

shift_legend2(gr)