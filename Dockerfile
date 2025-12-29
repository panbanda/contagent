FROM node:24-slim AS base

ARG CLAUDE_CODE_VERSION=2.0.76
ARG CLAUDE_FLOW_VERSION=2.7.47

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    jq \
    ca-certificates \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
    claude-flow@${CLAUDE_FLOW_VERSION}

RUN groupadd -g 1001 contagent \
    && useradd -u 1001 -g contagent -m -s /bin/bash contagent

RUN mkdir -p /workspace /home/contagent/.claude \
    && chown -R contagent:contagent /workspace /home/contagent

WORKDIR /workspace

USER contagent

ENV CLAUDE_FLOW_NON_INTERACTIVE=true
ENV NODE_ENV=production

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD claude-flow --version || exit 1

ENTRYPOINT ["npx", "claude-flow"]
CMD ["--help"]
