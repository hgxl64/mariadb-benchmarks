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
        read:                            1050037
        write:                           0
        other:                           1050037
        total:                           2100074
    transactions:                        1050037 (17496.93 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1050037 (17496.93 per sec.)
    other operations:                    1050037 (17496.93 per sec.)

Test execution summary:
    total time:                          60.0126s
    total number of events:              1050037
    total time taken by event execution: 15353.9566
    per-request statistics:
         min:                                  6.09ms
         avg:                                 14.62ms
         max:                                 82.97ms
         approx.  95 percentile:              22.37ms

Threads fairness:
    events (avg/stddev):           4101.7070/24.00
    execution time (avg/stddev):   59.9764/0.00

