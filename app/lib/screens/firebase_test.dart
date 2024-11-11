import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// All logging should be removed after dry run presentation
class FirebaseTest extends StatefulWidget {
  const FirebaseTest({super.key});

  @override //Create instance of this page for database testing
  FirebaseTestState createState() => FirebaseTestState();
}

class FirebaseTestState extends State<FirebaseTest> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<Map<String, dynamic>> _userData = []; //How data is referenced
  bool _isLoading = false; //If the adding data is taking a while, a loading img will replace the button

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the app starts
  }

  //Add the data to the database
  Future<void> addData() async {
    final name = _nameController.text;
    final age = int.tryParse(_ageController.text) ?? 0;
    final email = _emailController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      //print('Adding new data: name=$name, age=$age, email=$email');      // Log before adding new data

      // Retrieve the current data to append new data to it
      await _loadData();
      final newUser = {'name': name, 'age': age, 'email': email};
      _userData.add(newUser);

      //print('Data to save: $_userData');      // Log the data before saving it

      // Save updated data
      await _saveData();

      // Clear input fields
      _nameController.clear();
      _ageController.clear();
      _emailController.clear();

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = jsonEncode(_userData);

    //print('Saving data to SharedPreferences: $userDataJson');    // Log before saving

    await prefs.setString('userData', userDataJson); //Stores JSON data under 'userData' section

    //print('Data saved successfully');    // Log after saving
  }

  //Loads all data from local storage
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataJson = prefs.getString('userData');
    if (userDataJson != null) {
      //print('Data loaded from SharedPreferences: $userDataJson');      // Log when data is loaded successfully

      setState(() {
        _userData = List<Map<String, dynamic>>.from(jsonDecode(userDataJson));
      });
    } else {
      //print('No data found in SharedPreferences');      // Log if no data is found in SharedPreferences (will happen after each flutter run)

      setState(() {
        _userData = [];
      });
    }
  }

  // Remove all local data 
  Future<void> removeAllLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userData');
    setState(() {
      _userData = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Firebase Test (Local Storage)'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter Data Locally',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : addData,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Add Data to Local Storage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: removeAllLocalData,
              child: const Text('Remove All Local Data'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Local Storage Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _userData.isEmpty
                      ? const Center(child: Text('No data available.'))
                      : ListView.builder(
                          itemCount: _userData.length,
                          itemBuilder: (context, index) {
                            final user = _userData[index];

                            //print( //Log the user data that is being displayed
                                //'Displaying user data: ${user['name']}, ${user['age']}, ${user['email']}'); 

                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                title: Text(user['name']),
                                subtitle: Text(
                                    'Age: ${user['age']}\nEmail: ${user['email']}'),
                              ),
                            );
                          },
                        ),
            ),

          ],
        ),
      ),
    );
  }
}