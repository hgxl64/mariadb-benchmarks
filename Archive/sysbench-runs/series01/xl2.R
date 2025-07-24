library(ggplot2)
library(xtable)

#######################################

tbls1 <- c("sum.1.txt","sum.4.txt","sum.5.txt",
           "sum.6.txt","sum.7.txt","sum.8.txt",
           "sum.10.txt","sum.11.txt","sum.12.txt",
           "sum.13.txt","sum.14.txt")
tbls2 <- c("MariaDB-5.3.4","MySQL-5.5.20","MySQL-5.1.61",
           "Perc-5.1.61","MariaDB-5.3.4(IB)", "MariaDB-5.2.10",
           "MariaDB-5.3.5", "Perc-5.5.20", "MariaDB-5.5",
           "MariaDB-5.5(IB)", "Maria-5.3.4/IB/noAria")

titler="MariaDB 5.3.4"
filename="mariadb-5.3.4.pdf"

pairs <- data.frame(tbls1, tbls2)

dvf<-data.frame()
for (tb in tbls1) {
td1<-read.csv(tb, sep=" ",header=F)
dv.ver=as.data.frame(td1)
dv.ver$engine=pairs[which(pairs$tbls1  == tb),]$tbls2
dvf=rbind(dvf,dv.ver)
}

colnames(dvf) <- c("Threads", "sec", "Thrp", "Resp","Inst")

filtersec <- function(x) { subset(x, sec>60)  }

dsum <- ddply(filtersec(dvf), c("Inst","Threads", "sec"),
              summarize,
              Thrp = sum(Thrp), Resp = max(Resp),
              Threads = sum(Threads)
              )

q90 <- function(x) { quantile(x, probs = c(0.90)) }
q50 <- function(x) { quantile(x, probs = c(0.50)) }

d1 <- ddply(filtersec(dsum),
            c("Inst","Threads"),
            summarize,
            Thrp50 = round(as.numeric(q50(Thrp))),
            Resp90 = round(as.numeric(max(Resp)), 3)
          )

pdf(file=filename,paper="A4",width=10, height=8)
## Throughput
m <- ggplot(filtersec(dsum),
            aes(x = factor(Threads), Thrp,
                color=factor(Inst),group=factor(Inst)))

m + geom_jitter(size=1, alpha=0.75) +
  opts(title = paste("sysbench, ",titler)) +
  xlab("Threads") +
  ylab("Throughput, tps") + ylim(0,max(dsum$Thrp))+
  opts(legend.position = "bottom") +  opts(legend.direction = "horizontal")+scale_colour_discrete(name="")

m <- ggplot(filtersec(dsum),
            aes(x = factor(Threads), Thrp,
                color=factor(Inst),group=factor(Inst)))

m + geom_jitter(size=1, alpha=0.75) +
  opts(title = paste("sysbench, ",titler)) +
  xlab("Threads") +
  ylab("Throughput, tps") + ylim(0,max(dsum$Thrp))+
  opts(legend.position = "bottom") + opts(legend.direction = "horizontal")+scale_colour_discrete(name="") +
  geom_text(data = d1, aes(x = factor(Threads), y = Thrp50, vjust = -0.5, label = Thrp50),size=4,color="black",legend = FALSE) +
  stat_summary(fun.y = "q50",
               fun.ymin = "q50", fun.ymax = "q50",
               geom = "crossbar",size = 1/4,legend = FALSE)

pdf(file=filename,paper="A4",width=10, height=8)

m <- ggplot(d1,
            aes(x = factor(Threads), Thrp50,
                color=factor(Inst),group=factor(Inst)))
m+geom_point()+geom_line()

# compare stability on 32 threads
m <- ggplot(subset(filtersec(dsum),Threads==256),
            aes(x = sec, Thrp,
                color=factor(Inst),group=factor(Inst)))
m+geom_point()+geom_line()+ylim(0,5000)+facet_wrap(~ Inst)



m <- ggplot(filtersec(dsum),
            aes(x = factor(Threads), Resp,
                color=factor(Inst),group=factor(Inst)))


d3<-as.data.frame(cast(subset(d1,Threads<640),Inst~Threads,value="Thrp50"))
d4<-as.data.frame(t(d3))
d4$"1"<-as.numeric(as.character(d4$"1"))
d4$"2"<-as.numeric(as.character(d4$"2"))
d4$Ratio=d4$"1"/d4$"2"

colnames(d4)<-c("Threads","MariaDB 5.3.4","MySQL 5.5.20")

d4

print(xtable(d4),type="html",file="1.html")

data.print<-cast(subset(d1,Threads>=64),Inst~Threads,value="Resp90")
print(xtable(data.print))

xtable

