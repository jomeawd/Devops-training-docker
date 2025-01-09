# Devops-training-docker


## Question 3
docker pull httpd
docker images 
mkdir html
cd html
touch index.html 


docker run -d -p 80:80 -v $(pwd)/html:/usr/local/apache2/htdocs/ httpd

docker stop <container_id>
docker rm <container_id>

docker run -d -p 80:80 httpd
docker cp ./html/index.html <container_id>:/usr/local/apache2/htdocs/

## Question 4

Dans Dockerfile:

<# Dockerfile
FROM httpd:latest
COPY ./html/index.html /usr/local/apache2/htdocs/
EXPOSE 80
>

docker build -t my-httpd-imagete
docker run -d -p 80:80 my-httpd-image

Différences entre la méthode 3 et 4 :
Mount Volume (-v) : Permet d'éviter de reconstruire l'image à chaque modification, mais ne garde pas la configuration du serveur personnalisée dans l'image.
docker cp : Nécessite de copier manuellement les fichiers dans le container à chaque modification, ce qui peut être contraignant.
Dockerfile : Permet d'intégrer les fichiers dans l'image, ce qui rend la configuration plus propre et cohérente, mais nécessite de reconstruire l'image lors de chaque modification.

## Question 5

docker pull mysql
docker pull phpmyadmin/phpmyadmin

docker run --name phpmyadmin -d --link mysql-db:db -p 8080:80 --platform linux/arm64 phpmyadmin/phpmyadmin

##Question 6

docker run : Cette commande permet de lancer un seul conteneur Docker à la fois. Chaque conteneur doit être configuré individuellement (image, options, variables d'environnement, ports, etc.). Cela devient complexe lorsque plusieurs conteneurs interconnectés doivent être gérés.
docker-compose : C'est un outil qui permet de définir et gérer plusieurs conteneurs en même temps via un fichier YAML (docker-compose.yml). Avec une seule commande (docker-compose up), tu peux démarrer tous les services définis, ce qui simplifie la gestion des applications multiconteneurs. Il prend aussi en charge les réseaux entre les services, les volumes et les dépendances.

brew install docker-compose 
docker-compose up -d
docker-compose down



John Botros
