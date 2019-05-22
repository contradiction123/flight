# flight

idea 乱码以及启动tomcat乱码处理<br>
找到idea的安装目录下找到idea.exe.vmoptions以及idea64.exe.vmoptions，用文本编辑器打开，在每个文件的最后加入

-Dfile.encoding=UTF-8