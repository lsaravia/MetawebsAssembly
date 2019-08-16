OPTS= -H margins.sty --bibliography MetawebsAssembly.bib --csl=nature-no-et-al.csl --pdf-engine=xelatex 

all: Appendices.pdf MetawebsAssembly.pdf MetawebsAssembly_nee.pdf CoverLetter.pdf


%.pdf:%.md
	pandoc $< -o $@ -H Appendices.sty
	evince $@		

MetawebsAssembly.pdf: MetawebsAssembly.md margins.sty 
	pandoc $< -o $@ $(OPTS)
	evince $@		

MetawebsAssembly_nee.pdf: MetawebsAssembly_nee.md margins.sty 
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
