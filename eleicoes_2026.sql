create database eleicao;
use eleicao;


create table localidade (
    id_localidade int primary key auto_increment,
    nome_localidade varchar(30),
    estado varchar(40)
);

insert into localidade (nome_localidade, estado) values ('recife', 'pe');
insert into localidade (nome_localidade, estado) values ('olinda', 'pe');
insert into localidade (nome_localidade, estado) values ('jaboatão', 'pe');
insert into localidade (nome_localidade, estado) values ('petrolina', 'pe');
insert into localidade (nome_localidade, estado) values ('caruaru', 'pe');


create table zonas_eleitorais (
    id_zona int primary key auto_increment,
    nome_zona varchar(30),
    fk_localidade int,
    foreign key (fk_localidade) references localidade(id_localidade)
);

insert into zonas_eleitorais (nome_zona, fk_localidade) values ('zona norte', 1);
insert into zonas_eleitorais (nome_zona, fk_localidade) values ('zona sul', 1);
insert into zonas_eleitorais (nome_zona, fk_localidade) values ('jaboatão', 3);
insert into zonas_eleitorais (nome_zona, fk_localidade) values ('olinda', 2);
insert into zonas_eleitorais (nome_zona, fk_localidade) values ('caruaru', 5);


create table secoes_eleitorais (
    id_secao int primary key auto_increment,
    nome_secao varchar(30),
    fk_zona int,
    foreign key (fk_zona) references zonas_eleitorais(id_zona)
);


insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 10', 1);
insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 30', 1);
insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 31', 1);
insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 32', 2);
insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 33', 3);
insert into secoes_eleitorais (nome_secao, fk_zona) values ('seção 37', 5);


update secoes_eleitorais set nome_secao = 'seção 30' where id_secao = 1;

delete from zonas_eleitorais where id_zona = 4;
delete from secoes_eleitorais where id_secao = 2;


select * from zonas_eleitorais 
where fk_localidade = 1 
order by nome_zona;

select * from secoes_eleitorais 
where fk_zona = 1 
order by nome_secao;
