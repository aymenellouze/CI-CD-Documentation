## Dockerfile

 Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image.



# create dockerfile 
fill it with this at first :


FROM node:20.5.1-alpine3.18 as dev
WORKDIR /app
COPY package*.json  .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm","start"] 

# run the Image

'''
sudo docker build -t sardina .
'''
# sardina refers to the image name and can be any name

# Now to optimize the images we go to this code

FROM node:20.5.1-alpine3.18 as dev
WORKDIR /app
COPY package*.json  .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm","start"] 

FROM node:20.5.1 as build
WORKDIR /app
COPY package*.json  .
RUN npm install
COPY . .
RUN npm run build 


FROM nginx:stable-alpine as prod
WORKDIR /usr/share/nginx/html
COPY --from=build  /app/build  .


# For the command is the same as earlier however change the name ofc 

'''
sudo docker build -t wrata .
'''

# show the existing container

please note that once running the previous command will automatically create its own container.

'''
sudo docker ps
'''

# remove the existing container 
in order to build again we need to remove the older conatiner

'''
sudo docker container prune
'''

# Running the image on web

to run the docker image inside the web we need to run it while giving it a port as well as mentioning the container port, the new name of the docker and then the name of the image

'''
sudo docker run -p 8090:80 -d --name prod sardina
'''

# add jenkins docker-compose 
we need to create a new file called "docker-compose.yml"

jenkins pipeline
manuel steps 
-
-
tous ces etape will be auto


   36  sudo apt install docker-compose
   37  sudo docker-compose up
   38  cd docker_compose/
   39  sudo docker-compose up
   40  sudo docker ps
   41  sudo docker ps -a
   42  sudo docker-compose up

   b3405341d8394480a4739ef168526a25 pass jenkins
   
   48  sudo docker ps
   49  sudo docker stop ecc
   50  sudo docker ps
   51  sudo docker-compose down
   52  sudo docker container prune
   53  sudo docker-compose up -d
   54  sudo docker ps
   **se3a tayahna contenaire ou tala3neh
   ou tawika taada 
   ** tawika halina jenkins ay haja thotha fil pipline hiya khater mbaad twali automatique par example if and ..
   nexus nkhaliw fiha el image 
   sonar qube yamel tous les test

# Cette commande installe Docker Compose sur votre système
sudo apt install docker-compose
# Cette commande démarre tous les services définis dans votre fichier de configuration Docker Compose. Il semble que vous l'ayez exécutée deux fois
sudo docker-compose up
# Cette commande change votre répertoire de travail actuel en "docker_compose/".
cd docker_compose/
# Cette commande affiche les conteneurs Docker en cours d'exécution
sudo docker ps: .
# Cette commande affiche tous les conteneurs Docker, qu'ils soient en cours d'exécution ou arrêtés.
sudo docker ps -a
# Cette commande arrête un conteneur Docker nommé "ecc"
sudo docker stop ecc
'''
sudo docker-compose down: 
'''
# Cette commande supprime tous les conteneurs Docker arrêtés.
'''
sudo docker container prune: 
'''
# Cette commande démarre tous les services Docker Compose en arrière-plan (détaché).
'''
sudo docker-compose up -d: 
'''
  279  sudo docker-compose down
  280  sudo docker-compose up -d
  281  cd docker_compose/
  282  sudo docker-compose down
  283  sudo docker-compose up -d
  284  sudo docker ps//bech naraw container
  285  sudo docker networks ls /bech naraw networks
  286  sudo docker network ls
  296  sudo docker stop 59 82 8a 67 1d /bech twa9ef el container
  308  sudo docker exec -it jenkinsserver bash
  309  sudo docker network ls
  310  docker ps --format '{{ .ID }} {{ .Names }} {{ json .Networks }}'/bech tatina esem network eli alih 
  319  sudo docker ps
  320  sudo docker exec e1 bash 
  321  sudo docker logs
  322  sudo docker log
  323  sudo docker logs e1
  324  sudo docker logs e1 | grep 64
  325  sudo docker logs e1 | grep vm
  326  sudo sysctl -w vm.max_map_count=262144
  327  sudo docker restart sonarqube
  328  sudo docker ps
  329  sudo docker logs sonarqube
  330  sudo docker ps
  331  sudo docker-compose stop
  332  sudo docker-compose up -d
  333  sudo docker ps
  334  sudo docker logs sonarqube 
  335  sudo docker stop sonarqube 
  336  sudo docker stop postgresql 
  337  sudo docker container prune
  338  sudo docker-compose up -d
  339  sudo docker ps
  340  sudo docker logs d3
  341  sudo sysctl -w vm.max_map_count=262144
  342  sudo docker-compose down
  343  sudo docker-compose up -d
  344  sudo docker ps
  345  sudo docker-compose down
  346  sudo docker-compose up -d
  347  sudo docker-compose down
  348  sudo docker ps -a
  349  sudo docker-compose up -d
  350  sudo docker logs sonarqube
  351  sudo sysctl -w vm.max_map_count=262144
  352  sudo docker logs sonarqube
  353  sudo docker-compose down
  354  sudo docker ps
  355  sudo docker stop a3
  356  sudo docker container prune
  357  sudo docker network prune
  358  sudo docker-compose up -d
  359  sudo docker ps
  360  sudo docker-compose up -d
  361  history