sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 2

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
(last message repeated 1 times)
Done.

OLTP test statistics:
    queries performed:
        read:                            463803
        write:                           0
        other:                           463803
        total:                           927606
    transactions:                        463803 (7730.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 463803 (7730.02 per sec.)
    other operations:                    463803 (7730.02 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              463803
    total time taken by event execution: 119.5696
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.26ms
         max:                                  0.78ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           231901.5000/226.50
    execution time (avg/stddev):   59.7848/0.00

