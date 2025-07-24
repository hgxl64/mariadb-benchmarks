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
        read:                            1429604
        write:                           0
        other:                           1429604
        total:                           2859208
    transactions:                        1429604 (23826.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1429604 (23826.13 per sec.)
    other operations:                    1429604 (23826.13 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1429604
    total time taken by event execution: 3837.4468
    per-request statistics:
         min:                                  1.32ms
         avg:                                  2.68ms
         max:                                  9.55ms
         approx.  95 percentile:               3.23ms

Threads fairness:
    events (avg/stddev):           22337.5625/20.34
    execution time (avg/stddev):   59.9601/0.00

