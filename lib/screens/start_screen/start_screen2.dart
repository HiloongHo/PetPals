import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_pals/screens/sign_in/sign_in_page.dart';
import '../sign_up/gender_selection_Screen.dart';

// 启动的第一个界面
class StartScreen2 extends StatefulWidget {
  const StartScreen2({Key? key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<StartScreen2> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // 这里应该添加登录验证逻辑，这里只是一个示例
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'admin' && password == 'password') {
      _showDialog('Login Successful');
    } else {
      _showDialog('Login Failed');
    }
  }

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
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background_dog.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 50.0,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PetPals',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'IndieFlower',
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: Text(
                      'PetPals is a social dating app designed specifically for pet lovers. It aims to help pet owners find like-minded friends, share the joy of raising pets, and participate in various pet-related activities and discussions. Whether you are a cat lover, a dog owner, or a keen bird or fish farmer, PetPals is the ideal community for you and your pets.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const GenderSelectionScreen());
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFF5641EF)),
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                        ),
                        child: const Text(
                          'Sign in with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16, color: Colors.white60),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignInPage());
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
