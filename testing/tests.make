# Alternative GNU Make project makefile autogenerated by Premake

ifndef config
  config=ci
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild

SHELLTYPE := posix
ifeq ($(shell echo "test"), "test")
	SHELLTYPE := msdos
endif

# Configurations
# #############################################

RESCOMP = windres
TARGETDIR = bin
TARGET = $(TARGETDIR)/tests
OBJDIR = obj/tests
DEFINES += -DNDEBUG
INCLUDES += -Itestenv -Itestenv/CppUTestStepper/TestStepper/include -I../specification -I../application -I../application/modules -I../devel
FORCE_INCLUDE +=
ALL_CPPFLAGS += $(CPPFLAGS) -MD -MP $(DEFINES) $(INCLUDES)
ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -O2 -std=c++98 -pedantic-errors
ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -O2 -std=c++98 -pedantic-errors
ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
LIBS += -lCppUTest -lCppUTestExt
LDDEPS +=
ALL_LDFLAGS += $(LDFLAGS) -s
LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
define PREBUILDCMDS
endef
define PRELINKCMDS
endef
define POSTBUILDCMDS
endef

# Per File Configurations
# #############################################


# File sets
# #############################################

GENERATED :=
OBJECTS :=

GENERATED += $(OBJDIR)/BT_01.o
GENERATED += $(OBJDIR)/BT_02.o
GENERATED += $(OBJDIR)/BT_03.o
GENERATED += $(OBJDIR)/BT_04.o
GENERATED += $(OBJDIR)/BaseLib.o
GENERATED += $(OBJDIR)/Com.o
GENERATED += $(OBJDIR)/CompOstream.o
GENERATED += $(OBJDIR)/DSP_01.o
GENERATED += $(OBJDIR)/Dispatcher.o
GENERATED += $(OBJDIR)/LDR_01.o
GENERATED += $(OBJDIR)/Loader.o
GENERATED += $(OBJDIR)/Log.o
GENERATED += $(OBJDIR)/M_Instances.o
GENERATED += $(OBJDIR)/NtpArray.o
GENERATED += $(OBJDIR)/SIG_01.o
GENERATED += $(OBJDIR)/SIG_02.o
GENERATED += $(OBJDIR)/SIG_03.o
GENERATED += $(OBJDIR)/SIG_Hub.o
GENERATED += $(OBJDIR)/SIG_Provider.o
GENERATED += $(OBJDIR)/SIG_X.o
GENERATED += $(OBJDIR)/SYS_SIG_01.o
GENERATED += $(OBJDIR)/SYS_TSW_01.o
GENERATED += $(OBJDIR)/TSW.o
GENERATED += $(OBJDIR)/TSW_01.o
GENERATED += $(OBJDIR)/TSW_02.o
GENERATED += $(OBJDIR)/TSW_03.o
GENERATED += $(OBJDIR)/TSW_Hub.o
GENERATED += $(OBJDIR)/TSW_Provider.o
GENERATED += $(OBJDIR)/TT_01.o
GENERATED += $(OBJDIR)/TestGroupBase.o
GENERATED += $(OBJDIR)/TestLib.o
GENERATED += $(OBJDIR)/TestLiterals.o
GENERATED += $(OBJDIR)/TestMain.o
GENERATED += $(OBJDIR)/TestStepper.o
GENERATED += $(OBJDIR)/TestStepperPlugin.o
GENERATED += $(OBJDIR)/ddi.o
GENERATED += $(OBJDIR)/installComparators.o
GENERATED += $(OBJDIR)/ostreamHelpers.o
GENERATED += $(OBJDIR)/ostreams.o
OBJECTS += $(OBJDIR)/BT_01.o
OBJECTS += $(OBJDIR)/BT_02.o
OBJECTS += $(OBJDIR)/BT_03.o
OBJECTS += $(OBJDIR)/BT_04.o
OBJECTS += $(OBJDIR)/BaseLib.o
OBJECTS += $(OBJDIR)/Com.o
OBJECTS += $(OBJDIR)/CompOstream.o
OBJECTS += $(OBJDIR)/DSP_01.o
OBJECTS += $(OBJDIR)/Dispatcher.o
OBJECTS += $(OBJDIR)/LDR_01.o
OBJECTS += $(OBJDIR)/Loader.o
OBJECTS += $(OBJDIR)/Log.o
OBJECTS += $(OBJDIR)/M_Instances.o
OBJECTS += $(OBJDIR)/NtpArray.o
OBJECTS += $(OBJDIR)/SIG_01.o
OBJECTS += $(OBJDIR)/SIG_02.o
OBJECTS += $(OBJDIR)/SIG_03.o
OBJECTS += $(OBJDIR)/SIG_Hub.o
OBJECTS += $(OBJDIR)/SIG_Provider.o
OBJECTS += $(OBJDIR)/SIG_X.o
OBJECTS += $(OBJDIR)/SYS_SIG_01.o
OBJECTS += $(OBJDIR)/SYS_TSW_01.o
OBJECTS += $(OBJDIR)/TSW.o
OBJECTS += $(OBJDIR)/TSW_01.o
OBJECTS += $(OBJDIR)/TSW_02.o
OBJECTS += $(OBJDIR)/TSW_03.o
OBJECTS += $(OBJDIR)/TSW_Hub.o
OBJECTS += $(OBJDIR)/TSW_Provider.o
OBJECTS += $(OBJDIR)/TT_01.o
OBJECTS += $(OBJDIR)/TestGroupBase.o
OBJECTS += $(OBJDIR)/TestLib.o
OBJECTS += $(OBJDIR)/TestLiterals.o
OBJECTS += $(OBJDIR)/TestMain.o
OBJECTS += $(OBJDIR)/TestStepper.o
OBJECTS += $(OBJDIR)/TestStepperPlugin.o
OBJECTS += $(OBJDIR)/ddi.o
OBJECTS += $(OBJDIR)/installComparators.o
OBJECTS += $(OBJDIR)/ostreamHelpers.o
OBJECTS += $(OBJDIR)/ostreams.o

