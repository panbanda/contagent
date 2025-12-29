FROM node:24-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g claude-flow@alpha

WORKDIR /workspace

ENV CLAUDE_FLOW_NON_INTERACTIVE=true
ENV NODE_ENV=production

ENTRYPOINT ["npx", "claude-flow@alpha"]
CMD ["--help"]
