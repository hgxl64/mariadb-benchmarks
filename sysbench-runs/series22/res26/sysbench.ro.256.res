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
        read:                            1947921
        write:                           0
        other:                           1947921
        total:                           3895842
    transactions:                        1947921 (32461.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1947921 (32461.97 per sec.)
    other operations:                    1947921 (32461.97 per sec.)

Test execution summary:
    total time:                          60.0063s
    total number of events:              1947921
    total time taken by event execution: 15351.6892
    per-request statistics:
         min:                                  1.28ms
         avg:                                  7.88ms
         max:                                 90.80ms
         approx.  95 percentile:              19.90ms

Threads fairness:
    events (avg/stddev):           7609.0664/55.47
    execution time (avg/stddev):   59.9675/0.00

