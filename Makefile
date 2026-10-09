EMACS ?= emacs

.PHONY: all rebuild serve clean

all:            ## incremental build (only changed files)
	$(EMACS) --batch -l publish.el -f my/publish

rebuild:        ## force re-export of everything
	$(EMACS) --batch -l publish.el -f my/publish-all

serve: all      ## local preview at http://localhost:8000
	cd html && python3 -m http.server 8000

clean:
	rm -rf html/* ~/.org-timestamps/*
