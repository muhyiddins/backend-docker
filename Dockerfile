FROM keymetrics/pm2:latest-alpine


# RUN PATH="$PATH:/usr/bin/zsh"
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
#     -t robbyrussell


# RUN apt-get update -y && apt-get -y install nano wget
RUN apk update && apk add zsh nano wget git openssh tzdata
RUN cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN echo "Asia/Jakarta" >  /etc/timezone
RUN apk del tzdata
# Create app directory
WORKDIR /usr/src/app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json .
# COPY docker/app/package*.json .
COPY docker/app/* backend/

COPY docker/.ssh/* /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
COPY ecosystem.config.js .

RUN cd backend && npm install --production

# RUN npm install

# If you are building your code for production
# RUN npm ci --only=production

## Install PM2
RUN npm install pm2 -g



# Bundle app source


RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)"


EXPOSE 3301

## Build Scheme
# RUN npx prisma generate

# ENV PM2_PUBLIC_KEY 1111
# ENV PM2_SECRET_KEY 111


CMD ["pm2-runtime", "ecosystem.config.js"]

