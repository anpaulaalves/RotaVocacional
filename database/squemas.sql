CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    salt VARCHAR(32) NOT NULL,
    senha_hash VARCHAR(64) NOT NULL,
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sessoes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    token_hash VARCHAR(64) NOT NULL UNIQUE,
    expira_em TIMESTAMPTZ NOT NULL,
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_sessao_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_sessoes_usuario
ON sessoes(usuario_id);

CREATE TABLE IF NOT EXISTS perguntas (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    texto TEXT NOT NULL,
    area VARCHAR(30) NOT NULL,

    CONSTRAINT chk_area CHECK (
        area IN (
            'tecnologia',
            'saude',
            'negocios',
            'artes',
            'educacao'
        )
    )
);

CREATE TABLE IF NOT EXISTS testes (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_teste_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_testes_usuario
ON testes(usuario_id, criado_em DESC);

CREATE TABLE IF NOT EXISTS respostas (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    teste_id INTEGER NOT NULL,
    pergunta_id INTEGER NOT NULL,
    valor INTEGER NOT NULL CHECK (valor BETWEEN 1 AND 5),

    CONSTRAINT fk_resposta_teste
        FOREIGN KEY (teste_id)
        REFERENCES testes(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_resposta_pergunta
        FOREIGN KEY (pergunta_id)
        REFERENCES perguntas(id),

    CONSTRAINT uq_resposta UNIQUE (teste_id, pergunta_id)
);

CREATE TABLE IF NOT EXISTS areas_v2 (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO areas_v2 (id, nome)
VALUES
(1, 'Tecnologia da Informação'),
(2, 'Ciências Exatas e Engenharias'),
(3, 'Ciências da Saúde'),
(4, 'Educação'),
(5, 'Ciências Humanas e Sociais'),
(6, 'Comunicação e Linguagens'),
(7, 'Artes e Design'),
(8, 'Administração e Finanças'),
(9, 'Ciências Biológicas e Ambientais'),
(10, 'Direito e Serviço Público')
ON CONFLICT (id) DO NOTHING;

CREATE TABLE IF NOT EXISTS perguntas_v2 (
    id INTEGER PRIMARY KEY,
    texto TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS alternativas_v2 (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pergunta_id INTEGER NOT NULL,
    letra CHAR(1) NOT NULL,
    texto TEXT NOT NULL,
    area_id INTEGER NOT NULL,

    CONSTRAINT fk_alternativa_pergunta
        FOREIGN KEY (pergunta_id)
        REFERENCES perguntas_v2(id),

    CONSTRAINT fk_alternativa_area
        FOREIGN KEY (area_id)
        REFERENCES areas_v2(id),

    CONSTRAINT chk_letra
        CHECK (letra IN ('A', 'B', 'C', 'D', 'E')),

    CONSTRAINT uq_alternativa
        UNIQUE (pergunta_id, letra),

    CONSTRAINT uq_alternativa_id_pergunta
        UNIQUE (id, pergunta_id)
);

CREATE INDEX IF NOT EXISTS idx_alternativas_pergunta
ON alternativas_v2(pergunta_id);

CREATE TABLE IF NOT EXISTS respostas_v2 (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    teste_id INTEGER NOT NULL,
    pergunta_id INTEGER NOT NULL,
    alternativa_id INTEGER NOT NULL,

    CONSTRAINT fk_resposta_v2_teste
        FOREIGN KEY (teste_id)
        REFERENCES testes(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_resposta_v2_pergunta
        FOREIGN KEY (pergunta_id)
        REFERENCES perguntas_v2(id),

    CONSTRAINT fk_resposta_v2_alternativa
        FOREIGN KEY (alternativa_id, pergunta_id)
        REFERENCES alternativas_v2(id, pergunta_id),

    CONSTRAINT uq_resposta_v2
        UNIQUE (teste_id, pergunta_id)
);

CREATE INDEX IF NOT EXISTS idx_respostas_v2_teste
ON respostas_v2(teste_id);

INSERT INTO perguntas_v2 (id, texto)
VALUES
(1, 'Sua escola vai organizar uma feira de conhecimentos. Qual atividade você gostaria de assumir?'),

(2, 'Você foi convidado a participar de um projeto comunitário. Qual atividade escolheria?'),

(3, 'Imagine que sua turma precisa melhorar a biblioteca da escola. Como você gostaria de contribuir?'),

(4, 'Um festival cultural será realizado na sua cidade. Em qual atividade você preferiria trabalhar?'),

(5, 'Você recebeu a oportunidade de participar de uma pesquisa. Qual tema escolheria?'),

(6, 'Sua escola quer criar uma revista digital. Qual função mais combina com você?'),

(7, 'Um grupo de estudantes deseja criar uma solução para facilitar a vida das pessoas. O que você gostaria de fazer?'),

(8, 'Você vai participar de uma campanha para melhorar seu bairro. Qual tarefa escolheria?'),

(9, 'Imagine que você pode participar de uma oficina durante uma semana. Qual escolheria?'),

(10, 'Uma instituição está organizando uma exposição aberta ao público. Como você gostaria de participar?'),

(11, 'Você foi convidado a ajudar a melhorar o transporte de sua cidade. Qual contribuição escolheria?'),

(12, 'Sua turma vai desenvolver um projeto sobre consumo consciente. Qual atividade você prefere?'),

(13, 'Você poderá participar de um projeto sobre alimentação. Qual tarefa escolheria?'),

(14, 'Imagine que sua escola organizará uma mostra de talentos. Em que você gostaria de atuar?'),

(15, 'Uma equipe está desenvolvendo um projeto para melhorar a qualidade de vida de pessoas idosas. O que você escolheria?'),

(16, 'Sua comunidade deseja valorizar sua história e suas tradições. Qual atividade você prefere?'),

(17, 'Você participará de um projeto sobre acessibilidade. Qual tarefa mais desperta seu interesse?'),

(18, 'Uma organização quer desenvolver um projeto de turismo sustentável. Como você gostaria de contribuir?'),

(19, 'Você foi convidado a participar de um desafio de inovação na escola. Qual atividade escolheria?'),

(20, 'Uma cidade está planejando uma semana de conscientização sobre cidadania. Qual tarefa você escolheria?')
ON CONFLICT (id) DO NOTHING;

INSERT INTO alternativas_v2
(pergunta_id, letra, texto, area_id)
VALUES

-- PERGUNTA 01
(1, 'A', 'Preparar uma apresentação sobre prevenção de doenças e cuidados com a saúde.', 3),
(1, 'B', 'Planejar a estrutura dos estandes e calcular os materiais necessários.', 2),
(1, 'C', 'Pesquisar como diferentes culturas contribuíram para o desenvolvimento da sociedade.', 5),
(1, 'D', 'Organizar uma oficina para ensinar algo novo aos visitantes.', 4),
(1, 'E', 'Criar um aplicativo para orientar os visitantes durante o evento.', 1),

-- PERGUNTA 02
(2, 'A', 'Organizar o orçamento e planejar a utilização dos recursos.', 8),
(2, 'B', 'Investigar problemas ambientais e propor ações de preservação.', 9),
(2, 'C', 'Pesquisar os direitos da comunidade e formas de participação nas decisões públicas.', 10),
(2, 'D', 'Criar cartazes, ilustrações e a identidade visual da campanha.', 7),
(2, 'E', 'Produzir entrevistas e reportagens para divulgar o projeto.', 6),

-- PERGUNTA 03
(3, 'A', 'Preparar atividades de incentivo à leitura para outros estudantes.', 4),
(3, 'B', 'Pesquisar livros sobre saúde e bem-estar para ampliar o acervo.', 3),
(3, 'C', 'Criar um sistema digital para localizar e organizar os livros.', 1),
(3, 'D', 'Selecionar obras que abordem história, cultura e questões sociais.', 5),
(3, 'E', 'Planejar a disposição das estantes, considerando medidas e aproveitamento do espaço.', 2),

-- PERGUNTA 04
(4, 'A', 'Orientar a organização sobre regras de segurança e direitos dos participantes.', 10),
(4, 'B', 'Planejar os custos, os ingressos e a organização financeira.', 8),
(4, 'C', 'Desenvolver ações para reduzir o lixo produzido durante o evento.', 9),
(4, 'D', 'Entrevistar os participantes e produzir notícias sobre o festival.', 6),
(4, 'E', 'Criar o cenário e os elementos visuais das apresentações.', 7),

-- PERGUNTA 05
(5, 'A', 'Estudar como as relações sociais influenciam o comportamento das pessoas.', 5),
(5, 'B', 'Investigar como programas de computador podem resolver problemas cotidianos.', 1),
(5, 'C', 'Pesquisar como o corpo humano reage a diferentes hábitos de vida.', 3),
(5, 'D', 'Investigar quais estratégias ajudam as pessoas a aprender melhor.', 4),
(5, 'E', 'Estudar como construir estruturas mais resistentes e eficientes.', 2),

-- PERGUNTA 06
(6, 'A', 'Produzir conteúdos sobre animais, plantas e preservação ambiental.', 9),
(6, 'B', 'Pesquisar normas relacionadas à publicação de imagens e informações.', 10),
(6, 'C', 'Planejar os custos e buscar formas de manter a publicação.', 8),
(6, 'D', 'Criar ilustrações, capas e o estilo visual da revista.', 7),
(6, 'E', 'Escrever reportagens e entrevistar pessoas sobre assuntos atuais.', 6),

-- PERGUNTA 07
(7, 'A', 'Desenvolver a programação de uma ferramenta digital.', 1),
(7, 'B', 'Projetar e testar um equipamento que facilite tarefas diárias.', 2),
(7, 'C', 'Estudar as necessidades e os hábitos das pessoas que utilizarão o projeto.', 5),
(7, 'D', 'Investigar como a solução poderia contribuir para a saúde das pessoas.', 3),
(7, 'E', 'Preparar orientações para ensinar outras pessoas a utilizar a solução.', 4),

-- PERGUNTA 08
(8, 'A', 'Investigar problemas de poluição e sugerir soluções ambientais.', 9),
(8, 'B', 'Produzir vídeos e mensagens para divulgar a campanha.', 6),
(8, 'C', 'Criar murais e intervenções artísticas para valorizar os espaços.', 7),
(8, 'D', 'Pesquisar políticas públicas e encaminhar propostas aos órgãos responsáveis.', 10),
(8, 'E', 'Organizar os recursos financeiros e o cronograma das atividades.', 8),

-- PERGUNTA 09
(9, 'A', 'Primeiros socorros e cuidados com a saúde.', 3),
(9, 'B', 'Estudo de culturas, sociedades e relações humanas.', 5),
(9, 'C', 'Planejamento de aulas e atividades educativas.', 4),
(9, 'D', 'Construção de protótipos e resolução de desafios matemáticos.', 2),
(9, 'E', 'Programação e desenvolvimento de jogos digitais.', 1),

-- PERGUNTA 10
(10, 'A', 'Desenvolver esculturas, desenhos e a ambientação artística.', 7),
(10, 'B', 'Administrar inscrições, despesas e recursos disponíveis.', 8),
(10, 'C', 'Analisar as regras de acessibilidade e os direitos dos visitantes.', 10),
(10, 'D', 'Produzir textos informativos e entrevistar especialistas.', 6),
(10, 'E', 'Preparar uma exposição sobre biodiversidade e conservação da natureza.', 9),

-- PERGUNTA 11
(11, 'A', 'Desenvolver um aplicativo com informações sobre horários e trajetos.', 1),
(11, 'B', 'Investigar como a mobilidade urbana afeta diferentes grupos sociais.', 5),
(11, 'C', 'Estudar trajetos, distâncias e possíveis melhorias na infraestrutura.', 2),
(11, 'D', 'Pesquisar os efeitos da poluição do trânsito sobre a saúde.', 3),
(11, 'E', 'Criar uma campanha educativa sobre comportamento seguro no trânsito.', 4),

-- PERGUNTA 12
(12, 'A', 'Investigar os direitos dos consumidores e as responsabilidades das empresas.', 10),
(12, 'B', 'Criar embalagens e peças visuais que incentivem o consumo responsável.', 7),
(12, 'C', 'Produzir um podcast com entrevistas sobre hábitos de consumo.', 6),
(12, 'D', 'Planejar um orçamento e comparar custos de diferentes produtos.', 8),
(12, 'E', 'Pesquisar os impactos do consumo sobre os ecossistemas.', 9),

-- PERGUNTA 13
(13, 'A', 'Desenvolver equipamentos ou soluções para melhorar o preparo dos alimentos.', 2),
(13, 'B', 'Criar um sistema para registrar receitas e organizar informações nutricionais.', 1),
(13, 'C', 'Preparar oficinas para ensinar hábitos alimentares saudáveis.', 4),
(13, 'D', 'Estudar como a alimentação varia entre culturas e grupos sociais.', 5),
(13, 'E', 'Investigar a relação entre alimentação e funcionamento do organismo.', 3),

-- PERGUNTA 14
(14, 'A', 'Organizar inscrições, recursos e despesas do evento.', 8),
(14, 'B', 'Apresentar o evento e entrevistar os participantes.', 6),
(14, 'C', 'Planejar ações para reduzir o desperdício de materiais.', 9),
(14, 'D', 'Elaborar regras de participação que garantam tratamento justo aos inscritos.', 10),
(14, 'E', 'Criar coreografias, figurinos ou apresentações artísticas.', 7),

-- PERGUNTA 15
(15, 'A', 'Projetar dispositivos que tornem os ambientes mais seguros.', 2),
(15, 'B', 'Organizar oficinas para ensinar novas habilidades às pessoas idosas.', 4),
(15, 'C', 'Pesquisar cuidados e práticas que favoreçam a saúde na terceira idade.', 3),
(15, 'D', 'Criar uma ferramenta digital que facilite atividades do dia a dia.', 1),
(15, 'E', 'Investigar como as relações familiares e sociais influenciam o envelhecimento.', 5),

-- PERGUNTA 16
(16, 'A', 'Produzir documentários e entrevistas com moradores antigos.', 6),
(16, 'B', 'Criar uma exposição artística inspirada nas tradições locais.', 7),
(16, 'C', 'Planejar a organização financeira de eventos culturais.', 8),
(16, 'D', 'Pesquisar a relação entre a comunidade e o ambiente natural ao longo do tempo.', 9),
(16, 'E', 'Investigar políticas de proteção do patrimônio cultural.', 10),

-- PERGUNTA 17
(17, 'A', 'Pesquisar barreiras sociais enfrentadas por pessoas com deficiência.', 5),
(17, 'B', 'Preparar materiais didáticos acessíveis para diferentes estudantes.', 4),
(17, 'C', 'Programar recursos digitais para facilitar o acesso à informação.', 1),
(17, 'D', 'Projetar adaptações em espaços físicos para melhorar a mobilidade.', 2),
(17, 'E', 'Investigar necessidades relacionadas à saúde e à reabilitação.', 3),

-- PERGUNTA 18
(18, 'A', 'Desenvolver a identidade visual e os materiais artísticos do projeto.', 7),
(18, 'B', 'Estudar os impactos do turismo sobre a fauna, a flora e os recursos naturais.', 9),
(18, 'C', 'Criar conteúdos e reportagens para apresentar os destinos turísticos.', 6),
(18, 'D', 'Planejar os custos e avaliar a viabilidade financeira das atividades.', 8),
(18, 'E', 'Pesquisar normas de proteção ambiental e direitos das comunidades locais.', 10),

-- PERGUNTA 19
(19, 'A', 'Criar uma atividade para ensinar o funcionamento da solução a outras pessoas.', 4),
(19, 'B', 'Desenvolver uma proposta para melhorar hábitos de saúde.', 3),
(19, 'C', 'Construir e testar um protótipo utilizando princípios da Física e da Matemática.', 2),
(19, 'D', 'Criar um programa para automatizar uma tarefa repetitiva.', 1),
(19, 'E', 'Investigar como a inovação pode modificar o cotidiano das comunidades.', 5),

-- PERGUNTA 20
(20, 'A', 'Produzir uma campanha de comunicação para informar a população.', 6),
(20, 'B', 'Promover debates sobre direitos, deveres e participação nas decisões públicas.', 10),
(20, 'C', 'Criar apresentações artísticas que incentivem a participação social.', 7),
(20, 'D', 'Organizar uma atividade sobre preservação de áreas verdes urbanas.', 9),
(20, 'E', 'Planejar os recursos e a logística das atividades.', 8)

ON CONFLICT (pergunta_id, letra) DO NOTHING;

SELECT 'areas_v2' AS tabela, COUNT(*) AS total
FROM areas_v2

UNION ALL

SELECT 'perguntas_v2', COUNT(*)
FROM perguntas_v2

UNION ALL

SELECT 'alternativas_v2', COUNT(*)
FROM alternativas_v2

UNION ALL

SELECT 'respostas_v2', COUNT(*)
FROM respostas_v2;

SELECT
    p.id AS pergunta,
    COUNT(a.id) AS quantidade_alternativas
FROM perguntas_v2 p
LEFT JOIN alternativas_v2 a
    ON a.pergunta_id = p.id
GROUP BY p.id
ORDER BY p.id;

SELECT
    ar.id,
    ar.nome,
    COUNT(a.id) AS quantidade
FROM areas_v2 ar
LEFT JOIN alternativas_v2 a
    ON a.area_id = ar.id
GROUP BY ar.id, ar.nome
ORDER BY ar.id;

SELECT
    a.pergunta_id,
    a.letra,
    a.texto AS alternativa,
    ar.nome AS area_profissional
FROM alternativas_v2 a
JOIN areas_v2 ar
    ON ar.id = a.area_id
ORDER BY a.pergunta_id, a.letra;

SELECT
    ar.nome AS area_profissional,
    COUNT(rv.id) AS pontos
FROM areas_v2 ar
LEFT JOIN alternativas_v2 a
    ON a.area_id = ar.id
LEFT JOIN respostas_v2 rv
    ON rv.alternativa_id = a.id
    AND rv.teste_id = 1
GROUP BY ar.id, ar.nome
ORDER BY pontos DESC, ar.nome;

