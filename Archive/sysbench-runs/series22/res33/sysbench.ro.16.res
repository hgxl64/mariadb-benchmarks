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
        read:                            1381485
        write:                           0
        other:                           1381485
        total:                           2762970
    transactions:                        1381485 (23024.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1381485 (23024.56 per sec.)
    other operations:                    1381485 (23024.56 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1381485
    total time taken by event execution: 957.7540
    per-request statistics:
         min:                                  0.23ms
         avg:                                  0.69ms
         max:                                  2.06ms
         approx.  95 percentile:               0.89ms

Threads fairness:
    events (avg/stddev):           86342.8125/1512.26
    execution time (avg/stddev):   59.8596/0.01

