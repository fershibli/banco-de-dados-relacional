use exercicio3;

-- right outer join
select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
right outer join Setor s on f.cod_setor = s.cod_setor
where f.cod_setor is null;

-- full outer join
select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
full outer join Setor s on f.cod_setor = s.cod_setor;

-- full outer join fk null
select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
full outer join Setor s on f.cod_setor = s.cod_setor
where f.cod_setor is null or s.cod_setor is null;

-- cross join
select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
cross join Setor s
order by f.primeiro_nome;
