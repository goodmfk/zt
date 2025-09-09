# 使用 Node 20 Alpine 作为基础镜像
FROM node:20-alpine

# 创建工作目录
WORKDIR /app

# 先复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖（如果有 lock 文件用 npm ci，没有则用 npm i）
RUN npm ci || npm i

# 再复制所有代码
COPY . .

# 启动应用（这里假设你的入口文件是 index.js）
CMD ["node", "index.js"]
