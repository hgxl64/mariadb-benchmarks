sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 128

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 127 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            2430528
        write:                           0
        other:                           2430528
        total:                           4861056
    transactions:                        2430528 (40506.47 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2430528 (40506.47 per sec.)
    other operations:                    2430528 (40506.47 per sec.)

Test execution summary:
    total time:                          60.0035s
    total number of events:              2430528
    total time taken by event execution: 7674.8032
    per-request statistics:
         min:                                  1.06ms
         avg:                                  3.16ms
         max:                                 28.51ms
         approx.  95 percentile:               6.64ms

Threads fairness:
    events (avg/stddev):           18988.5000/81.66
    execution time (avg/stddev):   59.9594/0.00

