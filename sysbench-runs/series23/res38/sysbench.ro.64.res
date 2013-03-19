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
        read:                            1046857
        write:                           0
        other:                           1046857
        total:                           2093714
    transactions:                        1046857 (17446.71 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1046857 (17446.71 per sec.)
    other operations:                    1046857 (17446.71 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1046857
    total time taken by event execution: 3837.9368
    per-request statistics:
         min:                                  1.98ms
         avg:                                  3.67ms
         max:                                 10.69ms
         approx.  95 percentile:               3.96ms

Threads fairness:
    events (avg/stddev):           16357.1406/5.66
    execution time (avg/stddev):   59.9678/0.00

