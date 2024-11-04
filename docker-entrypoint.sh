#!/bin/sh

echo "Starting JMusicBot from Kiko's fork (https://github.com/MrKiko136/JMusicBot)
JMusicBot version: $VERSION, Dockerized on: $DATE"
echo ""

FILE=/opt/jmusicbot/config/config.txt
if [ ! -f "$FILE" ]; then
    echo "No config.txt found, downloading example config from
    https://github.com/MrKiko136/JMusicBot/releases/download/$VERSION/config.txt"
    
    # Scarica il config.txt di esempio dal tuo fork
    curl -L https://github.com/MrKiko136/JMusicBot/releases/download/$VERSION/config.txt -o /opt/jmusicbot/config/config.txt
    echo ""
fi

cd /opt/jmusicbot/config

# Esegui il bot in modalità no-gui
exec java -Dnogui=true -jar /opt/jmusicbot/JMusicBot.jar
