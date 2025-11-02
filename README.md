# Movie Shaker

Can’t decide what to watch? Just shake your phone and get a random movie suggestion instantly! Fast, fun, and perfect for movie nights.

## Features 
 - TBD

## Project Structure

### Architecture Overview

**Movie Shaker** follows a **Clean Architecture** approach with **Feature-First** organization, leveraging a **monorepo** setup managed by **Melos**. The project is structured to maintain clear separation of concerns and maximize code reusability across packages.

### Main Application (`/lib`)

The core application follows a layered architecture:

```
lib/
├── main.dart                    # Application entry point
└── src/
    ├── movie_shaker_app.dart   # Root application widget
    ├── data/                    # Data layer (outer layer)
    │   ├── datasources/        # Remote/local data sources (API clients)
    │   ├── entities/           # Data transfer objects (DTOs)
    │   ├── exceptions/         # Data-specific exceptions
    │   ├── extensions/         # Data utility extensions
    │   ├── interceptors/       # HTTP interceptors (logging, auth)
    │   ├── mappers/            # Entity ↔ Domain model mappers
    │   ├── repositories/       # Repository implementations
    │   └── shared/             # Shared data utilities
    │
    ├── domain/                  # Domain layer (core business logic)
    │   ├── base/               # Base classes & interfaces
    │   ├── build_config/       # Build configuration models
    │   ├── entities/           # Domain models (business entities)
    │   ├── exceptions/         # Domain-specific exceptions
    │   ├── interactors/        # Use cases / business logic
    │   └── repositories/       # Repository interfaces
    │
    ├── presentation/            # Presentation layer (UI)
    │   ├── features/           # Feature modules
    │   ├── navigation/         # App routing (GoRouter)
    │   └── resources/          # UI resources (colors, strings)
    │
    ├── di/                      # Dependency Injection
    │   ├── build_config/       # Build config providers
    │   ├── datasources/        # Data source providers
    │   ├── interactors/        # Use case providers
    │   ├── logger/             # Logger providers
    │   ├── mappers/            # Mapper providers
    │   ├── network/            # Network client providers (Dio, Retrofit)
    │   ├── repositories/       # Repository providers
    │   ├── router/             # Router providers
    │   └── theme/              # Theme providers
    │
    └── utils/                   # General utilities
```

### Workspace Packages (`/packages`)

#### 1. **ui_components** (`/packages/ui_components`)
A comprehensive design system package containing reusable UI components:

- **Custom Components**
- **Theme System**

#### 2. **localization** (`/packages/localization`)
Handles internationalization (i18n) for the entire application.

### Technology Stack

#### State Management & DI
- **Riverpod** (`hooks_riverpod`, `riverpod_annotation`) - State management & dependency injection
- **Flutter Hooks** (`flutter_hooks`) - Widget lifecycle management

#### Navigation
- **GoRouter** (`go_router`) - Declarative routing with deep linking support

#### Networking
- **Dio** (`dio`) - HTTP client
- **Retrofit** (`retrofit`) - Type-safe REST client generation
- **Pretty Dio Logger** - Request/response logging

#### Code Quality
- **Custom Lint** (`custom_lint`, `riverpod_lint`) - Custom lint rules
- **Dart Code Metrics Presets** (`dart_code_metrics_presets`) - Code quality metrics
- **DCM** (configured via `dcm_global.yaml`) - Advanced code analysis

#### Build Configuration
- **FVM** (`.fvmrc`) - Flutter version management (v3.35.6)
- **Melos** - Monorepo management tool

### Monorepo Management

The project uses **Melos** to manage the monorepo workspace:

```yaml
workspace:
  - packages/ui_components
  - packages/localization
```

**Melos Scripts:**
- `melos analyze` - Runs linting across all packages
- `melos code_gen` - Runs code generation (skips localization package)

### Key Architectural Patterns

1. **Clean Architecture:**
   - Domain layer is independent (business logic)
   - Data layer implements domain interfaces
   - Presentation layer depends on domain

