# ==============================================================================
# Enterprise AI Content Automation Engine - Elite Makefile Task Runner
# ==============================================================================

SHELL := /bin/bash

# ANSI Color Codes for Professional Terminal Feedback
CYAN    := \033[36m
GREEN   := \033[32m
YELLOW  := \033[33m
RED     := \033[31m
RESET   := \033[0m

.PHONY: help setup up down test lint format clean

help:
	@echo -e "$(CYAN)==================================================$(RESET)"
	@echo -e "$(CYAN) Enterprise AI Content Engine - Command Reference$(RESET)"
	@echo -e "$(CYAN)==================================================$(RESET)"
	@echo -e "  $(GREEN)make setup$(RESET)  - Create virtual environment & install dependencies"
	@echo -e "  $(GREEN)make up$(RESET)     - Spin up PostgreSQL backend & n8n via Docker"
	@echo -e "  $(GREEN)make down$(RESET)   - Stop and tear down the container stack"
	@echo -e "  $(GREEN)make test$(RESET)   - Run pytest suite with coverage reports"
	@echo -e "  $(GREEN)make lint$(RESET)   - Run code quality linters (flake8 & black check)"
	@echo -e "  $(GREEN)make format$(RESET) - Automatically format code using black"
	@echo -e "  $(GREEN)make clean$(RESET)  - Purge local cache files and build artifacts"
	@echo -e "$(CYAN)==================================================$(RESET)"

setup:
	@echo -e "$(YELLOW)⚙️ Setting up Python virtual environment...$(RESET)"
	python3 -m venv venv
	@echo -e "$(YELLOW)📦 Installing requirements...$(RESET)"
	./venv/bin/pip install --upgrade pip
	./venv/bin/pip install -r requirements.txt
	@echo -e "$(GREEN)✨ Setup complete! Run 'source venv/bin/activate' to activate.$(RESET)"

up:
	@echo -e "$(YELLOW)🚀 Spinning up enterprise container stack...$(RESET)"
	docker compose up -d
	@echo -e "$(GREEN)✅ Container stack is live and healthy!$(RESET)"

down:
	@echo -e "$(YELLOW)🛑 Tearing down container stack...$(RESET)"
	docker compose down
	@echo -e "$(GREEN)✨ Stack successfully stopped and cleaned.$(RESET)"

test:
	@echo -e "$(YELLOW)🧪 Executing pytest automated suite with coverage...$(RESET)"
	pytest -v --cov=. --cov-report=term-missing

lint:
	@echo -e "$(YELLOW)🔍 Running code quality and style checks...$(RESET)"
	flake8 . --count --show-source --statistics
	black --check .

format:
	@echo -e "$(YELLOW)🧹 Auto-formatting codebase with Black...$(RESET)"
	black .
	@echo -e "$(GREEN)✨ Codebase successfully formatted!$(RESET)"

clean:
	@echo -e "$(YELLOW)🧹 Purging cache and temporary files...$(RESET)"
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".cov*" -exec rm -rf {} +
	rm -rf venv/
	@echo -e "$(GREEN)✨ Deep clean complete.$(RESET)"
