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
        read:                            1036559
        write:                           0
        other:                           1036559
        total:                           2073118
    transactions:                        1036559 (17274.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1036559 (17274.97 per sec.)
    other operations:                    1036559 (17274.97 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              1036559
    total time taken by event execution: 3837.9498
    per-request statistics:
         min:                                  3.00ms
         avg:                                  3.70ms
         max:                                  9.15ms
         approx.  95 percentile:               4.00ms

Threads fairness:
    events (avg/stddev):           16196.2344/6.86
    execution time (avg/stddev):   59.9680/0.00

