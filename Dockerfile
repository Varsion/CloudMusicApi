# 基础镜像，这里使用ruby 2.7
# 它里面安装了ruby 2.7，好处是我们不用手动安装
# 例如：有的项目需要定制Ruby运行环境
# 可以直接继承Debian这样的基础镜像，在安装Ruby环境
FROM ruby:2.7.0

# 将当前目录sources.list的文件拷贝到/etc/apt/
# 目的是更改加速源，因为默认用的国外的镜像
# 下载速度慢，甚至还会超时

# 这种写法只适用于Debian系列操作系统
ADD sources.list /etc/apt/sources.list

# 更新，并安装依赖，安装完成后删除缓存
RUN apt-get update -q && apt-get install -y ruby-dev zlib1g-dev && rm -rf /var/lib/apt/lists/*

#设置时区，有些版本系统不设置，不能自动自动识别
#RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# 创建一个code目录
RUN mkdir /code

# 切换工作目录到code目录
WORKDIR /code

# 将当前目录(Dockerfile文件所在目录)所有文件拷贝到code目录
ADD . /code

# run.sh更改为可执行
# 该脚本，会在编排文件中调用
RUN chmod 744 /code/run.sh

# 暴露那些端口，不能和其他镜像一样
# 这里暴露了两个端口，如果更多直接添加就行了
#一个是develop
#一个是production
EXPOSE 6000
EXPOSE 6010

# 安装依赖
RUN bundle install