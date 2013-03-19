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
        read:                            1673547
        write:                           0
        other:                           1673547
        total:                           3347094
    transactions:                        1673547 (27890.95 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1673547 (27890.95 per sec.)
    other operations:                    1673547 (27890.95 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1673547
    total time taken by event execution: 7676.0410
    per-request statistics:
         min:                                  1.47ms
         avg:                                  4.59ms
         max:                                 35.32ms
         approx.  95 percentile:               9.33ms

Threads fairness:
    events (avg/stddev):           13074.5859/53.11
    execution time (avg/stddev):   59.9691/0.00

