sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            918110
        write:                           0
        other:                           918110
        total:                           1836220
    transactions:                        918110 (15301.76 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 918110 (15301.76 per sec.)
    other operations:                    918110 (15301.76 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              918110
    total time taken by event execution: 238.5901
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.26ms
         max:                                  1.44ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           229527.5000/12295.11
    execution time (avg/stddev):   59.6475/0.01

