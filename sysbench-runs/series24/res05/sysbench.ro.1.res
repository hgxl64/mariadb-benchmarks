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
        read:                            223099
        write:                           0
        other:                           223099
        total:                           446198
    transactions:                        223099 (3718.29 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 223099 (3718.29 per sec.)
    other operations:                    223099 (3718.29 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              223099
    total time taken by event execution: 59.8532
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.27ms
         max:                                  1.00ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           223099.0000/0.00
    execution time (avg/stddev):   59.8532/0.00

