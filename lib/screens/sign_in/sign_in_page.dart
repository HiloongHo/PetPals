import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home.dart';

// 登录界面
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignInPage> {
  // 控制用户名和密码输入框的文本控制器
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // 控制密码是否可见
  bool _isPasswordVisible = false;

  // 模拟的已注册用户列表
  final Map<String, String> _registeredUsers = {
    'test@example.com': 'password123',
    'user@example.com': 'password',
    'admin': 'password',
  };

  // 登录方法
  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (_registeredUsers.containsKey(username)) {
      if (_registeredUsers[username] == password) {
        _showDialog('Login Successful');
        // 跳转到主页
        Get.to(() => const HomePage());
      } else {
        _showDialog('Incorrect Password');
      }
    } else {
      _showDialog('No account found for this email');
    }
  }

  // 显示对话框方法
  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              // 应用名称
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: const Text(
                  'PetPals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFF5641EF),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // 用户名输入框
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                ),
              ),
              const SizedBox(height: 20),
              // 密码输入框
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // 登录按钮
              OutlinedButton(
                onPressed: _login,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF5641EF),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Facebook登录按钮
              OutlinedButton(
                onPressed: _login,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Sign In with Facebook',
                  style: TextStyle(
                    color: Color(0xFF5641EF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 忘记密码和帮助按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5641EF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '|',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5641EF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignInPage());
                    },
                    child: const Text(
                      'Help',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF5641EF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
