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
        read:                            1163434
        write:                           0
        other:                           1163434
        total:                           2326868
    transactions:                        1163434 (19390.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1163434 (19390.05 per sec.)
    other operations:                    1163434 (19390.05 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1163434
    total time taken by event execution: 3837.7634
    per-request statistics:
         min:                                  1.51ms
         avg:                                  3.30ms
         max:                                 10.59ms
         approx.  95 percentile:               3.94ms

Threads fairness:
    events (avg/stddev):           18178.6562/18.32
    execution time (avg/stddev):   59.9651/0.00

