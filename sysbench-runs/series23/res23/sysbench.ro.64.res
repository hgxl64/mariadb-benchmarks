sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 64

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 63 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            995938
        write:                           0
        other:                           995938
        total:                           1991876
    transactions:                        995938 (16598.43 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 995938 (16598.43 per sec.)
    other operations:                    995938 (16598.43 per sec.)

Test execution summary:
    total time:                          60.0019s
    total number of events:              995938
    total time taken by event execution: 3838.1035
    per-request statistics:
         min:                                  1.90ms
         avg:                                  3.85ms
         max:                                 10.07ms
         approx.  95 percentile:               4.55ms

Threads fairness:
    events (avg/stddev):           15561.5312/12.76
    execution time (avg/stddev):   59.9704/0.00

