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
        read:                            1006016
        write:                           0
        other:                           1006016
        total:                           2012032
    transactions:                        1006016 (16765.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1006016 (16765.91 per sec.)
    other operations:                    1006016 (16765.91 per sec.)

Test execution summary:
    total time:                          60.0036s
    total number of events:              1006016
    total time taken by event execution: 7676.9019
    per-request statistics:
         min:                                  1.88ms
         avg:                                  7.63ms
         max:                                 41.94ms
         approx.  95 percentile:              12.44ms

Threads fairness:
    events (avg/stddev):           7859.5000/37.68
    execution time (avg/stddev):   59.9758/0.00

