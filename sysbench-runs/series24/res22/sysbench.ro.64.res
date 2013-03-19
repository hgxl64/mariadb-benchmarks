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
        read:                            1431117
        write:                           0
        other:                           1431117
        total:                           2862234
    transactions:                        1431117 (23851.26 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1431117 (23851.26 per sec.)
    other operations:                    1431117 (23851.26 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1431117
    total time taken by event execution: 3837.3370
    per-request statistics:
         min:                                  1.50ms
         avg:                                  2.68ms
         max:                                  8.16ms
         approx.  95 percentile:               3.23ms

Threads fairness:
    events (avg/stddev):           22361.2031/20.98
    execution time (avg/stddev):   59.9584/0.00

