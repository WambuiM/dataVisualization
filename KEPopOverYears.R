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
#Rename columns
df_1 <- rename(df1, c(Year = Year, Population = `Population (millions)`))

#convert population column to numeric
df_1 = transform(df_1,Population = as.numeric(Population))

#Check columns class
sapply(df_1, class)

#Plot a bar plot, add a line 
y = ggplot(df_1) + 
  aes(x=Year, y=Population) +
  geom_bar(stat = "identity", fill="#1b98e0")+
  geom_line(stat = "identity", group = 1, size=1.5)+
  geom_text(aes(label = Population, vjust = -1), size = 5) +
  labs(x = "Year",
       y = "Population in Million",
       title = "Kenya Population Over The Years") +
  theme_bw() + theme(panel.grid.major = element_blank())+
  theme(axis.title = element_text(size = 15, color = "sienna3"),
        plot.title=element_text(size=20, face = "bold", color = "sienna3"))

#highlight points
y + geom_point(size = 3, colour = "sienna3")
