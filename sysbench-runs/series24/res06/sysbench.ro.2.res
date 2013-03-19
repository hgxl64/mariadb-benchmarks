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
        read:                            547692
        write:                           0
        other:                           547692
        total:                           1095384
    transactions:                        547692 (9128.13 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 547692 (9128.13 per sec.)
    other operations:                    547692 (9128.13 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              547692
    total time taken by event execution: 119.4730
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.22ms
         max:                                  0.69ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           273846.0000/6668.00
    execution time (avg/stddev):   59.7365/0.02

