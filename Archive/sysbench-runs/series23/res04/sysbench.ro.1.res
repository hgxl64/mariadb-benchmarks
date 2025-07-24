sysbench 0.4.12:  multi-threaded system evaluation benchmark

No DB drivers specified, using mysql
Running the test with following options:
Number of threads: 1

Doing OLTP test.
Running simple OLTP test
Doing read-only test
Using Uniform distribution
Skipping BEGIN/COMMIT
Using auto_inc on the id column
Threads started!
Time limit exceeded, exiting...
Done.

OLTP test statistics:
    queries performed:
        read:                            208310
        write:                           0
        other:                           208310
        total:                           416620
    transactions:                        208310 (3471.82 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 208310 (3471.82 per sec.)
    other operations:                    208310 (3471.82 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              208310
    total time taken by event execution: 59.8597
    per-request statistics:
         min:                                  0.17ms
         avg:                                  0.29ms
         max:                                  0.84ms
         approx.  95 percentile:               0.36ms

Threads fairness:
    events (avg/stddev):           208310.0000/0.00
    execution time (avg/stddev):   59.8597/0.00

