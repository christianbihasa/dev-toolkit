# Python Environment & Tooling Setup

## 1. Environment Creation & Activation

### Standard `venv` Setup

```bash
# Create virtual environment (Python 3.10+)
python3 -m venv .venv

# Activate environment
# macOS/Linux:
source .venv/bin/activate

# Windows (PowerShell):
.venv\Scripts\Activate.ps1

# Upgrade core package managers
pip install --upgrade pip setuptools wheel
```

## 2. Standard pyproject.toml template 

### Create a pyproject.toml in your project root to centralize tool config instead of using separate config files.

```bash
[build-system]
requires = ["setuptools>=61.0"]
build-backend = "setuptools.build_meta"

[project]
name = "my-python-app"
version = "0.1.0"
description = "Project description"
readme = "README.md"
requires-python = ">=3.10"
dependencies = [
    # Core dependencies go here (e.g., "requests>=2.31.0")
]

[project.optional-dependencies]
dev = [
    "ruff>=0.3.0",
    "mypy>=1.8.0",
    "pytest>=8.0.0",
]

# Ruff Configuration (Linter & Formatter)
[tool.ruff]
line-length = 88
target-version = "py310"

[tool.ruff.lint]
select = ["E", "F", "I", "N", "UP", "B"]
ignore = []

# Mypy Configuration (Static Type Checker)
[tool.mypy]
python_version = "3.10"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true

# Pytest Configuration
[tool.pytest.ini_options]
minversion = "6.0"
addopts = "-ra -q"
testpaths = ["tests"]
```

## 3. Install Dev Dependencies & Run Tooling

```bash
# Install editable package with development tools
pip install -e ".[dev]"

# Run Linter & Auto-Fix formatting
ruff check . --fix
ruff format .

# Run Type Checking
mypy .

# Run Unit Tests
pytest
```

## 4. Python .gitignore Essentials

### Add these entries to your project's .gitignore file

```bash
# Virtual Environments
.venv/
venv/
ENV/

# Python Bytecode & Cache
__pycache__/
*.py[cod]
*$py.class
.pytest_cache/
.mypy_cache/
.ruff_cache/

# Distributions & Builds
dist/
build/
*.egg-info/

# Environment Variables
.env
.env.local
```