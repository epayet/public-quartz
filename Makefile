# Define the source directory where your Obsidian notes live
CONTENT_SRC := /home/manu/Dropbox/Obsidian/Public/Quartz/

# The local content directory inside the Git repository
CONTENT_DEST := content

.PHONY: help copy publish build serve clean

help:
	@echo "Available commands:"
	@echo "  make copy      - Safely mirror Obsidian notes into the git repository"
	@echo "  make build     - Build the Quartz site locally"
	@echo "  make serve     - Run the local preview server"
	@echo "  make publish   - Clear local content, copy fresh files, and sync to GitHub"

sync:
	@echo "Clearing old content directory..."
	rm -rf $(CONTENT_DEST)
	mkdir -p $(CONTENT_DEST)
	@echo "Copying fresh notes from Dropbox..."
	cp -r $(CONTENT_SRC)/* $(CONTENT_DEST)
	npx quartz sync

build:
	npx quartz build --directory=$(CONTENT_SRC)

serve:
	npx quartz build --directory=$(CONTENT_SRC) --serve

clean:
	rm -rf $(CONTENT_DEST)
	mkdir -p $(CONTENT_DEST)
