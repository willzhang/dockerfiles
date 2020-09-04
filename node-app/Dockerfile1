FROM node:10  

WORKDIR /srv/app 

COPY . /srv/app  

RUN npm install  
RUN npm install -g jest 

EXPOSE 3000 
EXPOSE 80 
 
CMD ["npm", "start"]
