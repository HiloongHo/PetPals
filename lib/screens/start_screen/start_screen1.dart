import 'dart:async';                                // 导入Dart的async包，用于定时器
import 'package:flutter/material.dart';              // 导入Flutter的Material包，提供了一系列UI组件
import 'package:pet_pals/screens/start_screen/start_screen2.dart';  // 导入下一个启动页面
import 'package:get/get.dart';                       // 导入Get包，用于状态管理和路由管理


//创建一个启动界面，显示PetPals文字和一个圆形进度指示器，并在启动后延迟2秒后跳转到下一个启动页面StartScreen2。
class StartScreen1 extends StatefulWidget {        // StartScreen1类，继承自StatefulWidget
  const StartScreen1({Key? key});                   // 构造函数

  @override
  _StartScreen1State createState() => _StartScreen1State(); // 创建状态对象
}

class _StartScreen1State extends State<StartScreen1> {  // _StartScreen1State类，继承自State类
  @override
  void initState() {                                   // 初始化状态方法
    super.initState();                                 // 调用父类的initState方法
    // 在 2 秒后跳转到主屏幕
    Timer(const Duration(seconds: 2), () {            // 创建定时器，2秒后执行
      Get.offAll(() => const StartScreen2());         // 跳转到下一个启动页面StartScreen2
    });
  }

  @override
  Widget build(BuildContext context) {                // 重写build方法
    return const Scaffold(                            // 返回一个Scaffold小部件
      backgroundColor: Color(0xFF5641EF),             // 设置背景色为浅蓝色
      body: Center(                                   // 将子部件居中
        child: Column(                                // 列布局
          mainAxisAlignment: MainAxisAlignment.center, // 主轴居中对齐
          children: <Widget>[                         // 子部件列表
            // 这里放置应用程序 Logo
            // Image.asset('assets/logo.png', width: 150, height: 150),
            // SizedBox(height: 20),
            Text(
              'PetPals',                             // 显示文字PetPals
              style: TextStyle(                      // 文字样式
                fontSize: 100,                        // 字体大小100
                fontWeight: FontWeight.bold,          // 字体粗细为粗体
                fontFamily: 'IndieFlower',           // 字体为IndieFlower
                color: Colors.white,                  // 字体颜色为白色
              ),
            ),
            SizedBox(height: 10),                    // 添加高度为10的空白部件
            SizedBox(                                  // 限定宽高的容器
              height: 60,                             // 高度60
              width: 60,                              // 宽度60
              child: CircularProgressIndicator(     // 圆形进度指示器
                color: Colors.white,                  // 指示器颜色为白色
                backgroundColor: Colors.black12,      // 背景颜色为黑色12
              ),
            ),
          ],
        ),
      ),
    );
  }
}
