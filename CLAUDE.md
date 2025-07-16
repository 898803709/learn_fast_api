# CLAUDE.md

本文件为Claude Code (claude.ai/code) 在此代码库中工作时提供指导。

## 语言设置
请使用中文回复所有问题和交互。

## Development Commands

### Running the Application
```bash
# Using Docker (recommended)
docker-compose up

# Local development
uv run uvicorn api.main:app --host 0.0.0.0 --reload
```

### Code Quality & Linting
```bash
# Check all (mypy, black, ruff)
./scripts/check.sh

# Check specific tool
./scripts/check.sh mypy    # Type checking
./scripts/check.sh black   # Code formatting
./scripts/check.sh ruff    # Linting

# Auto-fix formatting issues
./scripts/fix.sh
```

### Testing
```bash
# Run tests
uv run pytest

# Run tests with coverage
uv run pytest --cov=api
```

### Database Operations
```bash
# Run database migrations (resets and recreates tables)
docker compose exec fast_api uv run python -m api.migrate_db

# Connect to MySQL database
docker compose exec db mysql demo
```

## Architecture

This is a FastAPI-based task management application using clean layered architecture:

- **`api/main.py`**: FastAPI app entry point with router registration
- **`api/routers/`**: API endpoints and HTTP logic
- **`api/schemas/`**: Pydantic models for request/response validation
- **`api/cruds/`**: Database operations (Create, Read, Update, Delete)
- **`api/models/`**: SQLAlchemy database models
- **`api/db.py`**: Database connection and async session management

### Key Technologies
- **FastAPI** with async/await support
- **SQLAlchemy 2.0** with async ORM
- **aiomysql** for async MySQL connections
- **uv** for package management
- **Docker** with MySQL service on port 33306

### Database Schema
Two main entities with 1:1 relationship:
- **Task**: id (PK), title (String)
- **Done**: id (PK, FK to Task)

### API Endpoints
```
GET /tasks               # List all tasks with completion status
POST /tasks              # Create new task
PUT /tasks/{task_id}     # Update task
DELETE /tasks/{task_id}  # Delete task
PUT /tasks/{task_id}/done    # Mark task as completed
DELETE /tasks/{task_id}/done # Mark task as incomplete
```

### Development Configuration
- **Line length**: 120 characters
- **Type checking**: Strict mypy with required type annotations
- **Database**: MySQL with `demo` database, empty root password
- **API docs**: Available at http://localhost:8000/docs

Always run `./scripts/check.sh` before committing to ensure code quality standards.