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
        read:                            209091
        write:                           0
        other:                           209091
        total:                           418182
    transactions:                        209091 (3484.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 209091 (3484.83 per sec.)
    other operations:                    209091 (3484.83 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              209091
    total time taken by event execution: 59.8654
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.29ms
         max:                                  0.76ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           209091.0000/0.00
    execution time (avg/stddev):   59.8654/0.00

