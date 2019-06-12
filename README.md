# automakdockerimages
自动制作docker镜像并上传阿里云脚本说明：

1、需要提前在阿里云上创建好”bpm” “esbmule” “ireport” “mdmclean” “mdmdc” “query” “static” “engine” “iconsole” “icore” “mdmcode” “module” “timers” 的镜像仓库，并修改脚本对应的阿里云登陆信息及仓库信息：
2、上传需要制作镜像的war包到服务器上；
3、上传automake.sh 、Dockerfile.tpl文件到war包存放的目录；
4、./automake.sh 执行命令，等待制作完成；
