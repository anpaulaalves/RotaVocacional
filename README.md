# 🧭 RotaVocacional

\<div align="center">

### Plataforma Web de Orientação Vocacional

**Explore suas habilidades. Descubra possibilidades. Construa seu futuro.**

O **RotaVocacional** é uma plataforma Full Stack de orientação vocacional desenvolvida para auxiliar estudantes na identificação de interesses, habilidades e afinidades profissionais por meio de questionários interativos, análises personalizadas e exploração de carreiras.





\


**Full Stack Development | C Backend | REST API | PostgreSQL | Career Guidance**

\</div>

---

## 📌 Sobre o Projeto

O **RotaVocacional** é uma aplicação web voltada à orientação vocacional, projetada para oferecer aos estudantes uma experiência acessível, intuitiva e personalizada durante o processo de exploração de possibilidades acadêmicas e profissionais.

A plataforma utiliza questionários estruturados para identificar padrões de interesse e afinidade com diferentes áreas de atuação.

As respostas são processadas por um backend desenvolvido em linguagem C, enquanto os dados são armazenados em um banco PostgreSQL hospedado na plataforma Neon.

O projeto adota uma arquitetura modular, separando interface, regras de negócio e persistência de dados.

O RotaVocacional tem como princípio apoiar a autonomia dos estudantes, oferecendo informações para reflexão, sem determinar ou impor uma escolha profissional.

## 🎯 Objetivo

Desenvolver uma plataforma digital de orientação vocacional que permita aos estudantes compreender melhor seus interesses, explorar diferentes profissões e acessar informações relevantes para o planejamento de suas trajetórias acadêmicas e profissionais.

### Objetivos específicos

- Facilitar o acesso à orientação vocacional.
- Promover o autoconhecimento.
- Identificar afinidades com áreas profissionais.
- Disponibilizar questionários interativos.
- Apresentar resultados personalizados.
- Permitir a exploração de diferentes carreiras.
- Armazenar o histórico das avaliações.
- Oferecer uma experiência acessível e responsiva.
- Garantir a proteção das informações dos usuários.
- Disponibilizar uma arquitetura preparada para utilização pela internet.

---

## 🚀 Funcionalidades da Plataforma

### 👤 Cadastro e Autenticação

O sistema contempla o gerenciamento de contas individuais para estudantes.

**Recursos:**

- Cadastro de novos usuários.
- Autenticação com e-mail e senha.
- Gerenciamento de sessões.
- Validação de informações cadastrais.
- Proteção de credenciais.
- Encerramento seguro de sessões.
- Controle de acesso às funcionalidades privadas.

### 🧠 Teste Vocacional Interativo

O questionário vocacional é o principal recurso da plataforma.

Por meio de perguntas relacionadas a interesses, preferências e atividades, o sistema identifica padrões de afinidade com diferentes áreas profissionais.

**Recursos:**

- Questionário estruturado.
- Alternativas de resposta.
- Interface interativa.
- Validação das respostas.
- Processamento automático.
- Cálculo de pontuações.
- Identificação das áreas de maior afinidade.

### 📊 Resultados Personalizados

Após concluir o questionário, o estudante recebe uma análise baseada nas respostas fornecidas.

**Recursos:**

- Apresentação das áreas de maior afinidade.
- Gráficos comparativos.
- Percentuais de afinidade.
- Descrições das áreas profissionais.
- Sugestões de carreiras relacionadas.
- Histórico de avaliações realizadas.

Os percentuais representam pontuações relativas do questionário, não probabilidades de sucesso profissional.

### 💼 Exploração de Profissões

A plataforma disponibiliza um catálogo de carreiras para auxiliar os estudantes na pesquisa sobre diferentes possibilidades profissionais.

**Recursos:**

- Listagem de profissões.
- Descrição das atividades profissionais.
- Informações sobre áreas de atuação.
- Possibilidades de formação acadêmica.
- Exploração de profissões relacionadas aos interesses identificados.

### 🖥️ Dashboard do Estudante

O painel individual centraliza as principais informações da conta.

**Recursos:**

