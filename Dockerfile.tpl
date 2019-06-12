from tomcat
MAINTAINER dxlzanjie@163.com
#icoreCOPY mdm8   /usr/local/tomcat/webapps/mdm8
COPY war /usr/local/tomcat/webapps/
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
