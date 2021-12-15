OPTS= -H margins.sty --bibliography MetawebsAssembly.bib --citeproc --csl=journal-of-animal-ecology.csl --pdf-engine=xelatex 
all: MetawebsAssembly.docx	MetawebsAssembly.tex MetawebsAssembly.pdf Appendices.pdf CoverLetter.pdf MetawebsAssembly_bioRxiv.pdf JAE_review_reply.pdf AbstractSpanish.pdf


%.pdf:%.md
	pandoc $< -o $@ 
	evince $@		

MetawebsAssembly.pdf: MetawebsAssembly.md margins.sty makefile
	pandoc $< -o $@ $(OPTS)
	evince $@		

FiguresTables.pdf: FiguresTables.md MetawebsAssembly.md margins.sty 
	pandoc $< -o $@ 
	evince $@		

Appendices.pdf: Appendices.md 
	pandoc -H Appendices.sty --bibliography MetawebsAssembly.bib --citeproc --csl=journal-of-animal-ecology.csl $^ -o $@
	evince $@		

MetawebsAssembly.docx: MetawebsAssembly.md makefile
	pandoc $< -o $@ $(OPTS)

MetawebsAssembly.tex: MetawebsAssembly.md makefile
	pandoc $< -o $@ $(OPTS)

			
MetawebsAssembly_bioRxiv.pdf: MetawebsAssembly.md nolineno.sty 
	pandoc $< -o $@ -H nolineno.sty --bibliography MetawebsAssembly.bib --pdf-engine=xelatex --citeproc --csl=journal-of-animal-ecology.csl		
