# Contagent

A Docker container packaging Anthropic's Claude development tools for secure, containerized AI-assisted development.

## What's Included

- **Claude Code** - Anthropic's AI-powered CLI tool
- **Claude Flow** - Workflow orchestration for Claude

## Quick Start

```bash
docker pull ghcr.io/panbanda/contagent:latest

# Run claude-flow
docker run -it ghcr.io/panbanda/contagent:latest --help

# Run claude-code
docker run -it --entrypoint npx ghcr.io/panbanda/contagent:latest claude-code --help
```

## Image Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest release from main branch |
| `flow-X.Y.Z-code-X.Y.Z` | Specific version combination |
| `sha-<commit>` | Specific commit |

## Building Locally

```bash
# Using Task
task build

# Using Docker directly
docker build -t contagent:local .
```

## Container Details

- **Base**: node:24-slim
- **User**: `contagent` (uid 1001) - runs as non-root
- **Workdir**: `/workspace`
- **Health check**: Validates claude-flow availability
- **Platforms**: linux/amd64, linux/arm64

## Environment Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `CLAUDE_FLOW_NON_INTERACTIVE` | `true` | Disables interactive prompts |
| `NODE_ENV` | `production` | Production mode |

## Version Management

Versions are managed via Dockerfile ARGs and automatically updated by Renovate when new releases are published to npm.

## License

MIT
