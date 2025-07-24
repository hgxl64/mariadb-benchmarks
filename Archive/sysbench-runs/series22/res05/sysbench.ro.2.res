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
        read:                            567658
        write:                           0
        other:                           567658
        total:                           1135316
    transactions:                        567658 (9460.91 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 567658 (9460.91 per sec.)
    other operations:                    567658 (9460.91 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              567658
    total time taken by event execution: 119.2481
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.21ms
         max:                                  0.70ms
         approx.  95 percentile:               0.29ms

Threads fairness:
    events (avg/stddev):           283829.0000/26630.00
    execution time (avg/stddev):   59.6241/0.02

