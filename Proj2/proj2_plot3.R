
library("plyr")
library("ggplot2")
NEI <- readRDS("~/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/exdata-data-NEI_data/Source_Classification_Code.rds")
data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]
plotdata3<-ddply(data2,.(year,type),summarize,sum=sum(Emissions))
png("plot3.png")
gplot<-ggplot(plotdata3,aes(year,sum))
gplot+geom_point()+facet_grid(.~type)+labs(title="PM2.5 Emission in Baltimore city",
        y="total PM2.5 emission each year")
dev.off()
