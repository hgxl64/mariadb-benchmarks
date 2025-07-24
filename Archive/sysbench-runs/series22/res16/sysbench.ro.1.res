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
        read:                            177580
        write:                           0
        other:                           177580
        total:                           355160
    transactions:                        177580 (2959.65 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 177580 (2959.65 per sec.)
    other operations:                    177580 (2959.65 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              177580
    total time taken by event execution: 59.8710
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.34ms
         max:                                  0.88ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           177580.0000/0.00
    execution time (avg/stddev):   59.8710/0.00

