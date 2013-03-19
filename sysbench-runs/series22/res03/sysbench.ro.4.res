sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            975961
        write:                           0
        other:                           975961
        total:                           1951922
    transactions:                        975961 (16265.96 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 975961 (16265.96 per sec.)
    other operations:                    975961 (16265.96 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              975961
    total time taken by event execution: 238.3198
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  1.06ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           243990.2500/12634.66
    execution time (avg/stddev):   59.5799/0.06

