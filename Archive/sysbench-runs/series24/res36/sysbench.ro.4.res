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
        read:                            924820
        write:                           0
        other:                           924820
        total:                           1849640
    transactions:                        924820 (15413.59 per sec.)
    deadlocks:                           0      (0.00 per sec.)
    read/write requests:                 924820 (15413.59 per sec.)
    other operations:                    924820 (15413.59 per sec.)

Test execution summary:
    total time:                          60.0003s
    total number of events:              924820
    total time taken by event execution: 238.6078
    per-request statistics:
         min:                                  0.11ms
         avg:                                  0.26ms
         max:                                 16.52ms
         approx.  95 percentile:               0.34ms

Threads fairness:
    events (avg/stddev):           231205.0000/10153.99
    execution time (avg/stddev):   59.6520/0.03

