########################
### Makefile Helpers ###
########################

.PHONY: prompt_user
# Internal helper target - prompt the user before continuing
prompt_user:
	@echo "Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]

.PHONY: list
list: ## List all make targets
	@${MAKE} -pRrn : -f $(MAKEFILE_LIST) 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | sort

.PHONY: help
.DEFAULT_GOAL := help
help: ## Prints all the targets in all the Makefiles
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-60s\033[0m %s\n", $$1, $$2}'

###################
### Tap Helpers ###
###################

.PHONY: tap_update_version
tap_update_version: ## Update the tap versions using the releases at https://github.com/pokt-network/poktroll/releases/
	@echo "Updating tap versions..."
	./update_tap.sh

.PHONY: tap_test_install
tap_test_install: ## Test the tap installation after updating the local .rb file
	@echo "Testing tap installation..."
	brew install --build-from-source ./poktrolld.rb
	@echo "Try running this now: poktrolld version"

.PHONY: tap_test_reinstall
tap_test_reinstall: ## Test the tap installation after updating the local .rb file
	@echo "Testing tap installation..."
	brew reinstall --build-from-source ./poktrolld.rb
	@echo "Try running this now: poktrolld version"

.PHONY: tap_reset
tap_reset: ## DEVS_ONLY: Reset the tap to the latest release
	@echo "Resetting tap to an empty state..."
	cp poktrolld_empty.rb poktrolld.rb