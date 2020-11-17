OPTS= -H margins.sty --bibliography MetawebsAssembly.bib --csl=journal-of-animal-ecology.csl --pdf-engine=xelatex 

all: FiguresTables.pdf 


%.pdf:%.md
	pandoc $< -o $@ -H Appendices.sty
	evince $@		

MetawebsAssembly.pdf: MetawebsAssembly.md margins.sty makefile
	pandoc $< -o $@ $(OPTS)
	evince $@		

FiguresTables.pdf: FiguresTables.md MetawebsAssembly.md margins.sty 
	pandoc $< -o $@ $(OPTS)
	evince $@		

Appendices.pdf: Appendices.md 
	pandoc -H Appendices.sty $^ -o $@
	evince $@		

MetawebsAssembly.docx: MetawebsAssembly.md makefile
	pandoc $< -o $@ $(OPTS)
			
MetawebsAssembly_bioRxiv.pdf: MetawebsAssembly.md nolineno.sty 
	pandoc $< -o $@ -H nolineno.sty --bibliography MetawebsAssembly.bib --pdf-engine=xelatex --csl=ecography.csl 		

