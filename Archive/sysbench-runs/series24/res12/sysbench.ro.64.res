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
        read:                            1394453
        write:                           0
        other:                           1394453
        total:                           2788906
    transactions:                        1394453 (23240.31 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1394453 (23240.31 per sec.)
    other operations:                    1394453 (23240.31 per sec.)

Test execution summary:
    total time:                          60.0015s
    total number of events:              1394453
    total time taken by event execution: 3837.5577
    per-request statistics:
         min:                                  1.30ms
         avg:                                  2.75ms
         max:                                  9.58ms
         approx.  95 percentile:               3.32ms

Threads fairness:
    events (avg/stddev):           21788.3281/16.94
    execution time (avg/stddev):   59.9618/0.00

