说明：
1.新建一个目录autoDeploy与tomcat目录放在同级目录下
　　(1)autoDeploy.sh放在autoDeploy目录下
　　(2)需要部署的test.war放在autoDeploy目录下(test.war为需要部署的到tomcat上的war包)
2.tomcatPath=tomcat-7（指定tomcat文件目录名称，tomcat-7改为自己tomcat的目录名称）
3.执行autoDepoy.sh即可实现自动部署
　　新建的autoDepoy.sh若没有执行权限，需要执行：chmod +x autoDeploy.sh


#! /bin/sh
echo '####################开始自动部署####################'
path=`pwd` #当前路径
tomcatPath=tomcat-7 #指定tomcat文件目录名称
cd ../$tomcatPath/bin #进入tomcat的bin目录
PID=$(ps -fu `whoami`|grep tomcat|grep -v grep|awk '{print $2}')
if [ -z "$PID" ];then
 echo "no tomcat process"
else
./shutdown.sh #停止tomcat服务
fi
sleep 1 #休眠1s
cd ../webapps #进入tomcat的webapps目录
rm -fr test #删除test文件目录
mv test.war test.war.$(date +%Y%m%d) #备份webapps下的test16 cp $path/test.war ./ #复制test.war到webapps路径下
sleep 1 #休眠1s
cd ../bin
./startup.sh #启动tomcat服务
echo '####################部署结束####################'
关停脚本stop.sh
PID=`ps -ef | grep sms-2.0.jar | grep -v grep | awk '{print $2}'`
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    echo kill $PID
    kill -9 $PID
fi

重启脚本run.sh
echo stop application
source stop.sh
echo start application
source start.sh
