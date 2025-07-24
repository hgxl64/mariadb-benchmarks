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
        read:                            2094433
        write:                           0
        other:                           2094433
        total:                           4188866
    transactions:                        2094433 (34905.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2094433 (34905.05 per sec.)
    other operations:                    2094433 (34905.05 per sec.)

Test execution summary:
    total time:                          60.0037s
    total number of events:              2094433
    total time taken by event execution: 7675.6345
    per-request statistics:
         min:                                  1.30ms
         avg:                                  3.66ms
         max:                                 27.52ms
         approx.  95 percentile:               7.53ms

Threads fairness:
    events (avg/stddev):           16362.7578/63.63
    execution time (avg/stddev):   59.9659/0.00

