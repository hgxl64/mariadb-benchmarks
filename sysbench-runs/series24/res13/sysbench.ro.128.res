sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1310715
        write:                           0
        other:                           1310715
        total:                           2621430
    transactions:                        1310715 (21844.07 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1310715 (21844.07 per sec.)
    other operations:                    1310715 (21844.07 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1310715
    total time taken by event execution: 7676.5550
    per-request statistics:
         min:                                  1.67ms
         avg:                                  5.86ms
         max:                                 43.73ms
         approx.  95 percentile:              10.40ms

Threads fairness:
    events (avg/stddev):           10239.9609/45.70
    execution time (avg/stddev):   59.9731/0.00

