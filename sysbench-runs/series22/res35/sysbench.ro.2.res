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
        read:                            395824
        write:                           0
        other:                           395824
        total:                           791648
    transactions:                        395824 (6597.05 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 395824 (6597.05 per sec.)
    other operations:                    395824 (6597.05 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              395824
    total time taken by event execution: 119.2958
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.30ms
         max:                                  0.90ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           197912.0000/1862.00
    execution time (avg/stddev):   59.6479/0.02

