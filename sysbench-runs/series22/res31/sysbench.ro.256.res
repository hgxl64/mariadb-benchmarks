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
        read:                            1671829
        write:                           0
        other:                           1671829
        total:                           3343658
    transactions:                        1671829 (27860.58 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1671829 (27860.58 per sec.)
    other operations:                    1671829 (27860.58 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              1671829
    total time taken by event execution: 15352.5011
    per-request statistics:
         min:                                  1.50ms
         avg:                                  9.18ms
         max:                                 97.11ms
         approx.  95 percentile:              22.72ms

Threads fairness:
    events (avg/stddev):           6530.5820/57.18
    execution time (avg/stddev):   59.9707/0.00

