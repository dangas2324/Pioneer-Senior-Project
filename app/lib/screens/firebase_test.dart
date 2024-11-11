import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseTest extends StatefulWidget {
  const FirebaseTest({super.key});

  @override
  _FirebaseTestState createState() => _FirebaseTestState();
}

class _FirebaseTestState extends State<FirebaseTest> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final CollectionReference users = FirebaseFirestore.instance.collection('users');

  // To store fetched user data
  List<Map<String, dynamic>> _userData = [];

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchData();
  }

  // Add data to Firestore
  Future<void> addData() async {
    try {
      await users.add({
        'name': _nameController.text,
        'age': int.tryParse(_ageController.text) ?? 0,
        'email': _emailController.text,
      });
      _nameController.clear();
      _ageController.clear();
      _emailController.clear();
      // Fetch updated data
      fetchData();
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  // Retrieve data from Firestore
  Future<void> fetchData() async {
    try {
      QuerySnapshot snapshot = await users.get();
      setState(() {
        _userData = snapshot.docs
            .map((doc) => {
                  'name': doc['name'],
                  'age': doc['age'],
                  'email': doc['email'],
                })
            .toList();
      });
    } catch (e) {
      print('Error retrieving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left side: Form to add local data
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Enter Data Locally', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    onPressed: addData,
                    child: const Text('Add Data to Firestore'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchData,
                    child: const Text('Get Data from Firestore'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Right side: Display data from Firestore
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Firestore Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _userData.length,
                      itemBuilder: (context, index) {
                        final user = _userData[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            title: Text(user['name']),
                            subtitle: Text('Age: ${user['age']}\nEmail: ${user['email']}'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}