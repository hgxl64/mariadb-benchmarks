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
        read:                            550767
        write:                           0
        other:                           550767
        total:                           1101534
    transactions:                        550767 (9179.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 550767 (9179.41 per sec.)
    other operations:                    550767 (9179.41 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              550767
    total time taken by event execution: 119.2872
    per-request statistics:
         min:                                  0.10ms
         avg:                                  0.22ms
         max:                                  0.64ms
         approx.  95 percentile:               0.31ms

Threads fairness:
    events (avg/stddev):           275383.5000/22295.50
    execution time (avg/stddev):   59.6436/0.00

