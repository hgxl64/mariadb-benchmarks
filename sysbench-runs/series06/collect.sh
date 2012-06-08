for i in 1 2 4 8 16 32 64 128 256  ; 
do cat res$1/sysbench.ro.$i.res | awk -v s=$i ' BEGIN { i=5 } /tps:/ { r=$5;tm=$12; if (i<1000) { r=$6;tm=$13 } ; print s,i,r,tm; i=i+5 } ' | tr -d ',ms' ; 
done > sum.ro.$1.txt
for i in 1 2 4 8 16 32 64 128 256  ; 
do cat res$1/sysbench.rw.$i.res | awk -v s=$i ' BEGIN { i=5 } /tps:/ { r=$5;tm=$12; if (i<1000) { r=$6;tm=$13 } ; print s,i,r,tm; i=i+5 } ' | tr -d ',ms' ; 
done > sum.rw.$1.txt
