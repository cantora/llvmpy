

clean:
	find . -name '*.pyc' -delete
	rm -vf llvm/_intrinsic_ids.py llvmpy/api.cpp
	rm -rf llvmpy/api
