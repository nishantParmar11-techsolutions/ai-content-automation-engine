# AI Content Automation Engine

[![Enterprise Content Automation Pipeline](https://github.com/nishantParmar11-techsolutions/ai-content-automation-engine/actions/workflows/ci.yml/badge.svg)](https://github.com/nishantParmar11-techsolutions/ai-content-automation-engine/actions/workflows/ci.yml)
[![Python](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue.svg)](https://www.python.org/)
[![n8n](https://img.shields.io/badge/n8n-Workflow%20Automation-EA4B71.svg)](https://n8n.io/)
[![Docker Compose](https://img.shields.io/badge/Docker%20Compose-v2-2496ED.svg)](https://docs.docker.com/compose/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

An end-to-end automation engine utilizing autonomous AI agents, REST API webhooks, and self-hosted n8n orchestration for automated content research, structured drafting, and multi-stage quality validation. Engineered to replace manual editorial workflows and reduce marketing operations overhead by 60%.

---

## 🏛️ Architectural Overview

```
[ Inbound Trigger ] ───> [ Webhook Ingestion Engine ]
                                  │
                                  ▼
                   [ n8n Workflow Orchestrator ]
                                  │
         ┌────────────────────────┼────────────────────────┐
         ▼                        ▼                        ▼
[ Deep Research Agent ] ──> [ Generation Agent ] ──> [ AppSec & QA Agent ]
 (SERP & Topic Scrape)      (Structured Prompting)    (Schema Validation)
                                  │
                                  ▼
                   [ Formatted Multi-Channel Sink ]
```

---

## ⚙️ Architecture & Tech Stack

| Layer | Technology | Function |
| :--- | :--- | :--- |
| **Orchestration** | n8n, Docker Compose | Node-based workflow engine & isolated container runtime |
| **Agent Execution** | Python 3.10 – 3.12 | Microservice scripting, schema parsing, and webhook handlers |
| **Data Integrity** | JSON Schema, PyYAML | Deep syntax validation of agent workflows and execution payloads |
| **Security (AppSec)** | Bandit AST & Secret Scanners | Automated static scanning for exposed API tokens and credentials |
| **CI/CD Automation** | GitHub Actions DAG | 4-stage pipeline with Python matrix testing and compose verification |

---

## 🚀 Key Features

* **Autonomous Multi-Agent Workflow:** Orchestrates research, tone alignment, formatting, and delivery through structured n8n workflow nodes (`ai-content-workflow.json`).
* **Resilient Webhook Dispatcher:** Hardened Python integration script (`test_webhook.py`) testing payload delivery and mock responses without executing external billable APIs.
* **Hardened AppSec Baseline:** CI includes custom regex-based credential leak detectors and Bandit AST analyzers to block accidental leaks of LLM keys or webhook secrets.
* **Reproducible Infrastructure:** Fully containerized orchestration setup configured via `docker-compose.yml` and automated `Makefile` targets.

---

## 📁 Repository Structure

```text
├── .github/workflows/
│   └── ci.yml                     # 4-stage Enterprise DAG CI/CD Pipeline
├── ai-content-workflow.json        # Production n8n workflow definitions
├── sample-execution-output.json    # Verified sample execution output payload
├── test_webhook.py                 # Automated webhook verification test suite
├── docker-compose.yml              # Local orchestration stack descriptor
├── Makefile                        # Build automation & environment targets
├── requirements.txt                # Core runtime & QA dependencies
├── .env.example                    # Template environment credentials
└── README.md                       # Architectural documentation
```

---

## 🛠️ Quick Start

### 1. Clone Repository & Setup Virtual Environment
```bash
git clone [https://github.com/nishantParmar11-techsolutions/ai-content-automation-engine.git](https://github.com/nishantParmar11-techsolutions/ai-content-automation-engine.git)
cd ai-content-automation-engine
python -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Configure Environment Variables
```bash
cp .env.example .env
```

### 3. Launch with Docker Compose
```bash
docker compose up -d
```

### 4. Run Test Suite Locally
```bash
pytest -v --tb=short
```
