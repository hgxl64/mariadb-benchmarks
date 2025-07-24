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
        read:                            1425968
        write:                           0
        other:                           1425968
        total:                           2851936
    transactions:                        1425968 (23764.94 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1425968 (23764.94 per sec.)
    other operations:                    1425968 (23764.94 per sec.)

Test execution summary:
    total time:                          60.0030s
    total number of events:              1425968
    total time taken by event execution: 7676.2827
    per-request statistics:
         min:                                  1.48ms
         avg:                                  5.38ms
         max:                                 54.32ms
         approx.  95 percentile:              10.66ms

Threads fairness:
    events (avg/stddev):           11140.3750/56.78
    execution time (avg/stddev):   59.9710/0.00

