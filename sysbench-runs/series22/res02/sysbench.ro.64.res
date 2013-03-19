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
        read:                            1422517
        write:                           0
        other:                           1422517
        total:                           2845034
    transactions:                        1422517 (23708.03 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1422517 (23708.03 per sec.)
    other operations:                    1422517 (23708.03 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1422517
    total time taken by event execution: 3837.4159
    per-request statistics:
         min:                                  1.35ms
         avg:                                  2.70ms
         max:                                  6.12ms
         approx.  95 percentile:               3.29ms

Threads fairness:
    events (avg/stddev):           22226.8281/18.73
    execution time (avg/stddev):   59.9596/0.00

