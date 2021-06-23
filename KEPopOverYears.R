#remove.packages(c("ggplot2", "data.table"))
#install.packages('rlang ', dependencies = TRUE)
#install.packages('ggplot2', dependencies = TRUE)
##install.packages('data.table', dependencies = TRUE)
#install.packages("ggplot2", dependencies = TRUE, repos = "http://cran.us.r-project.org")
#remove.packages("rlang")
#install.packages("devtools")
#devtools::install_github("r-lib/rlang", build_vignettes = TRUE)
library(rKenyaCensus)
## Extract the table
df1 <- V2_T1.1
df3 <- V3_T2.2a
df2 <- V2_T2.5
df4 <- V4_T2.14
#data("DataCatalogue")
library(ggplot2)
library(dplyr)
df_1 <- rename(df1, c(Year = Year, Population = `Population (millions)`))

p<- ggplot(df_1, aes(Year, lapply(df_1$Population,as.numeric))) +        # Create barchart with ggplot2
  geom_bar(stat = "identity", fill="sienna3") +
  #geom_text(df_1, aes(label = as.character(df_1$Year)), vjust=-1) +
  labs(x = "Year",
       y = "Population(Million)",
       title = "Kenya Population Over The Years") +
  theme_bw() + theme(panel.grid.major = element_blank())
p
