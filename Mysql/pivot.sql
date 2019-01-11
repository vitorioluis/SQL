DROP TABLE IF EXISTS exemple_pivot_table;

create table exemple_pivot_table(
	codProduto varchar(20),
	tamanho	varchar(2),
	qtd_estoque int
    );


INSERT IGNORE INTO exemple_pivot_table(codProduto,  tamanho, qtd_estoque) VALUES 
('333','40',10),
('333','41',36),
('333','42',59),
('333','43',2),
('333','39',23);


select * from exemple_pivot_table;

SELECT codProduto, [1],[2],[3],[4],[5]
FROM exemple_pivot_table 
PIVOT (
	SUM(qtd_estoque) 
	FOR tamanho IN ([1],[2],[3],[4],[5])
)P
