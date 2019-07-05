OPTS= -H margins.sty --bibliography MetawebsAssembly.bib --csl=journal-of-animal-ecology.csl --latex-engine=xelatex 

all: Appendices.pdf MetawebsAssembly.pdf 


%.pdf:%.md
	pandoc $< -o $@ -H Appendices.sty
	evince $@		

MetawebsAssembly.pdf: MetawebsAssembly.md margins.sty 
	pandoc $< -o $@ $(OPTS)
	evince $@		

MetawebsAssembly_NPK.pdf: MetawebsAssembly_NPK.md margins.sty 
	pandoc $< -o $@ $(OPTS)
	evince $@		

TitlePage.pdf: TitlePage.md MetawebsAssembly.md margins.sty 
	pandoc $< -o $@ $(OPTS)
	evince $@		

Appendices.pdf: Appendices.md 
	pandoc -H Appendices.sty $^ -o $@
	evince $@		

MetawebsAssembly.docx: MetawebsAssembly.md makefile
	pandoc $< -o $@ $(OPTS)
			
MetawebsAssembly_bioRxiv.pdf: MetawebsAssembly.md nolineno.sty 
	pandoc $< -o $@ -H nolineno.sty --bibliography MetawebsAssembly.bib --latex-engine=xelatex --csl=ecography.csl 		
