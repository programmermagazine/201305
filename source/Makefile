# PANDOC = pandoc -s --mathml 
PANDOC = pandoc -s --webtex 
HTML  = $(patsubst %.md,%.html,$(wildcard *.md))
MD   = license.md message.md message1.md  message2.md \
people.md people1.md  video.md video1.md video2.md \
discuss.md discuss1.md discuss2.md discuss3.md \
article.md article1.md article2.md article3.md article4.md info.md reflink.md1
PARG = -c ../css/pmag.css -B header.htm -A footer.htm --toc --base-header-level=1 --toc-depth=2 
PEPUB = --toc --base-header-level=1 --toc-depth=2 --epub-metadata=metadata.xml --epub-stylesheet=../css/pmag.css 
EARG = --margin-top=16 --margin-bottom=16 --margin-left=20 --margin-right=20 \
--pretty-print --base-font-size=9 --font-size-mapping="7, 8, 9, 12, 14, 16, 20, 24" 
RM = rm -f

.PHONY: all epubipad pdfipad pdfA4

all: $(HTML)

epubA4:
	$(PANDOC) $(PEPUB) --epub-cover-image=../img/coverA4.png $(MD) -o ../book/A4.epub

pdfA4: epubA4
	ebook-convert ../book/A4.epub ../book/A4.pdf $(EARG) --paper-size=a4

epubipad:
	$(PANDOC) $(PEPUB) --epub-cover-image=../img/cover.jpg $(MD) -o ../book/ipad.epub

epub2ipad: epubipad
	ebook-convert ../book/ipad.epub ../book/ipad2.epub $(EARG) --output-profile=ipad3

pdfipad: epubipad
	ebook-convert ../book/ipad.epub ../book/ipad.pdf $(EARG) --output-profile=ipad3
	
shtm2pdf: shtm
	ebook-convert ../book/pmagIE.html ../book/pmag.pdf $(EARG) --output-profile=ipad3
	
html: $(HTML)

shtm: 
	$(PANDOC) $(MD) -o ../book/pmag.html $(PARG)

%.html: %.md
	$(PANDOC) $< reflink.md1 -o ../htm/$@ $(PARG)
	
clean: 
	${RM} ../htm/*.*
	${RM} ../book/*.*
