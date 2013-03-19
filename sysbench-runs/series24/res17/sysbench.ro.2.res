sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            486252
        write:                           0
        other:                           486252
        total:                           972504
    transactions:                        486252 (8104.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 486252 (8104.14 per sec.)
    other operations:                    486252 (8104.14 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              486252
    total time taken by event execution: 119.3807
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.25ms
         max:                                  0.63ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           243126.0000/9169.00
    execution time (avg/stddev):   59.6903/0.01

