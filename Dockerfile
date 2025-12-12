# Dockerfile
FROM debian:bookworm-slim

# Install required packages for the wisecow script
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      netcat-openbsd fortune-mod cowsay ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the existing server script (wisecow.sh)
COPY wisecow.sh ./wisecow.sh
RUN chmod +x ./wisecow.sh

# Create non-root user and drop privileges
RUN useradd -m appuser && chown -R appuser:appuser /app
USER appuser

ENV SRVPORT=4499
EXPOSE 4499

CMD ["./wisecow.sh"]

