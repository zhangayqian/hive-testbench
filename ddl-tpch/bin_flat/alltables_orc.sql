create database if not exists ${DB};
use ${DB};

drop table if exists lineitem;
create table lineitem
(L_ORDERKEY BIGINT,
 L_PARTKEY BIGINT,
 L_SUPPKEY BIGINT,
 L_LINENUMBER INT,
 L_QUANTITY DOUBLE,
 L_EXTENDEDPRICE DOUBLE,
 L_DISCOUNT DOUBLE,
 L_TAX DOUBLE,
 L_RETURNFLAG STRING,
 L_LINESTATUS STRING,
 L_SHIPDATE STRING,
 L_COMMITDATE STRING,
 L_RECEIPTDATE STRING,
 L_SHIPINSTRUCT STRING,
 L_SHIPMODE STRING,
 L_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/lineitem';

drop table if exists part;
create table part (P_PARTKEY BIGINT,
 P_NAME STRING,
 P_MFGR STRING,
 P_BRAND STRING,
 P_TYPE STRING,
 P_SIZE INT,
 P_CONTAINER STRING,
 P_RETAILPRICE DOUBLE,
 P_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/part/';

drop table if exists supplier;
create table supplier (S_SUPPKEY BIGINT,
 S_NAME STRING,
 S_ADDRESS STRING,
 S_NATIONKEY BIGINT,
 S_PHONE STRING,
 S_ACCTBAL DOUBLE,
 S_COMMENT STRING) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/supplier/';

drop table if exists partsupp;
create table partsupp (PS_PARTKEY BIGINT,
 PS_SUPPKEY BIGINT,
 PS_AVAILQTY INT,
 PS_SUPPLYCOST DOUBLE,
 PS_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION'${LOCATION}/partsupp';

drop table if exists nation;
create table nation (N_NATIONKEY BIGINT,
 N_NAME STRING,
 N_REGIONKEY BIGINT,
 N_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/nation';

drop table if exists region;
create table region (R_REGIONKEY BIGINT,
 R_NAME STRING,
 R_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/region';

drop table if exists customer;
create table customer (C_CUSTKEY BIGINT,
 C_NAME STRING,
 C_ADDRESS STRING,
 C_NATIONKEY BIGINT,
 C_PHONE STRING,
 C_ACCTBAL DOUBLE,
 C_MKTSEGMENT STRING,
 C_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/customer';

drop table if exists orders;
create table orders (O_ORDERKEY BIGINT,
 O_CUSTKEY BIGINT,
 O_ORDERSTATUS STRING,
 O_TOTALPRICE DOUBLE,
 O_ORDERDATE STRING,
 O_ORDERPRIORITY STRING,
 O_CLERK STRING,
 O_SHIPPRIORITY INT,
 O_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS orc
TBLPROPERTIES('orc.bloom.filter.columns'='*','orc.compress'='ZLIB')
LOCATION '${LOCATION}/orders';
