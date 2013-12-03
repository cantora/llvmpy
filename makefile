
PYTHON = python

.PHONY: tests
tests:
	@cd ./test && \
	tests=$$(find . -name '*.py' -not -name loopvectorize.py -not -name test_debuginfo.py); \
	failed=0; \
	for i in $$tests; do \
		echo $$i; \
		$(PYTHON) $$i; \
		if [ $$? -ne 0 ]; then \
			echo "$$i failed"; \
			failed=1; \
			break; \
		fi; \
	done && test $$failed -eq 0 && \
	$(PYTHON) -c 'import llvm; llvm.test()'
	@echo "all tests ok :D"

.PHONY: clean
clean:
	rm -rf ./build/
	find . -name '*.pyc' -delete
	rm -vf llvm/_intrinsic_ids.py llvmpy/api.cpp
	rm -rf llvmpy/api
