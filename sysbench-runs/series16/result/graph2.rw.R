library(ggplot2)

#######################################

tbls1 <- c(
           "sum.rw.01.txt",
           "sum.rw.02.txt",
           "sum.rw.03.txt",
           "sum.rw.04.txt",
           "sum.rw.05.txt",
           "sum.rw.06.txt",
           "sum.rw.07.txt"
          )
tbls2 <- c(
           "Maria-5.5/XtraDB",
           "Maria-5.5/InnoDB",
           "Maria-10.0",
           "MySQL-5.5.29",
           "MySQL-5.6.9",
           "MySQL-5.6.10",
           "Maria-10.0.1"
          )


titler   = "OLTP (rw)"
filename = "graph2.rw.pdf"

#######################################

pairs <- data.frame(tbls1, tbls2)

dvf<-data.frame()
for (tb in tbls1) {
  td1 <- read.csv(tb, sep=" ", header=F)
  dv.ver = as.data.frame(td1)
  dv.ver$engine = pairs[which(pairs$tbls1  == tb),]$tbls2
  dvf = rbind(dvf, dv.ver)
}

colnames(dvf) <- c("Threads", "sec", "Thrp", "Resp","Inst")

filtersec <- function(x) { subset(x, (sec>300)) }
q90 <- function(x) { quantile(x, probs = c(0.90)) }
q50 <- function(x) { quantile(x, probs = c(0.50)) }

dsum <- ddply(filtersec(dvf), c("Inst","Threads", "sec"), summarize,
              Thrp = sum(Thrp), Resp = max(Resp), Threads = sum(Threads))


pdf(file=filename,paper="A4",width=10, height=8)


################ start block ################

s2 <- dsum
d2 <- ddply(filtersec(s2), c("Inst","Threads"), summarize,
            Thrp50=round(as.numeric(q50(Thrp))),
            Resp90=round(as.numeric(max(Resp)), 3)
           )

m <- ggplot(filtersec(s2), aes(x=factor(Threads), Thrp,
            color=factor(Inst), group=factor(Inst)))

m + geom_jitter(size=1, alpha=0.75) + opts(title=paste("sysbench, ",titler)) +
    xlab("Threads") + ylab("Throughput, tps") + ylim(0, max(dsum$Thrp)) +
    opts(legend.position = "bottom") + opts(legend.direction="horizontal") +
    scale_colour_discrete(name="") +
    geom_text(data=d2, aes(x=factor(Threads), y=Thrp50, vjust=-0.5, label=Thrp50),
              size=4, color="black", legend=FALSE) +
    stat_summary(fun.y="q50", fun.ymin="q50", fun.ymax="q50",
                 geom="crossbar", size=1/4, legend=FALSE)

################ end block ################


d1 <- ddply(filtersec(dsum), c("Inst","Threads"), summarize,
            Thrp50=round(as.numeric(q50(Thrp))),
            Resp90=round(as.numeric(max(Resp)), 3)
           )

d1
