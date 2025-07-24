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
        read:                            1344949
        write:                           0
        other:                           1344949
        total:                           2689898
    transactions:                        1344949 (22413.10 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 1344949 (22413.10 per sec.)
    other operations:                    1344949 (22413.10 per sec.)

Test execution summary:
    total time:                          60.0073s
    total number of events:              1344949
    total time taken by event execution: 15352.9974
    per-request statistics:
         min:                                  1.07ms
         avg:                                 11.42ms
         max:                                108.75ms
         approx.  95 percentile:              23.12ms

Threads fairness:
    events (avg/stddev):           5253.7070/50.33
    execution time (avg/stddev):   59.9726/0.00

