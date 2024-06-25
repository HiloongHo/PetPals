import 'package:flutter/material.dart';  // 导入Flutter的Material包，提供了一系列UI组件
import 'package:flutter/services.dart';   // 导入Flutter的Services包，用于控制系统UI
import 'package:get/get.dart';            // 导入Get包，用于状态管理和路由管理
import 'package:pet_pals/screens/start_screen/start_screen1.dart'; // 导入应用程序的启动页面

void main() {
  runApp(const MyApp());                // 启动Flutter应用程序
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark); // 设置系统UI风格为深色
}

class MyApp extends StatelessWidget { // MyApp类，继承自StatelessWidget
  const MyApp({Key? key}) : super(key: key);  // 构造函数

  @override
  Widget build(BuildContext context) { // 重写build方法
    return GetMaterialApp(              // 返回一个GetMaterialApp小部件
      debugShowCheckedModeBanner: false,  // 设置不显示debug标志
      theme: ThemeData(                   // 设置主题数据
        useMaterial3: true,               // 使用Material3主题
      ),
      home: const StartScreen1(),              // 设置应用程序的初始页面为StartScreen1
    );
  }
}
