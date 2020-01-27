`dcrlncli fwdinghistory` - Query the history of all forwarded HTLCs.

### Usage:
```
   dcrlncli fwdinghistory [command options] start_time [end_time] [index_offset] [max_events]
```

### Description:
   
  Query the HTLC switch's internal forwarding log for all completed
  payment circuits (HTLCs) over a particular time range (--start_time and
  --end_time). The start and end times are meant to be expressed in
  seconds since the Unix epoch. If --start_time isn't provided,
  then 24 hours ago is used.  If --end_time isn't provided,
  then the current time is used.

  The max number of events returned is 50k. The default number is 100,
  callers can use the --max_events param to modify this value.

  Finally, callers can skip a series of events using the --index_offset
  parameter. Each response will contain the offset index of the last
  entry. Using this callers can manually paginate within a time slice.
  

### Options:
|option|info|
|--|--|
|`--start_time value`|    the starting time for the query, expressed in seconds since the unix epoch (default: 0)|
|`--end_time value`|      the end time for the query, expressed in seconds since the unix epoch (default: 0)|
|`--index_offset value`|  the number of events to skip (default: 0)|
|`--max_events value`|    the max number of events to return (default: 0)|