- Informações do perfil.
- Acesso ao teste vocacional.
- Visualização dos resultados.
- Histórico de avaliações.
- Navegação pelo catálogo de profissões.
- Gerenciamento da sessão.

---

## 🛠️ Tecnologias Utilizadas

O RotaVocacional utiliza tecnologias voltadas ao desenvolvimento de aplicações web, processamento de dados e gerenciamento de informações.

| Tecnologia | Finalidade                        |
| ---------- | --------------------------------- |
| **C**      | Backend e regras de negócio       |
| HTML5      | Estrutura das interfaces          |
| CSS3       | Estilização e responsividade      |
| JavaScript | Interatividade e requisições HTTP |
| PostgreSQL | Banco de dados relacional         |
| Neon       | Hospedagem do PostgreSQL          |
| Mongoose   | Servidor HTTP e API REST em C     |
| libpq      | Integração entre C e PostgreSQL   |
| CMake      | Gerenciamento da compilação       |
| Git        | Controle de versões               |
| GitHub     | Versionamento e colaboração       |

---

## 🏗️ Arquitetura do Sistema

A aplicação segue uma arquitetura cliente-servidor organizada em três camadas.

```text
                     ROTAVOCACIONAL
                           |
                           v
                  FRONTEND WEB
               HTML5 | CSS3 | JS
                           |
                       HTTPS
                           |
                           v
                    API REST
                    BACKEND C
                           |
                 +---------+---------+
                 |                   |
                 v                   v
           AUTENTICACAO        REGRAS DE NEGOCIO
                 |                   |
                 |              TESTE VOCACIONAL
                 |                   |
                 |              RESULTADOS
                 |                   |
                 +---------+---------+
                           |
                          libpq
                           |
                           v
                    POSTGRESQL
                       NEON
```

### Frontend

Responsável pela apresentação visual da plataforma e pela interação com os estudantes.

Desenvolvido com HTML5, CSS3 e JavaScript, comunica-se com o backend por meio de requisições HTTP e respostas JSON.

### Backend

Desenvolvido em linguagem C, concentra as principais regras de negócio.

Entre suas responsabilidades estão:

- Processamento das requisições HTTP.
- Autenticação e autorização.
- Validação dos dados recebidos.
- Processamento do questionário.
- Cálculo dos resultados.
- Comunicação com o banco de dados.
- Tratamento de erros.
- Gerenciamento de sessões.

### Banco de Dados

O PostgreSQL é responsável pela persistência das informações.

A infraestrutura do Neon permite hospedar o banco de dados em nuvem, mantendo a separação entre o servidor da aplicação e a camada de armazenamento.

---

## 📁 Estrutura do Projeto

```text
RotaVocacional/
│
├── backend/
│   ├── main.c
│   ├── database.c
│   ├── database.h
│   ├── auth.c
│   ├── auth.h
│   ├── quiz.c
│   ├── quiz.h
│   ├── resultados.c
│   ├── resultados.h
│   └── CMakeLists.txt
│
├── frontend/
│   ├── index.html
│   ├── login.html
│   ├── cadastro.html
│   ├── dashboard.html
│   ├── teste.html
│   ├── resultados.html
│   │
│   ├── css/
│   │   └── style.css
│   │
│   └── js/
│       ├── api.js
│       ├── auth.js
│       ├── teste.js
│       └── resultados.js
│
├── database/
│   └── schema.sql
│
├── .env.example
├── .gitignore
└── README.md
```

A estrutura modular permite organizar responsabilidades, facilitar a manutenção e ampliar o sistema sem concentrar toda a implementação em um único arquivo.

---

## 🗄️ Banco de Dados

O RotaVocacional utiliza PostgreSQL para armazenar os dados necessários ao funcionamento da plataforma.

### Principais entidades

| Tabela         | Descrição                                       |
| -------------- | ----------------------------------------------- |
| `usuarios`     | Informações cadastrais e credenciais protegidas |
| `perguntas`    | Questões do questionário vocacional             |
| `alternativas` | Alternativas e respectivas pontuações           |
| `respostas`    | Respostas fornecidas pelos estudantes           |
| `profissoes`   | Catálogo de carreiras                           |
| `resultados`   | Histórico e resultados das avaliações           |

