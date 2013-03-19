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
        read:                            2421460
        write:                           0
        other:                           2421460
        total:                           4842920
    transactions:                        2421460 (40352.87 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2421460 (40352.87 per sec.)
    other operations:                    2421460 (40352.87 per sec.)

Test execution summary:
    total time:                          60.0071s
    total number of events:              2421460
    total time taken by event execution: 15351.0541
    per-request statistics:
         min:                                  1.07ms
         avg:                                  6.34ms
         max:                                 83.10ms
         approx.  95 percentile:              16.31ms

Threads fairness:
    events (avg/stddev):           9458.8281/77.88
    execution time (avg/stddev):   59.9651/0.00

