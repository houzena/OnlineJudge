## OnlineJudge Web   
主要技术：Bootstrap+Jsp/Servlet+Mysql+ActiveMQ
描 述：由 Web+判题程序组成
* web 采用 mvc 模式，dao 层使用 dbutils，还添加了 Filter 过滤不安全字符
* 判题程序主要由 java 写，监控待评测程序 CPU 时间和使用内存则由 c 程序（linux）完成，使用 jni 连接两
个程序。另判题程序还可以放到其它服务器上，使用 ActiveMQ 通信 
> 未完待续  