### Integridade dos dados

A modelagem contempla relacionamentos entre as entidades, restrições de integridade e identificação individual dos registros.

O acesso ao banco de dados é realizado exclusivamente pelo backend, evitando a exposição direta de credenciais no navegador.

---

## 🔐 Segurança e Privacidade

A segurança é um requisito fundamental do RotaVocacional, especialmente por envolver informações pessoais de estudantes.

A arquitetura de produção prevê:

- Armazenamento de senhas com algoritmos de hash apropriados.
- Consultas SQL parametrizadas.
- Validação de dados recebidos pela API.
- Autenticação e autorização de usuários.
- Sessões protegidas.
- Proteção contra acesso não autorizado.
- Comunicação HTTPS.
- Criptografia da conexão com o PostgreSQL.
- Variáveis de ambiente para credenciais.
- Limitação de requisições sensíveis.
- Tratamento seguro de erros.
- Logs sem exposição de dados confidenciais.

### Proteção de Dados Pessoais

O projeto considera os princípios da Lei Geral de Proteção de Dados Pessoais (LGPD).

A operação pública deverá contemplar:

- Política de privacidade.
- Finalidades claras para o tratamento dos dados.
- Coleta limitada às informações necessárias.
- Procedimentos de exclusão de conta e dados.
- Medidas técnicas de proteção.
- Regras específicas para usuários menores de idade.
- Definição de responsabilidades pelo tratamento dos dados.

---

## ⚙️ Instalação e Execução

### Pré-requisitos

Para executar o projeto localmente, são necessários:

- Git.
- Visual Studio Code ou editor equivalente.
- Compilador C compatível.
- CMake.
- Bibliotecas necessárias ao backend.
- Banco PostgreSQL no Neon.

### 1. Clonar o repositório

```bash
git clone https://github.com/Lightis4/RotaVocacional.git
```

```bash
cd RotaVocacional
```

### 2. Configurar o PostgreSQL

