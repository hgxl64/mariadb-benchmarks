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
        read:                            2405569
        write:                           0
        other:                           2405569
        total:                           4811138
    transactions:                        2405569 (40087.90 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 2405569 (40087.90 per sec.)
    other operations:                    2405569 (40087.90 per sec.)

Test execution summary:
    total time:                          60.0074s
    total number of events:              2405569
    total time taken by event execution: 15351.2981
    per-request statistics:
         min:                                  1.08ms
         avg:                                  6.38ms
         max:                                 81.63ms
         approx.  95 percentile:              16.35ms

Threads fairness:
    events (avg/stddev):           9396.7539/72.58
    execution time (avg/stddev):   59.9660/0.00

