sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1835899
        write:                           0
        other:                           1835899
        total:                           3671798
    transactions:                        1835899 (30594.52 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1835899 (30594.52 per sec.)
    other operations:                    1835899 (30594.52 per sec.)

Test execution summary:
    total time:                          60.0075s
    total number of events:              1835899
    total time taken by event execution: 15352.0616
    per-request statistics:
         min:                                  1.38ms
         avg:                                  8.36ms
         max:                                 84.35ms
         approx.  95 percentile:              20.96ms

Threads fairness:
    events (avg/stddev):           7171.4805/53.65
    execution time (avg/stddev):   59.9690/0.00

