# Newsletter: Tá no Hype

Template em LaTeX para produção da newsletter mensal do **Hype Data & AI**.

---

## Estrutura do projeto

```
newsletter/
  shared/                        # Arquivos compartilhados entre todas as edições
    assets/                      # Imagens fixas (logo, rodapé, ícones)
    fonts/
      poppins/                   # Fonte principal do corpo do texto
      opensans/                  # Fonte dos títulos dos artigos
    styles/
      packages.tex               # Pacotes LaTeX e configuração de fontes
      colors.tex                 # Paleta de cores do projeto
      macros.tex                 # Macros e ambientes customizados
  editions/
    0.template/                  # Base para novas edições (não editar diretamente)
      main/
        main.tex                  # Arquivo principal — só o Diretor mexe aqui
      preview/
        preview.tex               # Ferramenta pessoal de preview (não versionada com alterações)
      styles/
        layout.tex                # Cabeçalho, rodapé e configurações de página
        capa.tex                  # Capa e sumário da edição
      sections/
        artigo1/                  # Pasta de cada artigo com texto e imagens
    2025-09/                      # Edição de setembro de 2025
      main/
        main.tex                   # Arquivo principal (mesmo nome em toda edição)
      preview/
        preview.tex
      styles/
        layout.tex
        capa.tex
      sections/
        ...
```

> **Vai escrever um artigo?** O passo a passo completo (instalação, o que editar, macros, imagens, como enviar) está em **[CONTRIBUTING.md](CONTRIBUTING.md)**. As seções abaixo são para quem está criando uma edição nova ou integrando os artigos.

---

## Como criar uma nova edição

> Responsabilidade exclusiva do Diretor (e demais curiosos que quiserem se aventurar localmente por algum motivo). Colaboradores não devem criar pastas de edição, só a pasta do próprio artigo dentro de uma edição já existente (veja o [CONTRIBUTING.md](CONTRIBUTING.md)).

**1.** Copie o template para uma nova pasta:
```bash
cp -r editions/0.template editions/YYYY-MM
```

**2.** No arquivo `main.tex` da nova pasta, atualize mês e ano:
```latex
\newcommand{\edicaoMes}{Outubro}
\newcommand{\edicaoAno}{2025}
```

**3.** Escreva os artigos nas pastas `sections/nome-do-artigo/`, uma por colaborador (veja o [CONTRIBUTING.md](CONTRIBUTING.md)).

**4.** Compile com XeLaTeX (via `latexmk -xelatex main.tex`, ou duas passadas manuais):
```bash
xelatex main.tex
xelatex main.tex
```

> O nome do arquivo principal é sempre `main.tex` em toda edição, não é necessário renomear.

---

## Como escrever um artigo

Cada artigo usa a macro `\hypearticle`:

```latex
\hypearticle
{Título do artigo}
{Nome do Autor}
{

\hspace*{1.5em} Parágrafo introdutório...

\subtitle{Subtítulo da seção}

Texto da seção...

\begin{hypeitemize}
  \item Primeiro item;
  \item Segundo item;
  \item Terceiro item.
\end{hypeitemize}

\originalsource{https://link-da-fonte.com}

}
```

### Macros disponíveis

| Macro | Descrição |
|---|---|
| `\hypearticle{título}{autor}{conteúdo}` | Estrutura completa de um artigo |
| `\subtitle{texto}` | Subtítulo de seção dentro do artigo |
| `\highlight{conteúdo}` | Bloco de destaque com fundo roxo claro |
| `\articleimage{escala}{caminho}{legenda}` | Imagem com legenda |
| `\originalsource{url}` | Link para a fonte original |
| `\summaryitem{nº}{título}{prévia}{pág}` | Item do sumário na capa |
| `\begin{hypeitemize}` | Lista com bullets laranjas |
| `\begin{infobox}` | Caixa informativa laranja |

---

## Requisitos

- [MiKTeX](https://miktex.org/) ou qualquer distribuição LaTeX com suporte a XeLaTeX
- Compilar sempre com **XeLaTeX** (não pdfLaTeX)
- As fontes Poppins e Open Sans já estão incluídas em `shared/fonts/`
