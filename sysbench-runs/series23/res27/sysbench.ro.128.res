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
        read:                            1585492
        write:                           0
        other:                           1585492
        total:                           3170984
    transactions:                        1585492 (26423.20 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1585492 (26423.20 per sec.)
    other operations:                    1585492 (26423.20 per sec.)

Test execution summary:
    total time:                          60.0038s
    total number of events:              1585492
    total time taken by event execution: 7676.2677
    per-request statistics:
         min:                                  1.64ms
         avg:                                  4.84ms
         max:                                 39.34ms
         approx.  95 percentile:               9.71ms

Threads fairness:
    events (avg/stddev):           12386.6562/49.04
    execution time (avg/stddev):   59.9708/0.00

