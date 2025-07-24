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
        read:                            954028
        write:                           0
        other:                           954028
        total:                           1908056
    transactions:                        954028 (15900.40 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 954028 (15900.40 per sec.)
    other operations:                    954028 (15900.40 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              954028
    total time taken by event execution: 239.2354
    per-request statistics:
         min:                                  0.16ms
         avg:                                  0.25ms
         max:                                  0.89ms
         approx.  95 percentile:               0.30ms

Threads fairness:
    events (avg/stddev):           238507.0000/448.76
    execution time (avg/stddev):   59.8088/0.00

