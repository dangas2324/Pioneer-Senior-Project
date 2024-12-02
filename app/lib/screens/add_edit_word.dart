import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEditWord extends StatefulWidget {
  final String? id;
  final String? initialIpaWord;
  final String? initialTradeWord;

  const AddEditWord({
    Key? key,
    this.id,
    this.initialIpaWord,
    this.initialTradeWord,
  }) : super(key: key);

  @override
  State<AddEditWord> createState() => _AddEditWordState();
}

class _AddEditWordState extends State<AddEditWord> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _ipaController;
  late TextEditingController _tradeController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _ipaController = TextEditingController(text: widget.initialIpaWord);
    _tradeController = TextEditingController(text: widget.initialTradeWord);
  }

  @override
  void dispose() {
    _ipaController.dispose();
    _tradeController.dispose();
    super.dispose();
  }

  Future<void> _saveWord() async {
    if (_formKey.currentState!.validate()) {
      try {
        final wordData = {
          'ipaWord': _ipaController.text,
          'tradeWord': _tradeController.text,
          'createdAt': FieldValue.serverTimestamp(),
          'isSynced': true,
        };

        if (widget.id == null) {
          // Adding new word - Firestore will generate the ID
          await _firestore.collection('words').add(wordData);
        } else {
          // Updating existing word
          await _firestore.collection('words').doc(widget.id).update(wordData);
        }
        
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving word: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.id == null ? 'Add Word' : 'Edit Word',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF07394B),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _ipaController,
                  decoration: const InputDecoration(
                    labelText: 'Vernacular/IPA',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the IPA word';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _tradeController,
                  decoration: const InputDecoration(
                    labelText: 'Trade Language',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the trade word';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveWord,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006D77),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}