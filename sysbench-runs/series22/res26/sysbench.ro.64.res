sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1959860
        write:                           0
        other:                           1959860
        total:                           3919720
    transactions:                        1959860 (32663.51 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1959860 (32663.51 per sec.)
    other operations:                    1959860 (32663.51 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1959860
    total time taken by event execution: 3836.6756
    per-request statistics:
         min:                                  1.30ms
         avg:                                  1.96ms
         max:                                 11.53ms
         approx.  95 percentile:               2.33ms

Threads fairness:
    events (avg/stddev):           30622.8125/20.08
    execution time (avg/stddev):   59.9481/0.00

