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
        read:                            1592054
        write:                           0
        other:                           1592054
        total:                           3184108
    transactions:                        1592054 (26530.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1592054 (26530.26 per sec.)
    other operations:                    1592054 (26530.26 per sec.)

Test execution summary:
    total time:                          60.0090s
    total number of events:              1592054
    total time taken by event execution: 15352.8993
    per-request statistics:
         min:                                  1.63ms
         avg:                                  9.64ms
         max:                                 84.86ms
         approx.  95 percentile:              23.87ms

Threads fairness:
    events (avg/stddev):           6218.9609/49.04
    execution time (avg/stddev):   59.9723/0.00

