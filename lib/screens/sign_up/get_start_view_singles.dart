import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pet_pals/screens/sign_up/registration_name_birthday.dart';

// 注册账号界面
class RegistrationScreen2 extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // 是否显示密码
  bool _agreedToTerms = false;

  final List<String> _registeredEmails = [
    'test@example.com',
    'user@example.com',
  ];

  final Map<String, String> _userCredentials = {};

  void _toggleAgreement(bool? value) {
    setState(() {
      _agreedToTerms = value ?? false;
    });
  }

  void _register() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showDialog('Please enter both email and password.');
      return;
    }

    if (_agreedToTerms) {
      if (_registeredEmails.contains(email)) {
        _showDialog('The email address is already registered.');
      } else {
        // Save the email and password
        _registeredEmails.add(email);
        _userCredentials[email] = password;

        // Print the email and password to the console
        print('Registered Email: $email');
        print('Registered Password: $password');

        // 显示注册成功对话框
        _showDialog('Registration successful.');

        // 导航到下一个页面
        Get.to(() => RegistrationNameBirthday());
      }
    } else {
      // 显示提示信息要求用户同意条款
      _showDialog('Please agree to the terms and conditions.');
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Status'),
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'PetPals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                    color: Color(0xFF5641EF),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // 根据状态控制密码是否可见
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible; // 切换密码可见状态
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'By registering, you agree to our terms and conditions.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    onChanged: _toggleAgreement,
                  ),
                  const Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: _register,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF5641EF)),
                    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)), // 设置按钮的最小尺寸
                  ),
                  child: const Text(
                    'View Singles',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}