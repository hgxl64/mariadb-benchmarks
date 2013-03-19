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
        read:                            644043
        write:                           0
        other:                           644043
        total:                           1288086
    transactions:                        644043 (10734.00 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 644043 (10734.00 per sec.)
    other operations:                    644043 (10734.00 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              644043
    total time taken by event execution: 118.9531
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.18ms
         max:                                  0.58ms
         approx.  95 percentile:               0.28ms

Threads fairness:
    events (avg/stddev):           322021.5000/67118.50
    execution time (avg/stddev):   59.4765/0.00

