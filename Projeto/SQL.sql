-- livros não trocados que 1 curtiu
SELECT tbLivro.Id, tbLivro.Nome, tbLivro.IdDono
FROM tbLivro
INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
WHERE tbCurtida.IdUsuario = 1 AND tbLivro.Trocado = 0

-- usuários que gostaram de algum livro de 1, não trocados
SELECT DISTINCT tbUsuario.Id
FROM tbUsuario
INNER JOIN tbCurtida ON tbUsuario.Id = tbCurtida.IdUsuario
INNER JOIN tbLivro ON tbCurtida.IdLivro = tbLivro.Id
WHERE tbLivro.IdDono = 1 AND tbLivro.Trocado = 0

-- usuários com quem 3 pode trocar livros
SELECT DISTINCT tbUsuario.Id [IdDono], tbUsuario.Nome [NomeDono]
FROM tbLivro
INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
INNER JOIN (SELECT DISTINCT tbUsuario.Id
	FROM tbUsuario
	INNER JOIN tbCurtida ON tbUsuario.Id = tbCurtida.IdUsuario
	INNER JOIN tbLivro ON tbCurtida.IdLivro = tbLivro.Id
	WHERE tbLivro.IdDono = 3 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0) temp ON tbLivro.IdDono = temp.Id
INNER JOIN tbUsuario ON tbLivro.IdDono = tbUsuario.Id
WHERE tbCurtida.IdUsuario = 3 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0
ORDER BY tbUsuario.Nome

-- pega os livros que a pessoa curtiu de voce
SELECT tbLivro.Id [IdLivro], tbLivro.Nome [NomeLivro]
FROM tbLivro
INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
WHERE tbCurtida.IdUsuario = 21 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0 AND tbLivro.IdDono = 8
ORDER BY tbLivro.Nome

-- livros que 3 pode trocar (de qualquer dono)
SELECT tbLivro.Id [IdLivro], tbLivro.Nome [NomeLivro], tbUsuario.Id [IdDono], tbUsuario.Nome [NomeDono], tbUsuario.Email [EmailDono]
FROM tbLivro
INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
INNER JOIN (SELECT DISTINCT tbUsuario.Id
	FROM tbUsuario
	INNER JOIN tbCurtida ON tbUsuario.Id = tbCurtida.IdUsuario
	INNER JOIN tbLivro ON tbCurtida.IdLivro = tbLivro.Id
	WHERE tbLivro.IdDono = 3 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0) temp ON tbLivro.IdDono = temp.Id
INNER JOIN tbUsuario ON tbLivro.IdDono = tbUsuario.Id
WHERE tbCurtida.IdUsuario = 3 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0
ORDER BY tbUsuario.Id, tbLivro.Nome

-- livros ainda não curtidos pelo usuário 1
SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Sinopse
FROM tbLivro
	LEFT JOIN (SELECT IdLivro FROM tbCurtida WHERE IdUsuario = 1) temp
	ON tbLivro.Id = temp.IdLivro
WHERE tbLivro.Trocado = 0 AND temp.IdLivro IS NULL AND tbLivro.IdDono <> 1
ORDER BY tbLivro.Id DESC

-- livros curtidos pelo usuário 1
SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Sinopse FROM tbLivro
	INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
WHERE tbCurtida.IdUsuario = 1 AND tbCurtida.Curtida = 1 AND tbLivro.Trocado = 0

-- livros descurtidos pelo usuário 1
SELECT tbLivro.Id, tbLivro.Nome, tbLivro.Sinopse FROM tbLivro
	INNER JOIN tbCurtida ON tbLivro.Id = tbCurtida.IdLivro
WHERE tbCurtida.IdUsuario = 1 AND tbCurtida.Curtida = 0 AND tbLivro.Trocado = 0

-- removendo uma curtida do usuário 1, com o livro 2
DELETE FROM tbCurtida WHERE tbCurtida.IdUsuario = 1 AND tbCurtida.IdLivro = 2

