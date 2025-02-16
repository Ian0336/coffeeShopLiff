#!/bin/bash

# 停止並移除所有服務
docker compose down

# 移除由 docker-compose.yml 生成的所有映像檔
docker images | grep -E "(coffee)" | awk '{print $3}' | xargs docker rmi -f

# 移除由 docker-compose.yml 生成的所有卷
docker volume ls | grep -E "(coffee_postgres_data)" | awk '{print $2}' | xargs docker volume rm -f
# docker volume rm $(docker volume ls -q) 

# 重建並啟動所有服務
# docker compose up --build
