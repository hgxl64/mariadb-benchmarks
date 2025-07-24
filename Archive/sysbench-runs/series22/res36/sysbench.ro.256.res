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
        read:                            1949872
        write:                           0
        other:                           1949872
        total:                           3899744
    transactions:                        1949872 (32494.27 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1949872 (32494.27 per sec.)
    other operations:                    1949872 (32494.27 per sec.)

Test execution summary:
    total time:                          60.0066s
    total number of events:              1949872
    total time taken by event execution: 15351.4598
    per-request statistics:
         min:                                  1.30ms
         avg:                                  7.87ms
         max:                                 86.98ms
         approx.  95 percentile:              19.89ms

Threads fairness:
    events (avg/stddev):           7616.6875/57.11
    execution time (avg/stddev):   59.9666/0.00

