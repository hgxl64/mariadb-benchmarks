sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 16

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 15 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2282422
        write:                           0
        other:                           2282422
        total:                           4564844
    transactions:                        2282422 (38039.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2282422 (38039.98 per sec.)
    other operations:                    2282422 (38039.98 per sec.)

Test execution summary:
    total time:                          60.0006s
    total number of events:              2282422
    total time taken by event execution: 955.8856
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.42ms
         max:                                  2.33ms
         approx.  95 percentile:               0.57ms

Threads fairness:
    events (avg/stddev):           142651.3750/2255.78
    execution time (avg/stddev):   59.7429/0.01

