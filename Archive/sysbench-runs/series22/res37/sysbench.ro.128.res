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
        read:                            1826758
        write:                           0
        other:                           1826758
        total:                           3653516
    transactions:                        1826758 (30443.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1826758 (30443.85 per sec.)
    other operations:                    1826758 (30443.85 per sec.)

Test execution summary:
    total time:                          60.0042s
    total number of events:              1826758
    total time taken by event execution: 7675.8743
    per-request statistics:
         min:                                  1.39ms
         avg:                                  4.20ms
         max:                                 31.78ms
         approx.  95 percentile:               8.58ms

Threads fairness:
    events (avg/stddev):           14271.5469/63.58
    execution time (avg/stddev):   59.9678/0.00

