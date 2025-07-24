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
        read:                            749524
        write:                           0
        other:                           749524
        total:                           1499048
    transactions:                        749524 (12491.98 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 749524 (12491.98 per sec.)
    other operations:                    749524 (12491.98 per sec.)

Test execution summary:
    total time:                          60.0004s
    total number of events:              749524
    total time taken by event execution: 238.7607
    per-request statistics:
         min:                                  0.13ms
         avg:                                  0.32ms
         max:                                  1.44ms
         approx.  95 percentile:               0.41ms

Threads fairness:
    events (avg/stddev):           187381.0000/2421.14
    execution time (avg/stddev):   59.6902/0.01

