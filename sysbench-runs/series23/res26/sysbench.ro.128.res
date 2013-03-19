sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1676535
        write:                           0
        other:                           1676535
        total:                           3353070
    transactions:                        1676535 (27940.63 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1676535 (27940.63 per sec.)
    other operations:                    1676535 (27940.63 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              1676535
    total time taken by event execution: 7676.2476
    per-request statistics:
         min:                                  1.51ms
         avg:                                  4.58ms
         max:                                 33.76ms
         approx.  95 percentile:               9.31ms

Threads fairness:
    events (avg/stddev):           13097.9297/53.45
    execution time (avg/stddev):   59.9707/0.00

