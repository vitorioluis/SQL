DROP TABLE IF EXISTS exemple_partion_table;

CREATE TABLE exemple_partion_table (
  id INT,
  data_ref DATE,
  valor INT DEFAULt 0)

PARTITION BY RANGE (YEAR(DATA_REF))
(	PARTITION p0 VALUES LESS THAN (2017),
	PARTITION p1 VALUES LESS THAN (2018),
    PARTITION p2 VALUES LESS THAN (2019),
    PARTITION p3 VALUES LESS THAN MAXVALUE
 );
 
 
 
 INSERT IGNORE INTO exemple_partion_table(valor,data_ref) VALUES 
  (1, '2017-02-01'), 
  (2, '2018-01-01'), 
  (3, '2019-09-01'), 
  (4, '2016-01-01'), 
  (5, '2017-01-01'), 
  (6, '2018-01-01');