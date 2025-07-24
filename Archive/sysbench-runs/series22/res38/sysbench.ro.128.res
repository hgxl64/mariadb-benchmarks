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
        read:                            1052927
        write:                           0
        other:                           1052927
        total:                           2105854
    transactions:                        1052927 (17546.81 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1052927 (17546.81 per sec.)
    other operations:                    1052927 (17546.81 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1052927
    total time taken by event execution: 7676.9585
    per-request statistics:
         min:                                  3.08ms
         avg:                                  7.29ms
         max:                                 16.18ms
         approx.  95 percentile:               7.69ms

Threads fairness:
    events (avg/stddev):           8225.9922/1.99
    execution time (avg/stddev):   59.9762/0.00

