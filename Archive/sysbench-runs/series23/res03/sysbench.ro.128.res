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
        read:                            1114984
        write:                           0
        other:                           1114984
        total:                           2229968
    transactions:                        1114984 (18582.09 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1114984 (18582.09 per sec.)
    other operations:                    1114984 (18582.09 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1114984
    total time taken by event execution: 7676.9003
    per-request statistics:
         min:                                  1.56ms
         avg:                                  6.89ms
         max:                                 37.54ms
         approx.  95 percentile:              11.45ms

Threads fairness:
    events (avg/stddev):           8710.8125/39.95
    execution time (avg/stddev):   59.9758/0.00

