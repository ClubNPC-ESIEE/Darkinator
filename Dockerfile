# Utilisation de l'image python:latest comme base
FROM python:3.11
LABEL authors="keren"

# Copie des fichiers de votre projet dans le répertoire de travail du conteneur
COPY . /app

# Définition du répertoire de travail
WORKDIR /app

# Installation des dépendances nécessaires
RUN pip install -r requirements.txt

# Définir les variables d'environnement
ENV BOT_TOKEN="TOKEN"
ENV SERVER_ID=0
ENV DEFAULT_CHANNEL_ID=0
ENV ADMIN_ROLE="role_admin"

# Ajuster les autorisations sur le dossier pictures
RUN chmod -R 777 /app/pictures

# Définir le script de démarrage comme commande par défaut
CMD ["python", "main.py"]

#docker build -t projet .
#docker run projet

# Avec var env :
#docker run -e BOT_TOKEN="TOKEN" -e SERVER_ID=0 -e DEFAULT_CHANNEL_ID=0 -e ADMIN_ROLE="role_admin" projet
