library(rKenyaCensus)
library(reshape)
library(dplyr)
## Extract the table
df1 <- V2_T1.1
df3 <- V3_T2.2a
df2 <- V2_T2.5
df4 <- V4_T2.14

df_3 = df3[(-1),]

#function nrowgen which takes two arguments x and y

#x is data frame and y is every nth row you want to  extract

#e.g suppose you want to extract  every 3rd row from the dataframe you can use #nrowgen(dataframe,3)

nrowgen<-function(x,y)
{
  n<-nrow(x)
  b<-seq(0,n,y)
  r<-length(b)
  c=data.frame()
  {
    for(i in 1:r)
    {
      abc<-x[b[i],]
      c<-rbind(c,abc)
      
    }
    return(c)
  }
}
groupedAge = nrowgen(df_3,6)
str(groupedAge)
order(groupedAge)
as.numeric(groupedAge$Age)
groupedAge <- groupedAge %>% select(1:3)
#transform(groupedAge, Age = as.numeric(Age))
g_df <- melt(data.frame(groupedAge), id = c("Age"))
# Change colnames of all columns
colnames(g_df) <- c("Age", "Gender", "Total")
g_df
g_df <- g_df[!(g_df$Age=="5-9"),]


#load ggplot2
library(ggplot2)

#create population pyramid
ggplot(g_df, aes(x = Age, fill = Gender,
                  y = ifelse(test = Gender == "Female",
                             yes = -Total, no = Total))) + 
   geom_bar(stat = "identity") +
   scale_y_continuous(breaks = seq(-2500000, 2500000, 1000000), labels = abs) +
   labs(x = "Age",
       y = "Population",
       title = "Kenya 2019 Population By Age Group")+
   #scale_colour_manual(values = c("RED", "steelblue"),
    #                  aesthetics = c("colour", "fill")) +
   coord_flip() +
   theme_bw() +
   theme_classic()+
   theme(axis.title = element_text(size = 10, face = "bold",color = "Black"),
        plot.title=element_text(size=15, face = "bold", color = "Black"))


#g_df[order(g_df$Age), ]


# n1 <- ggplot(g_df, aes(x = Age, y = Total, fill = Gender)) +
#   geom_bar(subset = (g_df$Gender == "Female"), stat = "identity") +
#   geom_bar(subset = (g_df$Gender == "Male"), stat = "identity") +
#   scale_y_continuous(breaks = seq(-2500000, 2500000, 50000),
#                      labels = paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")) +
#   coord_flip() +
#   scale_fill_brewer(palette = "Set1") +
#   theme_bw()
