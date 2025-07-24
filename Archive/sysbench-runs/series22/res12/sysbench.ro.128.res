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
        read:                            1417310
        write:                           0
        other:                           1417310
        total:                           2834620
    transactions:                        1417310 (23620.64 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1417310 (23620.64 per sec.)
    other operations:                    1417310 (23620.64 per sec.)

Test execution summary:
    total time:                          60.0030s
    total number of events:              1417310
    total time taken by event execution: 7676.3085
    per-request statistics:
         min:                                  1.55ms
         avg:                                  5.42ms
         max:                                 35.51ms
         approx.  95 percentile:              10.51ms

Threads fairness:
    events (avg/stddev):           11072.7344/58.32
    execution time (avg/stddev):   59.9712/0.00

