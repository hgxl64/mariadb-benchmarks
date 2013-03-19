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
        read:                            1043779
        write:                           0
        other:                           1043779
        total:                           2087558
    transactions:                        1043779 (17395.41 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1043779 (17395.41 per sec.)
    other operations:                    1043779 (17395.41 per sec.)

Test execution summary:
    total time:                          60.0031s
    total number of events:              1043779
    total time taken by event execution: 3837.9721
    per-request statistics:
         min:                                  2.11ms
         avg:                                  3.68ms
         max:                                  8.73ms
         approx.  95 percentile:               3.97ms

Threads fairness:
    events (avg/stddev):           16309.0469/7.07
    execution time (avg/stddev):   59.9683/0.00

