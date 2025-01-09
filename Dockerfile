# Utiliser l'image officielle Apache comme base
FROM httpd:latest

# Copier le fichier index.html dans le répertoire approprié dans le container
COPY ./html/index.html /usr/local/apache2/htdocs/

# Exposer le port 80 pour le serveur Apache
EXPOSE 80