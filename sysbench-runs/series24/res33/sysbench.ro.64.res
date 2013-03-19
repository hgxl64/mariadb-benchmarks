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
        read:                            1266664
        write:                           0
        other:                           1266664
        total:                           2533328
    transactions:                        1266664 (21110.43 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1266664 (21110.43 per sec.)
    other operations:                    1266664 (21110.43 per sec.)

Test execution summary:
    total time:                          60.0018s
    total number of events:              1266664
    total time taken by event execution: 3837.6835
    per-request statistics:
         min:                                  1.55ms
         avg:                                  3.03ms
         max:                                 10.09ms
         approx.  95 percentile:               3.65ms

Threads fairness:
    events (avg/stddev):           19791.6250/15.89
    execution time (avg/stddev):   59.9638/0.00

