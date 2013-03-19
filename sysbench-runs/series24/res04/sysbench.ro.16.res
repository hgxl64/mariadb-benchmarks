sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1420412
        write:                           0
        other:                           1420412
        total:                           2840824
    transactions:                        1420412 (23673.28 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1420412 (23673.28 per sec.)
    other operations:                    1420412 (23673.28 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              1420412
    total time taken by event execution: 957.0570
    per-request statistics:
         min:                                  0.40ms
         avg:                                  0.67ms
         max:                                  3.49ms
         approx.  95 percentile:               0.78ms

Threads fairness:
    events (avg/stddev):           88775.7500/2739.46
    execution time (avg/stddev):   59.8161/0.01

