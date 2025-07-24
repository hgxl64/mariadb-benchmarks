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
        read:                            1403063
        write:                           0
        other:                           1403063
        total:                           2806126
    transactions:                        1403063 (23383.14 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1403063 (23383.14 per sec.)
    other operations:                    1403063 (23383.14 per sec.)

Test execution summary:
    total time:                          60.0032s
    total number of events:              1403063
    total time taken by event execution: 7676.4308
    per-request statistics:
         min:                                  1.53ms
         avg:                                  5.47ms
         max:                                 36.05ms
         approx.  95 percentile:              10.44ms

Threads fairness:
    events (avg/stddev):           10961.4297/47.66
    execution time (avg/stddev):   59.9721/0.00

