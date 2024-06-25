import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'get_start_view_singles.dart';

// 注册选择性别界面
class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String _selectedGender = '';

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  Widget _buildGenderOption(String gender, IconData icon) {
    bool isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () => _selectGender(gender),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF5641EF) : Colors.grey,
            width: isSelected ? 18 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? const Color(0xFF5641EF) : Colors.transparent,
        ),
        child: Column(
          children: [
            Icon(icon, size: 50, color: isSelected ? Colors.white : const Color(0xFF5641EF)),
            const SizedBox(height: 10),
            Text(
              gender,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF5641EF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selection Required"),
          content: Text("Please select a gender before proceeding."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 20,),
              const Center(
                child: Text(
                  'Basic Information Registration',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "I'm a",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderOption('Male', Icons.male),
                  _buildGenderOption('Female', Icons.female),
                  _buildGenderOption('Other', Icons.transgender),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    if (_selectedGender.isNotEmpty) {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => RegistrationScreen2()),
                      // );
                      Get.to(() => RegistrationScreen2());
                    } else {
                      _showAlertDialog(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFF5641EF)),
                    minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
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
