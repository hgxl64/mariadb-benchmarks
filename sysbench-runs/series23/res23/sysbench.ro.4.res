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
        read:                            784790
        write:                           0
        other:                           784790
        total:                           1569580
    transactions:                        784790 (13079.77 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 784790 (13079.77 per sec.)
    other operations:                    784790 (13079.77 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              784790
    total time taken by event execution: 238.9355
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.30ms
         max:                                  1.01ms
         approx.  95 percentile:               0.44ms

Threads fairness:
    events (avg/stddev):           196197.5000/11380.84
    execution time (avg/stddev):   59.7339/0.02

