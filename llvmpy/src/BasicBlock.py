from binding import *
from namespace import llvm
from Value import Function, BasicBlock
from Instruction import Instruction, TerminatorInst
from LLVMContext import LLVMContext
from ADT.StringRef import StringRef

@BasicBlock
class BasicBlock:
    Create = StaticMethod(ptr(BasicBlock), ref(LLVMContext),
                          cast(str, StringRef),
                          ptr(Function),
                          ptr(BasicBlock))

    getParent = Method(ptr(Function))
    getTerminator = Method(ptr(TerminatorInst))
    
    empty = Method(cast(Bool, bool))
    dropAllReferences = Method()
    isLandingPad = Method(cast(Bool, bool))
    removePredecessor = Method(Void, ptr(BasicBlock), cast(bool, Bool))
    removePredecessor |= Method(Void, ptr(BasicBlock))

    getInstList = CustomMethod('BasicBlock_getInstList', PyObjectPtr)

    eraseFromParent = Method()
