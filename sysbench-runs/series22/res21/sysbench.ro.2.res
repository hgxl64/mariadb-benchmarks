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
        read:                            491976
        write:                           0
        other:                           491976
        total:                           983952
    transactions:                        491976 (8199.57 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 491976 (8199.57 per sec.)
    other operations:                    491976 (8199.57 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              491976
    total time taken by event execution: 119.3881
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                  0.65ms
         approx.  95 percentile:               0.33ms

Threads fairness:
    events (avg/stddev):           245988.0000/16694.00
    execution time (avg/stddev):   59.6940/0.00

