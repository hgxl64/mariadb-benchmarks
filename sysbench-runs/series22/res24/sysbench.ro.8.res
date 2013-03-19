sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 8

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 7 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1125693
        write:                           0
        other:                           1125693
        total:                           2251386
    transactions:                        1125693 (18761.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1125693 (18761.40 per sec.)
    other operations:                    1125693 (18761.40 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1125693
    total time taken by event execution: 478.2393
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.42ms
         max:                                  4.32ms
         approx.  95 percentile:               0.55ms

Threads fairness:
    events (avg/stddev):           140711.6250/6652.31
    execution time (avg/stddev):   59.7799/0.01

