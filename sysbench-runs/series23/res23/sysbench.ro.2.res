sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            726300
        write:                           0
        other:                           726300
        total:                           1452600
    transactions:                        726300 (12104.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 726300 (12104.94 per sec.)
    other operations:                    726300 (12104.94 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              726300
    total time taken by event execution: 119.2755
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.16ms
         max:                                  0.78ms
         approx.  95 percentile:               0.27ms

Threads fairness:
    events (avg/stddev):           363150.0000/26220.00
    execution time (avg/stddev):   59.6377/0.03

