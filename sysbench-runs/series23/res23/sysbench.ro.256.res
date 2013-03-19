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
        read:                            995325
        write:                           0
        other:                           995325
        total:                           1990650
    transactions:                        995325 (16586.75 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 995325 (16586.75 per sec.)
    other operations:                    995325 (16586.75 per sec.)

Test execution summary:
    total time:                          60.0072s
    total number of events:              995325
    total time taken by event execution: 15353.7307
    per-request statistics:
         min:                                  1.78ms
         avg:                                 15.43ms
         max:                                117.61ms
         approx.  95 percentile:              28.63ms

Threads fairness:
    events (avg/stddev):           3887.9883/36.49
    execution time (avg/stddev):   59.9755/0.00

