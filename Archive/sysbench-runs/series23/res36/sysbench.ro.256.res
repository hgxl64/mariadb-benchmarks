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
        read:                            1678853
        write:                           0
        other:                           1678853
        total:                           3357706
    transactions:                        1678853 (27977.62 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1678853 (27977.62 per sec.)
    other operations:                    1678853 (27977.62 per sec.)

Test execution summary:
    total time:                          60.0070s
    total number of events:              1678853
    total time taken by event execution: 15352.4545
    per-request statistics:
         min:                                  1.50ms
         avg:                                  9.14ms
         max:                                 88.33ms
         approx.  95 percentile:              22.87ms

Threads fairness:
    events (avg/stddev):           6558.0195/45.67
    execution time (avg/stddev):   59.9705/0.00

