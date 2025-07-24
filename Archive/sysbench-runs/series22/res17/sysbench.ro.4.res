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
        read:                            982855
        write:                           0
        other:                           982855
        total:                           1965710
    transactions:                        982855 (16380.83 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 982855 (16380.83 per sec.)
    other operations:                    982855 (16380.83 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              982855
    total time taken by event execution: 238.6506
    per-request statistics:
         min:                                  0.12ms
         avg:                                  0.24ms
         max:                                 12.55ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           245713.7500/11262.71
    execution time (avg/stddev):   59.6626/0.03

