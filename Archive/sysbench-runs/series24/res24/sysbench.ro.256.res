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
        read:                            1049954
        write:                           0
        other:                           1049954
        total:                           2099908
    transactions:                        1049954 (17495.56 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1049954 (17495.56 per sec.)
    other operations:                    1049954 (17495.56 per sec.)

Test execution summary:
    total time:                          60.0126s
    total number of events:              1049954
    total time taken by event execution: 15353.5898
    per-request statistics:
         min:                                  6.58ms
         avg:                                 14.62ms
         max:                                 84.11ms
         approx.  95 percentile:              22.11ms

Threads fairness:
    events (avg/stddev):           4101.3828/26.51
    execution time (avg/stddev):   59.9750/0.00

