# Project Makefile
# Run `make` or `make help` to see available targets.

.PHONY: help setup lint test run clean backup

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

setup: ## Install dependencies
	@echo "TODO: add install steps"
	# pip install -r requirements.txt
	# npm ci

lint: ## Run linter
	@echo "TODO: add lint command"
	# ruff check .
	# eslint .

test: ## Run tests
	@echo "TODO: add test command"
	# pytest
	# npm test

run: ## Start the application
	@echo "TODO: add run command"
	# python -m app
	# npm start

clean: ## Remove build artifacts and cache
	@echo "Cleaning..."
	@find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name '*.pyc' -delete 2>/dev/null || true
	@rm -rf dist/ build/ .cache/ 2>/dev/null || true
	@echo "Done."

backup: ## Run backup workflow (commit + tag + log)
	@echo "=== Backup Workflow ==="
	@echo ""
	@echo "1. Stage changes:"
	@git add .
	@git status --short
	@echo ""
	@echo "2. Commit (enter message or Ctrl+C to abort):"
	@read -p "Commit message: " msg; \
		git commit -m "$$msg"
	@echo ""
	@echo "3. Push:"
	@git push origin main
	@echo ""
	@echo "4. Tag (enter version or Ctrl+C to skip):"
	@read -p "Version tag (e.g. v1.2): " tag; \
		git tag -a "$$tag" -m "$$tag — backup" && \
		git push --tags
	@echo ""
	@echo "5. Log entry:"
	@mkdir -p log/backup
	@echo "# Backup $$(date +%Y%m%d_%H%M%S)" > log/backup/$$(date +%Y%m%d_%H%M%S).md
	@echo "Backup complete."
