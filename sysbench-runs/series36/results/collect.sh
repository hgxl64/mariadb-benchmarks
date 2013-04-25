for k in 01 02 03 04;
do
  for i in 1 2 4 8 16 32 64 128 256 512 ;
    do cat ../res$k/sysbench.ro.$i.res | awk -v s=$i ' BEGIN { i=5 } /tps:/ { r=$5;tm=$12; if (i<1000) { r=$6;tm=$13 } ; print s,i,r,tm; i=i+5 } ' | tr -d ',ms' ;
  done > sum.ro.$k.txt
  for i in 1 2 4 8 16 32 64 128 256 512 ;
  do cat ../res$k/sysbench.rw.$i.res | awk -v s=$i ' BEGIN { i=5 } /tps:/ { r=$5;tm=$12; if (i<1000) { r=$6;tm=$13 } ; print s,i,r,tm; i=i+5 } ' | tr -d ',ms' ;
  done > sum.rw.$k.txt
done
