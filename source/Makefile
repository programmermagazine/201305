# PANDOC = pandoc -s --mathml 
PANDOC = pandoc -s --webtex 
MD0 = $(patsubst %.md0,%.md,$(wildcard *.md0))
# MD0 = $(wildcard *.md0)
HTML = $(patsubst %.md,%.html,$(wildcard *.md)) $(patsubst %.md0,%.html,$(wildcard *.md0))
MD   = license.md message.md message1.md  message2.md \
people.md people1.md  video.md video1.md video2.md \
discuss.md discuss1.md discuss2.md discuss3.md \
article.md article1.md article2.md article3.md article4.md info.md reflink.md9
PARG = -c ../css/pmag.css -B header.htm -A footer.htm --toc --base-header-level=1 --toc-depth=2 
PEPUB = --toc --base-header-level=1 --toc-depth=2 --epub-metadata=metadata.xml --epub-stylesheet=../css/pmag.css 
EARG = --margin-top=16 --margin-bottom=16 --margin-left=20 --margin-right=20 \
--pretty-print --base-font-size=9 --font-size-mapping="7, 8, 9, 12, 14, 16, 20, 24" 
RM = rm -f

.PHONY: all epubipad pdfipad pdfA4

all: $(HTML)

epubA4: $(MD0)
	$(PANDOC) $(PEPUB) --epub-cover-image=../img/coverA4.png $(MD) -o ../book/A4.epub

pdfA4: epubA4
	ebook-convert ../book/A4.epub ../book/A4.pdf $(EARG) --paper-size=a4

epubipad: $(MD0)
	$(PANDOC) $(PEPUB) --epub-cover-image=../img/cover.jpg $(MD) -o ../book/ipad.epub

epub2ipad: epubipad
	ebook-convert ../book/ipad.epub ../book/ipad2.epub $(EARG) --output-profile=ipad3

pdfipad: epubipad
	ebook-convert ../book/ipad.epub ../book/ipad.pdf $(EARG) --output-profile=ipad3
	
shtm2pdf: shtm
	ebook-convert ../book/pmagIE.html ../book/pmag.pdf $(EARG) --output-profile=ipad3
	
html: $(MD0) $(HTML)

shtm: 
	$(PANDOC) $(MD) -o ../book/pmag.html $(PARG)

md0: $(MD0)
    
%.md0 : 
	node md0.js $*.md0 $*.md
    
%.md: %.md0
	node md0.js $< $@

%.html: %.md
	$(PANDOC) $< reflink.md9 -o ../htm/$@ $(PARG)
	
clean: 
	${RM} ../htm/*.*
	${RM} ../book/*.*
	${RM} ../timg/*.*
	${RM} $(MD0)

    
# $?：代表已被更新的 dependencies 的值。也就是 dependencies 中，比 targets 還新的值。
# $@：代表 targets 的值。
# $<：代表第一個 dependencies 的值。
# $* : 代表 targets 所指定的檔案，但不包含副檔名。