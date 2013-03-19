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
        read:                            832420
        write:                           0
        other:                           832420
        total:                           1664840
    transactions:                        832420 (13873.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 832420 (13873.59 per sec.)
    other operations:                    832420 (13873.59 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              832420
    total time taken by event execution: 238.6657
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.29ms
         max:                                  3.11ms
         approx.  95 percentile:               0.38ms

Threads fairness:
    events (avg/stddev):           208105.0000/16040.18
    execution time (avg/stddev):   59.6664/0.03