# Rules
# #############################################

all: $(TARGET)
	@:

$(TARGET): $(GENERATED) $(OBJECTS) $(LDDEPS) | $(TARGETDIR)
	$(PRELINKCMDS)
	@echo Linking tests
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning tests
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(GENERATED)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(GENERATED)) del /s /q $(subst /,\\,$(GENERATED))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild: | $(OBJDIR)
	$(PREBUILDCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) | $(PCH_PLACEHOLDER)
$(GCH): $(PCH) | prebuild
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
$(PCH_PLACEHOLDER): $(GCH) | $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) touch "$@"
else
	$(SILENT) echo $null >> "$@"
endif
else
$(OBJECTS): | prebuild
endif


# File Rules
# #############################################

$(OBJDIR)/SIG_Hub.o: ../application/modules/SIG/src/SIG_Hub.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SIG_Provider.o: ../application/modules/SIG/src/SIG_Provider.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SIG_X.o: ../application/modules/SIG/src/SIG_X.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW.o: ../application/modules/TSW/src/TSW.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW_Hub.o: ../application/modules/TSW/src/TSW_Hub.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW_Provider.o: ../application/modules/TSW/src/TSW_Provider.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BaseLib.o: ../application/modules/baselib/src/BaseLib.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/NtpArray.o: ../application/modules/baselib/src/NtpArray.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Com.o: ../application/modules/system/src/Com.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Dispatcher.o: ../application/modules/system/src/Dispatcher.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Loader.o: ../application/modules/system/src/Loader.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/Log.o: ../application/modules/system/src/Log.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SIG_01.o: moduletests/SIG/SIG_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SIG_02.o: moduletests/SIG/SIG_02.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SIG_03.o: moduletests/SIG/SIG_03.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW_01.o: moduletests/TSW/TSW_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW_02.o: moduletests/TSW/TSW_02.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TSW_03.o: moduletests/TSW/TSW_03.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BT_01.o: moduletests/basetests/BT_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BT_02.o: moduletests/basetests/BT_02.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BT_03.o: moduletests/basetests/BT_03.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/BT_04.o: moduletests/basetests/BT_04.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TT_01.o: moduletests/basetests/TT_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/DSP_01.o: moduletests/system/DSP_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/LDR_01.o: moduletests/system/LDR_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SYS_SIG_01.o: systemtests/SYS_SIG_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/SYS_TSW_01.o: systemtests/SYS_TSW_01.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestStepper.o: testenv/CppUTestStepper/TestStepper/src/TestStepper.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestStepperPlugin.o: testenv/CppUTestStepper/TestStepper/src/TestStepperPlugin.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/CompOstream.o: testenv/comparators/src/CompOstream.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/installComparators.o: testenv/comparators/src/installComparators.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ostreamHelpers.o: testenv/comparators/src/ostreamHelpers.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ostreams.o: testenv/comparators/src/ostreams.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ddi.o: testenv/ddi/src/ddi.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/M_Instances.o: testenv/mocks/src/M_Instances.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestGroupBase.o: testenv/testlib/src/TestGroupBase.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestLib.o: testenv/testlib/src/TestLib.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestLiterals.o: testenv/testlib/src/TestLiterals.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/TestMain.o: testenv/testlib/src/TestMain.cpp
	@echo "$(notdir $<)"
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(PCH_PLACEHOLDER).d
endif