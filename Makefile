all: $(TARGET)

.PHONY: gsu
gsu: 
	@git submodule update --init --force --checkout $(REPO)
	@echo "$(REPO) repo synced 💅"

.PHONY: falco
falco:
	@$(MAKE) gsu REPO=falco
	@$(MAKE) -C falco all 1> /dev/null;
	@mkdir -p bin;
	@cp -r falco/dist/* bin;
	@rm -rf bin/*.tar.gz;
	@rm bin/falco;
	@echo "falco binaries rebuilt and copied 😸"

.PHONY: release
release:
	npm publish
