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
        read:                            1414726
        write:                           0
        other:                           1414726
        total:                           2829452
    transactions:                        1414726 (23577.44 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1414726 (23577.44 per sec.)
    other operations:                    1414726 (23577.44 per sec.)

Test execution summary:
    total time:                          60.0034s
    total number of events:              1414726
    total time taken by event execution: 7676.3754
    per-request statistics:
         min:                                  1.60ms
         avg:                                  5.43ms
         max:                                 38.46ms
         approx.  95 percentile:              10.56ms

Threads fairness:
    events (avg/stddev):           11052.5469/59.87
    execution time (avg/stddev):   59.9717/0.00

