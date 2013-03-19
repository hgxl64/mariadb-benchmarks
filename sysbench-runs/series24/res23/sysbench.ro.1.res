sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            180496
        write:                           0
        other:                           180496
        total:                           360992
    transactions:                        180496 (3008.25 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 180496 (3008.25 per sec.)
    other operations:                    180496 (3008.25 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              180496
    total time taken by event execution: 59.8236
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.33ms
         max:                                  0.85ms
         approx.  95 percentile:               0.43ms

Threads fairness:
    events (avg/stddev):           180496.0000/0.00
    execution time (avg/stddev):   59.8236/0.00

