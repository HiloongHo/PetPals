import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_avatar.dart';

class PetInfoForm extends StatefulWidget {
  const PetInfoForm({super.key});

  @override
  _PetInfoFormState createState() => _PetInfoFormState();
}

class _PetInfoFormState extends State<PetInfoForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _personalityController = TextEditingController();
  final TextEditingController _activitiesController = TextEditingController();
  final TextEditingController _healthController = TextEditingController();
  final TextEditingController _specialNeedsController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();

  DateTime? _birthday;
  String? _type;
  String? _gender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthday) {
      setState(() {
        _birthday = picked;
      });
    }
  }

  void _submitForm() {
    // 提交表单逻辑
    Get.to(() => AddAvatarPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Information',style: TextStyle(color: Color(0xFF5641EF)),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _type,
              items: ['Dog', 'Cat', 'Rabbit', 'Other'].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _type = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _breedController,
              decoration: const InputDecoration(
                labelText: 'Breed',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _gender,
              items: ['Male', 'Female'].map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Birthday',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(
                    text: _birthday != null
                        ? '${_birthday!.year}-${_birthday!.month}-${_birthday!.day}'
                        : '',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _personalityController,
              decoration: const InputDecoration(
                labelText: 'Personality Traits',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _activitiesController,
              decoration: const InputDecoration(
                labelText: 'Favorite Activities',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _healthController,
              decoration: const InputDecoration(
                labelText: 'Health Status',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _specialNeedsController,
              decoration: const InputDecoration(
                labelText: 'Special Needs',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _interestsController,
              decoration: const InputDecoration(
                labelText: 'Interests',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: OutlinedButton(
                onPressed: _submitForm,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF5641EF)),
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                ),
                child: const Text(
                  'Submit',
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
    );
  }
}
