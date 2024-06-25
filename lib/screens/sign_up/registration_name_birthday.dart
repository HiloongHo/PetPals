import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_pals/screens/sign_up/sign_up_welcome.dart';

import '../../location_selection.dart';

class RegistrationNameBirthday extends StatefulWidget {
  const RegistrationNameBirthday({super.key});

  @override
  _RegistrationNameBirthdayState createState() {
    return _RegistrationNameBirthdayState();
  }
}

class _RegistrationNameBirthdayState extends State<RegistrationNameBirthday> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String _selectedLocation = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _register() {
    // 获取名字
    String name = _nameController.text.trim();
    // 导航到下一个页面
    Get.to(() => SignUpWelcome(name: name));
  }

  void _selectLocation() {
    // Get.to(() => LocationSelectionPage())?.then((selectedLocation) {
    //   if (selectedLocation != null) {
    //     setState(() {
    //       _selectedLocation = selectedLocation;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 子组件左对齐
          children: [
            const Text(
              'First Name & Birthday',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 40,),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Birth',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: _selectedDate != null
                        ? '${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}'
                        : '',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _selectLocation,
              child: AbsorbPointer(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                    suffixIcon: Icon(Icons.location_on),
                  ),
                  controller: TextEditingController(
                    text: _selectedLocation.isNotEmpty ? _selectedLocation : 'Select Location',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            OutlinedButton(
              onPressed: _register,
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
          ],
        ),
      ),
    );
  }
}
