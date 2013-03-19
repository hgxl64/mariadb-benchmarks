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
        read:                            886426
        write:                           0
        other:                           886426
        total:                           1772852
    transactions:                        886426 (14773.73 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 886426 (14773.73 per sec.)
    other operations:                    886426 (14773.73 per sec.)

Test execution summary:
    total time:                          60.0001s
    total number of events:              886426
    total time taken by event execution: 238.5300
    per-request statistics:
         min:                                  0.15ms
         avg:                                  0.27ms
         max:                                  1.86ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           221606.5000/1672.53
    execution time (avg/stddev):   59.6325/0.02

