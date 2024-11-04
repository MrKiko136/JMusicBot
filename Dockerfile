# Usa un'immagine base compatibile con ARM e Java 17
FROM eclipse-temurin:17-jre-focal

# Variabili per la versione e la data di build
ARG JMUSICBOT_VERSION=0.4.4  # Aggiorna qui alla nuova versione
ARG BUILDDATE

# Metadati dell'immagine
LABEL org.opencontainers.image.title="docker-jmusicbot"
LABEL org.opencontainers.image.description="A Dockerized version of JMusicBot for Discord (Kiko's fork)"
LABEL org.opencontainers.image.version="$JMUSICBOT_VERSION"
LABEL org.opencontainers.image.created="$BUILDDATE"
LABEL org.opencontainers.image.authors="Kiko"
LABEL org.opencontainers.image.url="https://github.com/MrKiko136/JMusicBot"
LABEL org.opencontainers.image.licenses="Apache-2.0"

# Directory di lavoro
WORKDIR /opt/jmusicbot

# Scarica il file JAR dal fork di Kiko
ADD https://github.com/MrKiko136/JMusicBot/releases/download/dev/JMusicBot-0.4.4.jar ./JMusicBot.jar

# Copia lo script di entrata e modifica i permessi
COPY docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh && mkdir config

# Monta la cartella di configurazione come volume
VOLUME [ "/opt/jmusicbot/config" ]

# Imposta le variabili d'ambiente
ENV VERSION=$JMUSICBOT_VERSION
ENV DATE=$BUILDBATE

# Specifica l'entrypoint
ENTRYPOINT [ "./docker-entrypoint.sh" ]