Crie um banco de dados na plataforma [Neon](https://neon.tech/).

Execute o script SQL localizado em:

```text
database/schema.sql
```

### 3. Configurar a conexão

Configure a variável `DATABASE_URL` utilizando a connection string disponibilizada pelo Neon.

Exemplo no PowerShell:

```powershell
$env:DATABASE_URL = "postgresql://USUARIO:SENHA@HOST/neondb?sslmode=require"
```

As credenciais devem permanecer fora do controle de versões.

### 4. Compilar o backend

No Windows, com o ambiente de compilação e as dependências configurados:

```powershell
cmake -S backend -B build -DCMAKE_TOOLCHAIN_FILE="C:/vcpkg/scripts/buildsystems/vcpkg.cmake"
```

```powershell
cmake --build build --config Release
```

### 5. Executar a aplicação

```powershell
$env:FRONTEND_DIR = "frontend"
```

```powershell
.\build\Release\rota_server.exe
```

### 6. Acessar a plataforma

Com o servidor iniciado, abra:

```text
http://127.0.0.1:8080
```

O endereço corresponde ao ambiente de desenvolvimento local. A disponibilização pública requer uma infraestrutura de hospedagem e configuração HTTPS.

---

## 🌐 Implantação em Produção

A arquitetura do RotaVocacional foi planejada para permitir implantação em infraestrutura de nuvem.

### Componentes da implantação

**Aplicação:** servidor Linux ou serviço de hospedagem compatível com aplicações nativas compiladas em C.

**Banco de dados:** PostgreSQL gerenciado pelo Neon.

**Servidor de entrada:** proxy reverso para encaminhamento das requisições ao backend.

**HTTPS:** certificado TLS para proteger a comunicação entre navegador e servidor.

**Domínio:** endereço público configurado para acesso à plataforma.

### Requisitos de produção

Antes da disponibilização para usuários reais, a implantação deverá incluir:

- Compilação e testes no ambiente de hospedagem.
- Configuração segura das variáveis de ambiente.
- HTTPS obrigatório.
- Verificação de autenticação e autorização.
- Tratamento de falhas de conexão.
- Monitoramento e registros operacionais.
- Estratégia de backup e recuperação.
- Testes funcionais e de segurança.
- Política de privacidade e termos aplicáveis.

---

## 🔄 Fluxo de Utilização

```text
ACESSO A PLATAFORMA
        |
        v
CADASTRO / LOGIN
        |
        v
DASHBOARD DO ESTUDANTE
        |
        v
INICIO DO TESTE VOCACIONAL
        |
        v
RESPOSTAS AO QUESTIONARIO
        |
        v
PROCESSAMENTO NO BACKEND C
        |
        v
CALCULO DE AFINIDADES
        |
        v
ARMAZENAMENTO NO POSTGRESQL
        |
        v
RESULTADOS PERSONALIZADOS
        |
        v
EXPLORACAO DE CARREIRAS
```

---

## 📊 Metodologia de Avaliação

O RotaVocacional utiliza um modelo de pontuação baseado nas respostas dos estudantes.

Cada alternativa contribui para uma ou mais áreas de interesse profissional.

O backend processa essas pontuações e organiza os resultados para identificar as áreas de maior afinidade.

### Etapas do processamento

1. Recebimento das respostas.
2. Validação das alternativas.
3. Associação das respostas às áreas profissionais.
4. Cálculo das pontuações.
5. Normalização dos resultados.
6. Identificação das áreas predominantes.
7. Armazenamento da avaliação.
8. Apresentação dos resultados.

**Importante:** a avaliação possui caráter informativo e exploratório. Não constitui diagnóstico psicológico, teste psicométrico validado ou garantia de adequação a determinada profissão.

---

## ♿ Acessibilidade

O RotaVocacional considera a acessibilidade como parte da experiência de utilização.

Entre os requisitos de interface estão:

- Navegação por teclado.
- Contraste adequado entre textos e fundos.
- Estrutura semântica HTML.
- Identificação clara de campos e formulários.
- Mensagens de erro compreensíveis.
- Layout responsivo.
- Compatibilidade com tecnologias assistivas.

A validação de acessibilidade deverá considerar as recomendações WCAG aplicáveis.

---

## 📈 Evolução da Plataforma

O projeto possui uma arquitetura preparada para receber novas funcionalidades.

Entre as possibilidades de expansão estão:

- Questionários mais abrangentes.
- Relatórios exportáveis em PDF.
- Comparação de avaliações anteriores.
- Painel administrativo.
- Recomendações de cursos.
- Catálogo ampliado de profissões.
- Integração com instituições de ensino.
- Recursos avançados de acessibilidade.
- Suporte a múltiplos idiomas.
- Análises estatísticas de utilização.

---

## 🌍 Impacto e Propósito

A escolha de uma trajetória profissional envolve fatores pessoais, educacionais e sociais.

O RotaVocacional busca ampliar o acesso a ferramentas de exploração vocacional, oferecendo aos estudantes um ambiente digital no qual possam refletir sobre seus interesses e conhecer diferentes possibilidades.

A plataforma une desenvolvimento de software e educação, utilizando tecnologia para apoiar decisões mais informadas.

O propósito do projeto é contribuir para que cada estudante tenha mais recursos para explorar caminhos acadêmicos e profissionais de maneira consciente e autônoma.

---

## 👨‍💻 Desenvolvedores

Ana Paula Alves Barros&#x20;

Ana Jamily&#x20;

Gustavo Henrique de Assunção Bezerra

Pedro Henrique Barbosa Nogueira

Desenvolvedores de Softwares em Formação





---

## 📄 Licença

Os termos de utilização, distribuição e modificação do código-fonte serão definidos no arquivo `LICENSE` do repositório.

---

\<div align="center">

### 🧭 RotaVocacional

**Descubra possibilidades. Explore seu potencial. Construa seu futuro.**

*Uma plataforma de orientação vocacional desenvolvida com C, JavaScript e PostgreSQL.*

**Software Engineering • Education • Technology**

\</div>
