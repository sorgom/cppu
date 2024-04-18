# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=ci
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),ci)
  coverage_app_config = ci
  coverage_tests_config = ci

else ifeq ($(config),dev)
  coverage_app_config = dev
  coverage_tests_config = dev

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := coverage_app coverage_tests

.PHONY: all clean help $(PROJECTS) 

all: $(PROJECTS)

coverage_app:
ifneq (,$(coverage_app_config))
	@echo "==== Building coverage_app ($(coverage_app_config)) ===="
	@${MAKE} --no-print-directory -C . -f coverage_app.make config=$(coverage_app_config)
endif

coverage_tests: coverage_app
ifneq (,$(coverage_tests_config))
	@echo "==== Building coverage_tests ($(coverage_tests_config)) ===="
	@${MAKE} --no-print-directory -C . -f coverage_tests.make config=$(coverage_tests_config)
endif

clean:
	@${MAKE} --no-print-directory -C . -f coverage_app.make clean
	@${MAKE} --no-print-directory -C . -f coverage_tests.make clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  ci"
	@echo "  dev"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   coverage_app"
	@echo "   coverage_tests"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"