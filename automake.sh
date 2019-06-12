#!/bin/bash
path=$(cd $(dirname $0); pwd)
echo "执行目录: $path"
if [ $# -gt 0 ]
then
    version=$1
    echo "设置镜像的版本为:$version"
else
    echo "请输入镜像版本，eg: automake.sh v1"
    exit 8;
fi

wars=("bpm" "esbmule" "ireport" "mdmclean" "mdmdc" "query" "static" "engine" "iconsole" "icore" "mdmcode" "module" "timers")
echo "将处理以下文件：${wars[@]}"
echo "登录阿里云……"
#docker login --username=******** --password=********* registry.cn-hangzhou.aliyuncs.com
for war in ${wars[@]}
do
    echo "开始处理文件 $war.war"
    if [ -f "$war.war" ]; then
        echo "复制生成 Dockerfile.$war"
        cp Dockerfile.tpl "Dockerfile.$war" 
        sed -i s/war/"$war.war"/g "Dockerfile.$war"
        if [ $war == "icore" ]; then
            sed -i s/\#icore/""/g "Dockerfile.$war"
        fi
        echo "Dockerfile.$war 生成完毕，开始制作镜像"
        docker build -f  "Dockerfile.$war" -t $war:$version .
        echo "制作镜像完成，开始上传至阿里云……"
        docker tag $war:$version registry.cn-hangzhou.aliyuncs.com/mdm8/$war:$version
        docker push registry.cn-hangzhou.aliyuncs.com/mdm8/$war:$version
        echo "$war:$version 镜像制作上传到阿里云成功" 
    else 
        echo "$war.war 文件不存在"
        continue;
    fi
done