-- acrescentando uma curtida do usuário 1, com o livro 2
-- IMPORTANTE! SEMPRE ANTES DE EXECUTAR ESSE INSERT, EXECUTAR O DELETE ACIMA!!!!!!
INSERT INTO tbCurtida (IdUsuario, IdLivro, Curtida) VALUES (@idUsuario, @idLivro, @curtida)

CREATE TABLE tbUsuario (
	Id INT IDENTITY(1,1) NOT NULL,
	Email NVARCHAR(128) NOT NULL,
	Nome NVARCHAR(128) NOT NULL,
	Localizacao GEOGRAPHY NULL,
	Nascimento DATETIME NOT NULL,
	Password NVARCHAR(100) NOT NULL,
	Token NCHAR(32) NOT NULL,
	Estado NVARCHAR(128) NULL,
	GenerosFavoritos NVARCHAR (500) NULL, 
	SobreMim NVARCHAR (500) NULL,
	Celular NVARCHAR (15) NULL

	CONSTRAINT PK_Usuario_Id PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT PK_Usuario_Email UNIQUE (Email)
);

CREATE NONCLUSTERED INDEX IX_Usuario_Email ON tbUsuario (Email ASC);

CREATE TABLE tbGenero (
	Id INT IDENTITY(1,1) NOT NULL,
	Nome NVARCHAR(32) NOT NULL

	CONSTRAINT PK_Genero_Id PRIMARY KEY CLUSTERED (Id ASC)
);

CREATE TABLE tbUsuarioGenero (
	IdUsuario INT NOT NULL,
	IdGenero INT NOT NULL

	CONSTRAINT PK_UsuarioGenero_Id PRIMARY KEY CLUSTERED (IdUsuario ASC, IdGenero ASC),
	CONSTRAINT FK_UsuarioGenero_Usuario FOREIGN KEY (IdUsuario) REFERENCES tbUsuario (Id) ON DELETE CASCADE,
	CONSTRAINT FK_UsuarioGenero_Genero FOREIGN KEY (IdGenero) REFERENCES tbGenero (Id)
);

CREATE TABLE tbLivro (
	Id INT IDENTITY(1,1) NOT NULL,
	IdDono INT NOT NULL,
	Nome NVARCHAR(128) NOT NULL,
	NomeNormalizado NVARCHAR(128) NOT NULL,
	Autor NVARCHAR(128) NOT NULL,
	AutorNormalizado NVARCHAR(128) NOT NULL,
	IdGenero INT NOT NULL,
	Sinopse NVARCHAR(500) NOT NULL,
	Didatico INT NOT NULL,
	Trocado INT NOT NULL

	CONSTRAINT PK_Livro_Id PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Livro_Dono FOREIGN KEY (IdDono) REFERENCES tbUsuario (Id),
	CONSTRAINT FK_Livro_Genero FOREIGN KEY (IdGenero) REFERENCES tbGenero (Id)
);

CREATE NONCLUSTERED INDEX IX_Livro_NomeNormalizado ON tbLivro (NomeNormalizado ASC);
CREATE NONCLUSTERED INDEX IX_Livro_AutorNormalizado ON tbLivro (AutorNormalizado ASC);
CREATE NONCLUSTERED INDEX IX_Livro_Dono ON tbLivro (IdDono ASC);
CREATE NONCLUSTERED INDEX IX_Livro_Trocado ON tbLivro (Trocado ASC);
CREATE NONCLUSTERED INDEX IX_Livro_Genero ON tbLivro (IdGenero ASC);
CREATE NONCLUSTERED INDEX IX_Livro_Didatico ON tbLivro (Didatico ASC);

CREATE TABLE tbCurtida (
	IdUsuario INT NOT NULL,
	IdLivro INT NOT NULL,
	Curtida INT NOT NULL

	CONSTRAINT PK_Curtida_Id PRIMARY KEY CLUSTERED (IdUsuario ASC, IdLivro ASC),
	CONSTRAINT FK_Curtida_Usuario FOREIGN KEY (IdUsuario) REFERENCES tbUsuario (Id) ON DELETE CASCADE,
	CONSTRAINT FK_Curtida_Livro FOREIGN KEY (IdLivro) REFERENCES tbLivro (Id) ON DELETE CASCADE
);
