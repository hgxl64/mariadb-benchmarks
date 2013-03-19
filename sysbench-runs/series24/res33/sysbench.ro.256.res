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
        read:                            1265265
        write:                           0
        other:                           1265265
        total:                           2530530
    transactions:                        1265265 (21085.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1265265 (21085.40 per sec.)
    other operations:                    1265265 (21085.40 per sec.)

Test execution summary:
    total time:                          60.0067s
    total number of events:              1265265
    total time taken by event execution: 15353.1111
    per-request statistics:
         min:                                  1.63ms
         avg:                                 12.13ms
         max:                                104.88ms
         approx.  95 percentile:              23.50ms

Threads fairness:
    events (avg/stddev):           4942.4414/37.26
    execution time (avg/stddev):   59.9731/0.00

