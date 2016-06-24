UnmarkedObjectFolder := C:/projects_MASTER/SlaveSPS/Physical/Config2/X20CP1586/UserRoleSystem
MarkedObjectFolder := C:/projects_MASTER/SlaveSPS/Physical/Config2/X20CP1586/UserRoleSystem

$(AS_CPU_PATH)/User.br: \
	$(AS_PROJECT_CPU_PATH)/UserRoleSystem/User.user
	@"$(AS_BIN_PATH)/BR.AS.SystemConfiguration.Builder.exe"   "$(AS_PROJECT_CPU_PATH)/UserRoleSystem/User.user" -o "$(AS_CPU_PATH)/User.br" -zip -B D4.24 -z n.d

