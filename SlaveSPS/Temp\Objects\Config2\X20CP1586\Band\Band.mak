UnmarkedObjectFolder := C:/projects_MASTER/SlaveSPS/Logical/Band
MarkedObjectFolder := C:/projects_MASTER/SlaveSPS/Logical/Band

$(AS_CPU_PATH)/Band.br: \
	$(AS_PROJECT_CPU_PATH)/Cpu.per \
	$(AS_CPU_PATH)/Band/Band.ox
	@"$(AS_BIN_PATH)/BR.AS.TaskBuilder.exe" "$(AS_CPU_PATH)/Band/Band.ox" -o "$(AS_CPU_PATH)/Band.br" -v V1.00.0 -f "$(AS_CPU_PATH)/NT.ofs" -offsetLT "$(AS_BINARIES_PATH)/$(AS_CONFIGURATION)/$(AS_PLC)/LT.ofs" -T SG4  -M IA32  -B D4.24 -extConstants -d "runtime: V* - V*,asieccon: V* - V*" -r Cyclic1 -p 2 -s "Band" -L "AsIecCon: V*, astime: V*, operator: V*, runtime: V*" -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.taskbuilder.exe"

$(AS_CPU_PATH)/Band/Band.ox: \
	$(AS_CPU_PATH)/Band/a.out
	@"$(AS_BIN_PATH)/BR.AS.Backend.exe" "$(AS_CPU_PATH)/Band/a.out" -o "$(AS_CPU_PATH)/Band/Band.ox" -T SG4 -r Cyclic1   -G V4.1.2  -secret "$(AS_PROJECT_PATH)_br.as.backend.exe"

$(AS_CPU_PATH)/Band/a.out: \
	$(AS_CPU_PATH)/Band/Cyclic.sfc.o
	@"$(AS_BIN_PATH)/BR.AS.CCompiler.exe" -link "$(AS_CPU_PATH)/Band/Cyclic.sfc.o"  -o "$(AS_CPU_PATH)/Band/a.out"  -G V4.1.2  -T SG4  -M IA32  "-Wl,$(AS_PROJECT_PATH)/AS/System/D0424/SG4/IA32/libAsIecCon.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/D0424/SG4/IA32/libastime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/D0424/SG4/IA32/libruntime.a" "-Wl,$(AS_PROJECT_PATH)/AS/System/D0424/SG4/IA32/liboperator.a" -specs=I386specs -Wl,-q,-T,bur_elf_i386.x -nostdlib -secret "$(AS_PROJECT_PATH)_br.as.ccompiler.exe"

$(AS_CPU_PATH)/Band/Cyclic.sfc.o: \
	$(AS_PROJECT_PATH)/Logical/Band/Cyclic.sfc \
	$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.fun \
	$(AS_PROJECT_PATH)/Logical/Band/Variables.var
	@"$(AS_BIN_PATH)/BR.AS.IecCompiler.exe" "$(AS_PROJECT_PATH)/Logical/Band/Cyclic.sfc" -o "$(AS_CPU_PATH)/Band/Cyclic.sfc.o"  -T SG4  -M IA32  -G V4.1.2  -s "Band" -t "$(AS_TEMP_PATH)" -pointers -extComments -extBitAccess -extConstants -D _SG4 -l "$(AS_PROJECT_PATH)/Logical/Band/Types.typ" "$(AS_PROJECT_PATH)/Logical/Band/Variables.var" -g "$(AS_PROJECT_PATH)/Logical/Libraries/operator/operator.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.typ" "$(AS_PROJECT_PATH)/Logical/Libraries/operator/operator.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.fun" "$(AS_PROJECT_PATH)/Logical/Libraries/operator/operator.var" "$(AS_PROJECT_PATH)/Logical/Libraries/runtime/runtime.var" "$(AS_PROJECT_PATH)/Logical/Libraries/astime/astime.var" "$(AS_PROJECT_PATH)/Logical/Libraries/AsIecCon/AsIecCon.var" "$(AS_PROJECT_PATH)/Logical/Global.typ" "$(AS_PROJECT_PATH)/Logical/Global.var"  -P "$(AS_PROJECT_PATH)" -secret "$(AS_PROJECT_PATH)_br.as.ieccompiler.exe"

-include $(AS_CPU_PATH)/Force.mak 

