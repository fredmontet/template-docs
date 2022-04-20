JOBNAME = output
TEX = xelatex -shell-escape -file-line-error -jobname=${JOBNAME}
BIBTEX = bibtex
MAIN = main.tex
OUTPUT = ${JOBNAME}.pdf

.PHONY: clean clean_all open

all : ${OUTPUT}

${OUTPUT} : ${MAIN}
	${TEX} ${MAIN}
	${TEX} ${MAIN}
	${BIBTEX} main
	${TEX} ${MAIN}
	${TEX} ${MAIN}
	${TEX} ${MAIN}

clean : 
	@rm *.bbl || true
	@find . -name "*.log" -type f -delete || true
	@rm *.out || true
	@rm *.blg || true
	@rm *.toc || true
	@find . -name "*.aux" -type f -delete || true
	@rm *.bak || true
	@rm *.pyg || true
	@rm *.fls || true
	@rm *.backup || true
	@rm *.lof || true
	@rm *.lot || true
	@rm *.synctex.gz || true
	@rm *.run.xml || true
	@rm *.bcf || true
	@rm -rf _minted* || true

clean_all : clean
	@rm ${OUTPUT} || true 

open : 
	@open ./${JOBNAME}.pdf

