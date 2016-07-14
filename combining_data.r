setwd("E:\\Shruti\\breast cancer\\Data 1_7_15\\Analysis files")

allgrp<-read.csv("sample_groups.txt",sep="\t",header=T)
nrow(allset)

file_map<-read.csv("final_file_map.txt", header=T,sep="\t")
nrow(file_map)

genes<-read.csv("genes.txt", header=T)
nrow(genes)

expr<-data.frame(genes)
a<-vector()
col_samp_grp<-as.vector("g")

for(i in 1:nrow(file_map)){
file_name<-as.vector(file_map[i,1])
file_name<-paste("E:\\Shruti\\breast cancer\\Data 1_7_15\\Expression 1_8_15\\Expression-Genes\\UNC__AgilentG4502A_07_3\\Level_3\\",file_name,sep="")
#print(i)
x<-read.csv(file_name,header=T,sep="\t",skip=1)
#print(head(x))
#print(nrow(x))
a<-as.vector(x[,2])
expr<-cbind(expr,a)
samp<-as.vector(file_map[i,2])
samp_grp<-as.vector(allgrp[allgrp$Sample==samp,2])
col_samp_grp<-append(col_samp_grp,samp_grp)
}
expr<-as.data.frame(expr)
colnames(expr)<-col_samp_grp


write.table(expr,"final_expr.txt",col.names=T,row.names=F,sep="\t")  