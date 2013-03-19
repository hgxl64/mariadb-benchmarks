sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            456009
        write:                           0
        other:                           456009
        total:                           912018
    transactions:                        456009 (7600.11 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 456009 (7600.11 per sec.)
    other operations:                    456009 (7600.11 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              456009
    total time taken by event execution: 119.4878
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.26ms
         max:                                  1.49ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           228004.5000/338.50
    execution time (avg/stddev):   59.7439/0.01

