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
        read:                            1670378
        write:                           0
        other:                           1670378
        total:                           3340756
    transactions:                        1670378 (27836.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1670378 (27836.59 per sec.)
    other operations:                    1670378 (27836.59 per sec.)

Test execution summary:
    total time:                          60.0066s
    total number of events:              1670378
    total time taken by event execution: 15352.3517
    per-request statistics:
         min:                                  1.50ms
         avg:                                  9.19ms
         max:                                 91.02ms
         approx.  95 percentile:              22.65ms

Threads fairness:
    events (avg/stddev):           6524.9141/52.92
    execution time (avg/stddev):   59.9701/0.00

