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
        read:                            1663708
        write:                           0
        other:                           1663708
        total:                           3327416
    transactions:                        1663708 (27727.70 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1663708 (27727.70 per sec.)
    other operations:                    1663708 (27727.70 per sec.)

Test execution summary:
    total time:                          60.0017s
    total number of events:              1663708
    total time taken by event execution: 3837.2354
    per-request statistics:
         min:                                  1.44ms
         avg:                                  2.31ms
         max:                                  7.22ms
         approx.  95 percentile:               2.77ms

Threads fairness:
    events (avg/stddev):           25995.4375/22.78
    execution time (avg/stddev):   59.9568/0.00

