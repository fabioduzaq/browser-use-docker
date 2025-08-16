FROM python:3.11

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Instala o navegador e as dependências de sistema do Playwright
RUN playwright install chromium
RUN playwright install-deps

# Instala a lista de dependências
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     libnss3 \
#     libnspr4 \
#     libdbus-1-3 \
#     libatk1.0-0 \
#     libatk-bridge2.0-0 \
#     libcups2 \
#     libdrm2 \
#     libxcomposite1 \
#     libxdamage1 \
#     libxfixes3 \
#     libxrandr2 \
#     libgbm1 \
#     libxkbcommon0 \
#     libasound2 \
#     libatspi2.0-0 \
#     xvfb \
#     x11vnc \
#     fontconfig \
#     # libx11-xcb1 libgtk-3-0 gstreamer1.0-libav gstreamer1.0-plugins-good
#     && rm -rf /var/lib/apt/lists/*


ENV DISPLAY=:99

EXPOSE 5900

COPY . .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
