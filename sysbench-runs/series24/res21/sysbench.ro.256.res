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
        read:                            1666808
        write:                           0
        other:                           1666808
        total:                           3333616
    transactions:                        1666808 (27776.97 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1666808 (27776.97 per sec.)
    other operations:                    1666808 (27776.97 per sec.)

Test execution summary:
    total time:                          60.0068s
    total number of events:              1666808
    total time taken by event execution: 15352.3472
    per-request statistics:
         min:                                  1.47ms
         avg:                                  9.21ms
         max:                                106.43ms
         approx.  95 percentile:              22.73ms

Threads fairness:
    events (avg/stddev):           6510.9688/55.60
    execution time (avg/stddev):   59.9701/0.00

