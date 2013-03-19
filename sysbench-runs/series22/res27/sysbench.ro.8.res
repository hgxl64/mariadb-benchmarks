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
        read:                            1652881
        write:                           0
        other:                           1652881
        total:                           3305762
    transactions:                        1652881 (27547.85 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1652881 (27547.85 per sec.)
    other operations:                    1652881 (27547.85 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              1652881
    total time taken by event execution: 477.7947
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.29ms
         max:                                 11.69ms
         approx.  95 percentile:               0.39ms

Threads fairness:
    events (avg/stddev):           206610.1250/2721.82
    execution time (avg/stddev):   59.7243/0.01

