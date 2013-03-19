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
        read:                            497703
        write:                           0
        other:                           497703
        total:                           995406
    transactions:                        497703 (8295.02 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 497703 (8295.02 per sec.)
    other operations:                    497703 (8295.02 per sec.)

Test execution summary:
    total time:                          60.0002s
    total number of events:              497703
    total time taken by event execution: 119.4210
    per-request statistics:
         min:                                  0.14ms
         avg:                                  0.24ms
         max:                                  1.33ms
         approx.  95 percentile:               0.32ms

Threads fairness:
    events (avg/stddev):           248851.5000/53.50
    execution time (avg/stddev):   59.7105/0.00

