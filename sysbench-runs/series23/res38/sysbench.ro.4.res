sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 4

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 3 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            694499
        write:                           0
        other:                           694499
        total:                           1388998
    transactions:                        694499 (11574.90 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 694499 (11574.90 per sec.)
    other operations:                    694499 (11574.90 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              694499
    total time taken by event execution: 238.7843
    per-request statistics:
         min:                                  0.21ms
         avg:                                  0.34ms
         max:                                 17.11ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           173624.7500/833.43
    execution time (avg/stddev):   59.6961/0.03

