PHONY := check
.PHONY: check
check:
	@echo "make check: K0 placeholder. Engine CLI not yet wired in CI."
	@echo "For now, run the engine validator directly:"
	@echo "  pip install agri-core from the pinned tag, then:"
	@echo "  agri-core validate --strict --pack ."
	@echo "  agri-core lint-sources --pack ."
	@echo "  agri-core pack lock --pack ."
	@echo "  agri-core pack build --pack . --out build/"
	@echo "  agri-core coverage --pack ."
