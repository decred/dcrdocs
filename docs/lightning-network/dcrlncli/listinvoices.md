`dcrlncli listinvoices` - List all invoices currently stored within the database. Any active debug invoices are ignored.

### Usage
```
   dcrlncli listinvoices [command options] [arguments...]
```

### Description

This command enables the retrieval of all invoices currently stored
within the database. It has full support for paginationed responses,
allowing users to query for specific invoices through their `add_index`.
This can be done by using either the `first_index_offset` or
`last_index_offset` fields included in the response as the `index_offset` of
the next request. The reversed flag is set by default in order to
paginate backwards. If you wish to paginate forwards, you must
explicitly set the flag to false. If none of the parameters are
specified, then the last 100 invoices will be returned.

For example: if you have 200 invoices, `dcrlncli listinvoices` will return
the last 100 created. If you wish to retrieve the previous 100, the
`first_offset_index` of the response can be used as the index_offset of
the next listinvoices request.

### Options
|Option|Info|
|--|--|
|`--pending_only`|        toggles if all invoices should be returned, or only those that are currently unsettled|
|`--index_offset value`|  the index of an invoice that will be used as either the start or end of a query to determine which invoices should be returned in the response (default: 0)|
|`--max_invoices value`|  the max number of invoices to return (default: 0)|
|`--reversed`|            if set, the invoices returned precede the given index_offset, allowing backwards pagination|
