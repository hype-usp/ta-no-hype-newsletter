# Newsletter — Tá no Hype

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
      ta-no-hype-template.tex    # Arquivo principal
      styles/
        layout.tex               # Cabeçalho, rodapé e configurações de página
        capa.tex                 # Capa e sumário da edição
      sections/
        artigo1/                 # Pasta de cada artigo com texto e imagens
    2025-09/                     # Edição de setembro de 2025
      ...
```

---

## Como criar uma nova edição

**1.** Copie o template para uma nova pasta:
```bash
cp -r editions/0.template editions/YYYY-MM
```

**2.** No arquivo `ta-no-hype-template.tex`, atualize mês e ano:
```latex
\newcommand{\edicaoMes}{Outubro}
\newcommand{\edicaoAno}{2025}
```

**3.** Renomeie o arquivo principal para facilitar identificação:
```
ta-no-hype-template.tex  →  ta-no-hype-YYYY-MM.tex
```

**4.** Escreva os artigos nas pastas `sections/artigo1/`, `artigo2/`, etc.

**5.** Compile com XeLaTeX (duas passadas):
```bash
xelatex ta-no-hype-YYYY-MM.tex
xelatex ta-no-hype-YYYY-MM.tex
```

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
