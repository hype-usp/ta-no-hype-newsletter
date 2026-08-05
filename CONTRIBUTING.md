# Como contribuir com a "Tá no Hype!"

Este guia é para quem vai **escrever um artigo**, mesmo sem nunca ter usado LaTeX. Você não precisa entender como o template funciona por dentro, basta seguir os passos abaixo.

> Tempo estimado de setup: 15–20 minutos (só na primeira vez).

---

## 1. Instalar o ambiente (somente na primeira vez)

Você precisa de três coisas: o **VS Code**, uma **distribuição LaTeX** e a extensão **LaTeX Workshop**.

### 1.1. VS Code
Baixe em [code.visualstudio.com](https://code.visualstudio.com/) e instale normalmente.

### 1.2. Distribuição LaTeX

| Sistema | Instale |
|---|---|
| **Windows** | [MiKTeX](https://miktex.org/download), recomendo que na instalação, deixe marcada a opção "Install missing packages on-the-fly: Yes" |
| **macOS** | [MacTeX](https://tug.org/mactex/) (ou `BasicTeX`, mais leve) |
| **Linux** | `sudo apt install texlive-xetex texlive-lang-portuguese texlive-latex-extra texlive-fonts-extra latexmk` |

⚠️ **Atenção:** este projeto usa fontes customizadas e por isso precisa do motor **XeLaTeX** (não o `pdflatex` padrão). No entanto o repositório já vem com um `.vscode/settings.json` e um `.latexmkrc` que configuram isso automaticamente, ou seja, você só precisa ter o VS Code aberto na pasta raiz do projeto.

### 1.3. Extensão LaTeX Workshop
No VS Code, vá em Extensões (`Ctrl+Shift+X`) e instale **LaTeX Workshop** (autor: James Yu).

### 1.4. Git
Se ainda não tiver, instale o [Git](https://git-scm.com/downloads). Se você nunca usou Git/GitHub, também dá para editar e enviar tudo pela própria interface do site do GitHub — mas o fluxo abaixo assume o uso local, mais confortável para escrever.

---

## 2. Clonar o projeto (somente na primeira vez)

```bash
git clone https://github.com/hype-usp/ta-no-hype-newsletter.git
cd ta-no-hype-newsletter
```

Abra a pasta no VS Code.

---

## 3. Encontre a pasta da edição

Dentro de `editions/`, procure a pasta da edição em que você vai escrever (ex: `2026-09`).

> ⚠️ A criação da pasta de uma edição nova é responsabilidade exclusiva do **Diretor**. Se a pasta da edição atual ainda não existir no repositório, não crie você mesmo(a). Avise o Diretor Acadêmico e aguarde (Medida para evitar que duas pessoas criem a mesma edição em paralelo com configurações diferentes).

---

## 4. Crie a pasta do seu artigo

Dentro de `editions/AAAA-MM/sections/`, crie uma pasta nova com um **nome curto e descritivo** do seu artigo (sem espaços ou acentos), por exemplo:

```
sections/meia-vida-agentes-ia/
```

> O nome da pasta não precisa ser "artigo1" ou "artigo2" (como costa no exemplo). a ordem em que os artigos aparecem na newsletter é definida depois pelo editor no `main.tex`, e não pelo nome da pasta. Um nome descritivo evita que dois colaboradores usem o mesmo nome de pasta ao mesmo tempo e facilita achar o artigo certo no histórico do Git.

Dentro dessa pasta, copie o arquivo de modelo `editions/0.template/sections/artigo1/artigo1.tex` e renomeie para o nome do seu artigo (ex: `meia-vida-agentes-ia.tex`).

---

## 5. Escreva seu artigo

Abra o `.tex` que você acabou de criar. Ele já vem com exemplos comentados de todos os recursos disponíveis. **Só edite esse arquivo**, o resto do projeto não deve ser tocado (veja a seção 8 desse documento).

### Estrutura básica

```latex
\hypearticle
{Título do artigo}
{Seu Nome}
{

\hspace*{1.5em} Seu primeiro parágrafo aqui.

}
```

O `\hspace*{1.5em}` no início de cada parágrafo cria a indentação — copie esse padrão sempre que começar um parágrafo novo.

### Macros disponíveis

| Comando | Para que serve |
|---|---|
| `\subtitle{Texto}` | Cria uma seção interna dentro do artigo (ex: "Contexto", "Conclusão") |
| `\highlight{Texto}` | Caixa colorida para destacar uma frase, definição ou fórmula |
| `\begin{hypeitemize} \item ... \end{hypeitemize}` | Lista com marcadores no estilo do Hype |
| `\begin{infobox} Texto \end{infobox}` | Caixa de aviso/curiosidade (tom mais neutro que o `highlight`) |
| `\articleimage{largura}{caminho}{legenda}` | Insere uma imagem com legenda (veja a seção 6) |
| `\originalsource{link}` | Linha final "Leia também a fonte original aqui" |

Fórmulas matemáticas funcionam normalmente (`$...$` ou `\begin{multline*}...\end{multline*}`), já que o template importa `amsmath`.

### Ver o resultado (preview)

Com o `.tex` do seu artigo aberto, clique no ícone verde de "play" (▷) no canto superior direito do VS Code, ou use o atalho `Ctrl+Alt+B`. O PDF abre automaticamente numa aba ao lado, mostrando **a edição inteira** (não só o seu artigo) isso é totalmente normal, porque o projeto já tem uma configuração que diz ao LaTeX Workshop para sempre compilar a partir do `main.tex` da edição, mesmo que você tenha aberto só o arquivo do seu artigo ;D.

Se aparecer erro de compilação, releia o trecho que você editou por último, geralmente é uma chave `{` ou `}` faltando, ou um caractere especial (`%`, `$`, `&`, `_`) usado sem o `\` na frente.

---

## 6. Inserir imagens

1. Coloque o arquivo de imagem (`.png` ou `.jpg`, de preferência) **dentro da pasta do seu artigo**.
2. No `.tex`, use o caminho **a partir da pasta `sections/`**, não apenas o nome do arquivo:

```latex
\articleimage
{1.0}
{sections/meia-vida-agentes-ia/grafico.png}
{Legenda explicando a imagem.}
```

O primeiro parâmetro (`1.0`) é a largura da imagem em relação à coluna (`1.0` = largura total, `0.7` = 70%, etc.).

---

## 7. Enviar o artigo pronto

Com o Git instalado e o repositório clonado:

```bash
git checkout -b artigo/meia-vida-agentes-ia
git add editions/2026-09/sections/meia-vida-agentes-ia
git commit -m "Adiciona artigo: Meia-vida dos agentes de IA"
git push origin artigo/meia-vida-agentes-ia
```

Depois, abra um **Pull Request** no GitHub da sua branch para a `master`. O PR já vem com um checklist automático (edição, título, autor, se compilou, se os caminhos de imagem estão certos).

Se preferir não usar o Git pelo terminal, você pode subir a pasta do artigo direto pela interface do GitHub ("Add file" → "Upload files") e abrir o PR por lá.

Depois disso, a integração do seu artigo na versão final (incluí-lo no `main.tex` da edição) é feita pelo editor — você não precisa mexer em mais nada.

---

## 8. O que editar e o que NÃO editar

| Pode editar | Não editar |
|---|---|
| O `.tex` do seu próprio artigo | `shared/` (cores, fontes, macros, imagens fixas) |
| Imagens dentro da pasta do seu artigo | `main.tex` da edição (o editor integra os artigos) |
| | `styles/capa.tex` e `styles/layout.tex` da edição |
| | `.vscode/`, `.latexmkrc`, `.gitignore`, `.gitattributes` |
| | Criar a pasta `editions/AAAA-MM/` de uma edição nova (só o Diretor faz isso) |

Se você achar que algo na identidade visual (`shared/`) precisa mudar, converse com quem cuida do template antes de alterar — mudanças ali afetam **todas** as edições.

---

## Dúvidas frequentes

**O PDF não abre / dá erro de fonte.**
Confira se a distribuição LaTeX foi instalada corretamente e se o VS Code está usando a configuração do projeto (arquivo `.vscode/settings.json`, que já vem no repositório). Reabra o VS Code depois de instalar o MiKTeX/TeX Live pela primeira vez.

**Meu artigo não aparece no PDF final.**
Isso é normal: o `main.tex` da edição precisa ter uma linha `\input{sections/sua-pasta/seu-arquivo.tex}` apontando pro seu artigo. Isso é adicionado pelo editor na hora de integrar, não é algo que você precisa (ou deve) fazer.

**Posso usar comandos de LaTeX que não estão na lista de macros?**
Sim, comandos básicos (negrito `\textbf{}`, itálico `\textit{}`, links `\href{url}{texto}`, listas numeradas, etc.) funcionam normalmente. Evite mexer em espaçamentos, cores ou fontes na mão, para isso, use as macros prontas, que já seguem a identidade visual do Hype.
