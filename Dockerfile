# 可以指定依赖的node镜像的版本 node:<version>，如果不指定，就会是最新的
FROM node:latest

# 创建工作目录，对应的是应用代码存放在容器内的路径
WORKDIR /usr/src/app

# 把 package.json，package-lock.json(npm@5+) 或 yarn.lock 复制到工作目录(相对路径)
COPY package.json .

# 只安装 dependencies 依赖; node 镜像自带 yarn
RUN yarn install

# 把其他源文件复制到工作目录
COPY . .

# 替换成应用实际的端口号
EXPOSE 3000

# 这里根据实际起动命令做修改
CMD [ "npm", "start" ]