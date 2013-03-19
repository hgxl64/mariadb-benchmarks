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
        read:                            1424969
        write:                           0
        other:                           1424969
        total:                           2849938
    transactions:                        1424969 (23747.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1424969 (23747.02 per sec.)
    other operations:                    1424969 (23747.02 per sec.)

Test execution summary:
    total time:                          60.0062s
    total number of events:              1424969
    total time taken by event execution: 15352.4200
    per-request statistics:
         min:                                  1.63ms
         avg:                                 10.77ms
         max:                                116.59ms
         approx.  95 percentile:              25.91ms

Threads fairness:
    events (avg/stddev):           5566.2852/51.94
    execution time (avg/stddev):   59.9704/0.00

