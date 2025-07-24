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
        read:                            1586908
        write:                           0
        other:                           1586908
        total:                           3173816
    transactions:                        1586908 (26447.61 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1586908 (26447.61 per sec.)
    other operations:                    1586908 (26447.61 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              1586908
    total time taken by event execution: 3837.3031
    per-request statistics:
         min:                                  0.42ms
         avg:                                  2.42ms
         max:                                  7.38ms
         approx.  95 percentile:               2.87ms

Threads fairness:
    events (avg/stddev):           24795.4375/21.42
    execution time (avg/stddev):   59.9579/0.00

