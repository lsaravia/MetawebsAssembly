OPTS= -H margins.sty --bibliography MetawebsAssembly.bib --csl=ecography.csl --latex-engine=xelatex 

all: Appendices.pdf MetawebsAssembly.pdf MetawebsAssembly_bioRxiv.pdf

%.pdf:%.md
	pandoc $< -o $@ -H Appendices.sty
	evince $@		

MetawebsAssembly.pdf: MetawebsAssembly.md margins.sty 
	cp "/home/leonardo/BibTeX/Manuscritos-Meta-web local web assembly.bib" MetawebsAssembly.bib
	pandoc $< -o $@ $(OPTS)
	evince $@		

Appendices.pdf: Appendices.md 
	pandoc -H Appendices.sty $^ -o $@
	evince $@		

MetawebsAssembly.docx: MetawebsAssembly.md makefile
	cp "/home/leonardo/BibTeX/Manuscritos-Meta-web local web assembly.bib" MetawebsAssembly.bib
	pandoc $< -o $@ $(OPTS)
			
MetawebsAssembly_bioRxiv.pdf: MetawebsAssembly.md nolineno.sty 
	cp "/home/leonardo/BibTeX/Manuscritos-Meta-web local web assembly.bib" MetawebsAssembly.bib
	pandoc $< -o $@ -H nolineno.sty --bibliography MetawebsAssembly.bib --latex-engine=xelatex --csl=ecography.csl 		
