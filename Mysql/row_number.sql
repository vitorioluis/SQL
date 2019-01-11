CREATE TABLE produtos(nome VARCHAR(20), qtd int, cor varchar(20));

INSERT INTO produtos VALUES 
  ('milho', 13, 'amarelo'),
  ('arroz', 34, 'marron'),
  ('feijão', 11, 'verde'),
  ('ervilha', 100, 'verde'),
  ('grão de bico', 45, 'marrom'),
   ('soja', 98, 'marrom');

SELECT 
  RANK() OVER (PARTITION BY nome ORDER BY qtd DESC) AS rank, 
  DENSE_RANK() OVER (PARTITION BY nome ORDER BY qtd DESC) AS dense_rank, 
  ROW_NUMBER() OVER (PARTITION BY nome ORDER BY qtd DESC) AS row_num, 
  nome, qtd, cor
FROM produtos ORDER BY nome, qtd DESC;