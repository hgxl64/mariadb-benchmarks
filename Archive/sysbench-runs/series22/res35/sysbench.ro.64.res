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
        read:                            2416827
        write:                           0
        other:                           2416827
        total:                           4833654
    transactions:                        2416827 (40279.42 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2416827 (40279.42 per sec.)
    other operations:                    2416827 (40279.42 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              2416827
    total time taken by event execution: 3836.0087
    per-request statistics:
         min:                                  1.01ms
         avg:                                  1.59ms
         max:                                 10.67ms
         approx.  95 percentile:               1.89ms

Threads fairness:
    events (avg/stddev):           37762.9219/31.50
    execution time (avg/stddev):   59.9376/0.00