2. **Repository Pattern:**
   - Abstracts data sources
   - Mappers convert between data entities and domain models

3. **Interactor Pattern:**
   - Each interactor encapsulates a single business operation

4. **Dependency Injection:**
   - Riverpod providers in `/di` folder
   - Organized by layer (datasources, repositories, interactors, etc.)

5. **Feature-First Organization:**
   - Features are self-contained modules

### Development Workflow

1. **Code Generation:** Run `melos code_gen` to generate:
   - Riverpod providers
   - Freezed data classes
   - JSON serialization
   - Retrofit API clients
   - GoRouter routes

2. **Linting:** Run `melos analyze` for code quality checks

3. **Scripts:** Custom bash scripts in `/scripts`:
   - `lint.sh` - Linting script
   - `run_code_generation.sh` - Code generation script

## Installation

### Quick Start

```bash
# 1. Clone the repository
git clone https://github.com/your-username/movie_shaker.git
cd movie_shaker

# 2. Install FVM (Flutter Version Manager)
brew tap leoafarias/fvm
brew install fvm

# 3. Install Flutter version specified in .fvmrc (v3.35.6)
fvm install && fvm use

# 4. Install Melos (monorepo tool)
fvm dart pub global activate melos

# 5. Bootstrap workspace & get dependencies
melos bootstrap

# 6. Generate code (Riverpod, Freezed, JSON, Retrofit, GoRouter)
melos code_gen

# 7. Run the app
fvm flutter run --dart-define=API_KEY=your_tmdb_api_key --dart-define=BUILD_TYPE=dev
```

> 📚 **FVM Setup:** If you encounter issues with FVM, see the [official installation guide](https://fvm.app/documentation/getting-started/installation)

### Configuration (Dart Defines)

The app requires the following dart defines to run:

| Variable     | Description                       | Required | Values            |
|--------------|-----------------------------------|----------|-------------------|
| `API_KEY`    | The Movie Database (TMDB) API key | ✅ Yes    | Your TMDB API key |
| `BUILD_TYPE` | Build configuration type          | ✅ Yes    | `dev` or `prod`   |

#### Getting TMDB API Key

1. Create an account at [The Movie Database](https://www.themoviedb.org/)
2. Go to Settings → API
3. Request an API key (choose "Developer" option)
4. Copy your API Key (v3 auth)

#### Running with Dart Defines

**Development:**
```bash
fvm flutter run \
  --dart-define=API_KEY=your_tmdb_api_key_here \
  --dart-define=BUILD_TYPE=dev
```

**Production:**
```bash
fvm flutter run \
  --dart-define=API_KEY=your_tmdb_api_key_here \
  --dart-define=BUILD_TYPE=prod \
  --release
```

#### Build Type Differences

| Build Type | Logging Enabled | Use Case                                                         |
|------------|-----------------|------------------------------------------------------------------|
| **`dev`**  | ✅ Yes           | Development & debugging (shows Dio requests/responses, app logs) |
| **`prod`** | ❌ No            | Production releases (no debug logging)                           |

### Code Analysis

The project uses multiple layers of code analysis to maintain high code quality:

#### Analysis Tools

1. **Flutter Analyzer** - Built-in Dart static analysis
2. **Custom Lint** - Custom lint rules (Riverpod Lint)
3. **Dart Code Metrics (DCM)** - Advanced code metrics and quality analysis

#### Running Analysis

**Run analysis checks:**
```bash
melos analyze
```

This runs the custom `lint.sh` script which performs:
- Code formatting check (`dart format`)
- DCM analysis with metrics and rules


#### Pre-commit Recommendations

To ensure code quality, run before committing:

```bash
melos analyze
```

Or create a git pre-commit hook by creating `.git/hooks/pre-commit`:

```bash
#!/bin/bash
melos analyze
```

Make it executable:
```bash
chmod +x .git/hooks/pre-commit
```

