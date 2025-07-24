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
        read:                            1360585
        write:                           0
        other:                           1360585
        total:                           2721170
    transactions:                        1360585 (22675.67 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1360585 (22675.67 per sec.)
    other operations:                    1360585 (22675.67 per sec.)

Test execution summary:
    total time:                          60.0020s
    total number of events:              1360585
    total time taken by event execution: 3837.4668
    per-request statistics:
         min:                                  1.69ms
         avg:                                  2.82ms
         max:                                  6.98ms
         approx.  95 percentile:               3.44ms

Threads fairness:
    events (avg/stddev):           21259.1406/20.04
    execution time (avg/stddev):   59.9604/0.00

