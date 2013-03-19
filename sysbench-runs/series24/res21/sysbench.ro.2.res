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
        read:                            474086
        write:                           0
        other:                           474086
        total:                           948172
    transactions:                        474086 (7901.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 474086 (7901.40 per sec.)
    other operations:                    474086 (7901.40 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              474086
    total time taken by event execution: 119.4302
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.25ms
         max:                                  0.69ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           237043.0000/3716.00
    execution time (avg/stddev):   59.7151/0.01

