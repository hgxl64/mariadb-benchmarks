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
        read:                            393816
        write:                           0
        other:                           393816
        total:                           787632
    transactions:                        393816 (6563.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 393816 (6563.57 per sec.)
    other operations:                    393816 (6563.57 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              393816
    total time taken by event execution: 119.3909
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.30ms
         max:                                  0.86ms
         approx.  95 percentile:               0.42ms

Threads fairness:
    events (avg/stddev):           196908.0000/115.00
    execution time (avg/stddev):   59.6955/0.00

