.PHONY : example cls all clean clsfast

all: cls example clean

clsfast:
	cp cesenaexam.dtx ./build/cesenaexam.dtx
	cd ./build && \
	pdflatex cesenaexam.dtx && \
	rm cesenaexam.dtx

cls:
	cp cesenaexam.dtx ./build/cesenaexam.dtx
	cd ./build && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam.dtx && \
	makeindex -s gglo.ist -o cesenaexam.gls cesenaexam.glo && \
	makeindex -s gind.ist -o cesenaexam.ind cesenaexam.idx && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam.dtx && \
	rm cesenaexam.dtx && \
	cp README.txt ../

example:
	cp cesenaexam_example.tex ./build/cesenaexam_example.tex
	cp -r images ./build/
	cd ./build && \
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" cesenaexam_example.tex && \
	rm cesenaexam_example.tex &&\
	rm -r images
	
clean:
	cd ./build && \
	rm -r *.aux *_latexmk *.fls *.glo *.gls *.hd *.idx *.ilg *.ind *.ins *.log *.out *.toc README.txt
