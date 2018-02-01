FROM ibmcom/ibmnode
# Just add :6 to use the latest 6
# you can use the community node image as well if you wanted to

ENV NODE_ENV production
ENV PORT 3000
# ENV USE_ZIPKIN

# We'll need this for testing the endpoints with helm test
RUN apt-get update;
RUN apt-get -y install wget --fix-missing;

WORKDIR "/app"

# Install app dependencies
COPY package.json /app/
RUN cd /app;
RUN npm install;

# Bundle app source
COPY . /app

EXPOSE 3000

ENTRYPOINT ['npm', 'start']
#CMD ["npm", "start"]
