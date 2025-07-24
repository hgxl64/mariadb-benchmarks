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
        read:                            1406933
        write:                           0
        other:                           1406933
        total:                           2813866
    transactions:                        1406933 (23446.39 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1406933 (23446.39 per sec.)
    other operations:                    1406933 (23446.39 per sec.)

Test execution summary:
    total time:                          60.0064s
    total number of events:              1406933
    total time taken by event execution: 15352.6554
    per-request statistics:
         min:                                  1.61ms
         avg:                                 10.91ms
         max:                                109.01ms
         approx.  95 percentile:              26.08ms

Threads fairness:
    events (avg/stddev):           5495.8320/50.24
    execution time (avg/stddev):   59.9713/0.00

