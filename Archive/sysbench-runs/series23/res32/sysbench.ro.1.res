sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            174331
        write:                           0
        other:                           174331
        total:                           348662
    transactions:                        174331 (2905.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 174331 (2905.51 per sec.)
    other operations:                    174331 (2905.51 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              174331
    total time taken by event execution: 59.8347
    per-request statistics:
         min:                                  0.19ms
         avg:                                  0.34ms
         max:                                  0.75ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           174331.0000/0.00
    execution time (avg/stddev):   59.8347/0.00

