sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            183501
        write:                           0
        other:                           183501
        total:                           367002
    transactions:                        183501 (3058.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 183501 (3058.34 per sec.)
    other operations:                    183501 (3058.34 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              183501
    total time taken by event execution: 59.8388
    per-request statistics:
         min:                                  0.18ms
         avg:                                  0.33ms
         max:                                  0.76ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           183501.0000/0.00
    execution time (avg/stddev):   59.8388/0.00

