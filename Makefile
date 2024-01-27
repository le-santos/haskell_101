help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# TASKS
build: ## build container image
	docker build -t haskell_dev .

run: ## run haskell ghci REPL in container
	docker run -it -v .:/app haskell_dev
