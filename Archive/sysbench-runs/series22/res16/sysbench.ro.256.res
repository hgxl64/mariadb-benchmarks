sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 256

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 255 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            1960616
        write:                           0
        other:                           1960616
        total:                           3921232
    transactions:                        1960616 (32673.01 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1960616 (32673.01 per sec.)
    other operations:                    1960616 (32673.01 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              1960616
    total time taken by event execution: 15351.8662
    per-request statistics:
         min:                                  1.24ms
         avg:                                  7.83ms
         max:                                 88.58ms
         approx.  95 percentile:              19.78ms

Threads fairness:
    events (avg/stddev):           7658.6562/52.97
    execution time (avg/stddev):   59.9682/0.00

