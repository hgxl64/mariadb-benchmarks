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
        read:                            1583843
        write:                           0
        other:                           1583843
        total:                           3167686
    transactions:                        1583843 (26393.79 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1583843 (26393.79 per sec.)
    other operations:                    1583843 (26393.79 per sec.)

Test execution summary:
    total time:                          60.0082s
    total number of events:              1583843
    total time taken by event execution: 15352.3546
    per-request statistics:
         min:                                  1.61ms
         avg:                                  9.69ms
         max:                                 85.30ms
         approx.  95 percentile:              24.01ms

Threads fairness:
    events (avg/stddev):           6186.8867/46.53
    execution time (avg/stddev):   59.9701/0.00

