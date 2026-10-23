# Automação de testes web

Projeto de automação de testes de interface para o [Automation Exercise](https://automationexercise.com/), usando Robot Framework e Browser Library.

## Pré-requisitos

- Python instalado
- Acesso à internet para instalar as dependências, baixar o navegador e acessar o site de teste

## Instalação

No PowerShell, na pasta do projeto:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install robotframework robotframework-browser
rfbrowser init
```

Se o PowerShell bloquear a ativação do ambiente virtual, use o Python do ambiente diretamente: `.\.venv\Scripts\python.exe -m pip install robotframework robotframework-browser` e `.\.venv\Scripts\rfbrowser.exe init`.

No macOS ou Linux, os comandos equivalentes são:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install robotframework robotframework-browser
rfbrowser init
```

## Executar os testes

Com o ambiente virtual ativado, execute a suíte completa na raiz do projeto:

```bash
robot tests
```

Para salvar os relatórios na pasta `reports/`, use:

```bash
robot --outputdir reports tests
```

Ambos executam os arquivos `.robot` da pasta `tests/`. O primeiro salva os resultados na pasta atual; o segundo os salva em `reports/`.

Para executar a suíte de cadastro pelo arquivo, por exemplo, no PowerShell:

```powershell
robot -d ./logs .\tests\CT_001_CadastrodeCliente.robot
```

Esse comando salva os relatórios dessa execução em `logs/`.

## Visualizar os relatórios

Depois da execução, abra estes arquivos no navegador:

- `reports/report.html`: resumo dos resultados
- `reports/log.html`: detalhes da execução e das etapas
- `reports/output.xml`: resultados em XML, úteis para integração com outras ferramentas

No Windows, abra o relatório principal pelo PowerShell com:

```powershell
Invoke-Item reports\report.html
```

Para abrir o relatório da execução individual de cadastro:

```powershell
Invoke-Item logs\report.html
```

## Observações

- Os testes acessam um site público e dependem da disponibilidade dele e da conexão com a internet.
- Alguns cenários criam, alteram ou excluem dados no site. Use somente dados de teste e revise os valores em `data/variables.robot` antes de executar ou publicar o projeto. Nunca coloque senhas, dados pessoais ou dados reais de cartão no repositório.
- O navegador é aberto em modo visível pelo comportamento atual da suíte.
