# 使用Node.js官方镜像作为基础镜像，这里以16版本为例，你可以根据项目需求选择合适的版本
FROM node:16 AS build

# 设置工作目录，后续的操作都会在这个目录下进行
WORKDIR /app

# 复制项目文件到容器内的工作目录
COPY. /app

# 安装项目依赖
RUN npm install

# 执行构建命令，将Vue项目打包成生产环境可用的静态文件，存放在dist目录下
RUN npm run build

# 使用Nginx官方镜像作为基础镜像来部署构建后的项目
FROM nginx:latest

# 将构建阶段生成的dist目录中的内容复制到Nginx容器内的默认HTML目录（/usr/share/nginx/html）
COPY --from=build /app/dist /usr/share/nginx/html