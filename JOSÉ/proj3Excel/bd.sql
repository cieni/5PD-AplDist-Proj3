
create table DCurso(
 codigo int primary key,
 nome   varchar(30)
)

create table DDisciplina(
 codigo int primary key,
 nome   varchar(30)
)

create table DAluno(
 RA   varchar(5) primary key,
 nome varchar(40)
)

create table DProfessor(
 codigo int primary key,
 nome varchar(40)
)

create table DTurma(
 codigoTurma int primary key,
 codigoCurso int,
 codigoDisciplina int,
 codigoProfessor int,
 periodo varchar(10),
 constraint fkCodigoCurso foreign key(codigoCurso) references DCurso(codigo),
 constraint fkCodigoDisciplina foreign key(codigoDisciplina) references DDisciplina(codigo),
 constraint fkCodigoProfessor foreign key(codigoProfessor) references DProfessor(codigo)
)

create table DDiario(
codigoTurma int,
RA varchar(5),
constraint fkCodigoTurmaDiario foreign key(codigoTurma) references DTurma(codigoTurma),
constraint fkRADiario foreign key(RA) references DAluno(RA)
)