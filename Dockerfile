FROM ghcr.io/puppeteer/puppeteer:22.6.0

USER root

# Instala TODAS as bibliotecas que o Chrome exige no Linux
RUN apt-get update && apt-get install -y \
    libnss3 \
    libdbus-1-3 \
    libatk1.0-0 \
    libasound2 \
    libxshmfence1 \
    libglu1-mesa \
    libgbm1 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# O Render usa portas dinâmicas, o EXPOSE é apenas informativo
EXPOSE 3001

CMD ["node", "server.js"]
