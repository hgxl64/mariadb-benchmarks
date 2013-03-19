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
        read:                            1268444
        write:                           0
        other:                           1268444
        total:                           2536888
    transactions:                        1268444 (21140.16 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1268444 (21140.16 per sec.)
    other operations:                    1268444 (21140.16 per sec.)

Test execution summary:
    total time:                          60.0016s
    total number of events:              1268444
    total time taken by event execution: 3837.6864
    per-request statistics:
         min:                                  1.35ms
         avg:                                  3.03ms
         max:                                  8.41ms
         approx.  95 percentile:               3.60ms

Threads fairness:
    events (avg/stddev):           19819.4375/14.00
    execution time (avg/stddev):   59.9639/0.00

