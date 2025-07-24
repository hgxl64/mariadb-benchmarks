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
        read:                            1459173
        write:                           0
        other:                           1459173
        total:                           2918346
    transactions:                        1459173 (24319.34 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1459173 (24319.34 per sec.)
    other operations:                    1459173 (24319.34 per sec.)

Test execution summary:
    total time:                          60.0005s
    total number of events:              1459173
    total time taken by event execution: 477.4933
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.33ms
         max:                                  1.67ms
         approx.  95 percentile:               0.46ms

Threads fairness:
    events (avg/stddev):           182396.6250/12889.89
    execution time (avg/stddev):   59.6867/0.02

