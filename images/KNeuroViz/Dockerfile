FROM ubuntu:18.04

# neuroglancer-custom.zip 파일
COPY ./ /app  
WORKDIR /app

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# bash 쉘로 기본 쉘 변경하기 위해 심볼릭 링크 생성

RUN apt-get update -y
RUN apt-get install zip -y
RUN apt-get install curl -y

RUN unzip neuroglancer-custom.zip

RUN mkdir -p /usr/local/nvm

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 14.17.5
# nvm 경로 및 버전 환경변수 설정

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
# 설정된 환경변수 적용을 위해 source 명령어 실행
# nvm의 기본 Node 버전을 NODE_VERSION 환경변수로 세팅

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN ["npm", "-v"]
RUN ["node", "-v"]
#RUN ["nvm", "-v"]

#RUN ["nvm", "install", "stable"]
#RUN ["npm", "i"]

RUN ["npm", "install", "-g", "webpack@3", "webpack-cli@3"]
RUN ["npm", "install", "-g", "webpack-dev-server@3"]

CMD ["npm", "run", "dev-server"]


# 실행방법 
#docker build -t new_neuro:4.0 .
#docker container run -it -p 8091:8091 --name node-server_new2 new_neuro:4.0