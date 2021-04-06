#!/bin/bash

# 执行数据库迁移
rails db:migrate

# 有可能上次非正常退出，所以要删除原来的文件，才能再次启动
# 当前也可以判断有没有该文件，有就通过该文件启动
rm -rf /code/tmp/pids/server.pid

# 启动项目
# -p：指定端口，后面是环境变量
# -e：指定环境，后面也是环境变量
# 环境会在编排模板中指定
rails s -p $IXUEA_PORT -b 0.0.0.0 -e $IXUEA_ENV