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
        read:                            1394815
        write:                           0
        other:                           1394815
        total:                           2789630
    transactions:                        1394815 (23244.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1394815 (23244.57 per sec.)
    other operations:                    1394815 (23244.57 per sec.)

Test execution summary:
    total time:                          60.0061s
    total number of events:              1394815
    total time taken by event execution: 15352.5835
    per-request statistics:
         min:                                  1.57ms
         avg:                                 11.01ms
         max:                                 98.61ms
         approx.  95 percentile:              25.82ms

Threads fairness:
    events (avg/stddev):           5448.4961/40.39
    execution time (avg/stddev):   59.9710/0.00

