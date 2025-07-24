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
        read:                            1417571
        write:                           0
        other:                           1417571
        total:                           2835142
    transactions:                        1417571 (23625.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1417571 (23625.56 per sec.)
    other operations:                    1417571 (23625.56 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1417571
    total time taken by event execution: 3837.4168
    per-request statistics:
         min:                                  1.35ms
         avg:                                  2.71ms
         max:                                  9.29ms
         approx.  95 percentile:               3.25ms

Threads fairness:
    events (avg/stddev):           22149.5469/22.46
    execution time (avg/stddev):   59.9596/0.00

