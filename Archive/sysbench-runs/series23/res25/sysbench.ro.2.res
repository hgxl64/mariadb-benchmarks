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
        read:                            411484
        write:                           0
        other:                           411484
        total:                           822968
    transactions:                        411484 (6858.04 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 411484 (6858.04 per sec.)
    other operations:                    411484 (6858.04 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              411484
    total time taken by event execution: 119.5413
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.29ms
         max:                                  0.80ms
         approx.  95 percentile:               0.40ms

Threads fairness:
    events (avg/stddev):           205742.0000/1273.00
    execution time (avg/stddev):   59.7706/0.01

