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