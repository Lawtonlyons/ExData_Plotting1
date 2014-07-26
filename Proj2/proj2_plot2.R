
library("plyr")
NEI <- readRDS("~/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/exdata-data-NEI_data/Source_Classification_Code.rds")
data<-transform(NEI,year=factor(year))
data2<-data[data$fips=="24510",]
plotdata2<-ddply(data2,.(year),summarize,sum=sum(Emissions))
png("plot2.png")
plot(plotdata2$year,plotdata2$sum,type="n",xlab="year",ylab="total PM2.5 Emission", 
     main="PM2.5 emission in Baltimore City",boxwex=0.05)
lines(plotdata2$year,plotdata2$sum)
dev.off()
