# Garante que o latexmk sempre use XeLaTeX (necessário por causa do fontspec),
$pdf_mode = 5;          # 5 = xelatex
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$pdflatex = $xelatex;
