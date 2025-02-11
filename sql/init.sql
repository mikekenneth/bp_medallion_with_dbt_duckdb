-- Install TPC-H Dataset Generator
INSTALL tpch;

LOAD tpch;

-- Clean Up exitsintg
DROP TABLE IF EXISTS customer;

DROP TABLE IF EXISTS lineitem;

DROP TABLE IF EXISTS nation;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS PART;

DROP TABLE IF EXISTS partsupp;

DROP TABLE IF EXISTS region;

DROP TABLE IF EXISTS supplier;

-- Generete with a factor of 1 (250MB of data)
CALL dbgen(sf = 1);