import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:app/screens/screens.dart';

class WordSelection extends StatelessWidget {
  const WordSelection({super.key});

  Future<void> _syncWords() async {
    try {
      // Get all unsynced words
      QuerySnapshot unsyncedWords = await FirebaseFirestore.instance
          .collection('words')
          .where('isSynced', isEqualTo: false)
          .get();

      // Update each word to be synced
      WriteBatch batch = FirebaseFirestore.instance.batch();
      
      for (var doc in unsyncedWords.docs) {
        batch.update(doc.reference, {'isSynced': true});
      }

      await batch.commit();
    } catch (e) {
      print('Error syncing words: $e');
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
        title: const Text(
          'Words',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF07394B),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync, color: Colors.white),
            onPressed: _syncWords,
          ),
          const Menu(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search words...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // TODO: Implement search functionality
                },
              ),
            ),
            const SizedBox(height: 20),
            // Sync Status
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('words')
                  .where('isSynced', isEqualTo: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '${snapshot.data!.docs.length} words need to be synced',
                      style: const TextStyle(color: Colors.orange),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            // Word List
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('words')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No words found'));
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final doc = snapshot.data!.docs[index];
                      final data = doc.data() as Map<String, dynamic>;
                      
                      return WordButton(
                        id: doc.id,
                        ipaWord: data['ipaWord'] ?? '',
                        translatedWord: data['tradeWord'] ?? '',
                        isSynced: data['isSynced'] ?? false,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSelect(),
    );
  }
}

class WordButton extends StatelessWidget {
  final String id;
  final String ipaWord;
  final String translatedWord;
  final bool isSynced;

  const WordButton({
    super.key,
    required this.id,
    required this.ipaWord,
    required this.translatedWord,
    required this.isSynced,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/view',
            arguments: {
              'id': id,
              'ipaWord': ipaWord,
              'tradeWord': translatedWord,
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF095A6D),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ipaWord,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      if (!isSynced) 
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.sync_problem,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ),
                    ],
                  ),
                  Text(
                    translatedWord,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.white),
                  onPressed: () {
                    // TODO: Implement audio functionality
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFFF9BAA5)),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: {
                        'id': id,
                        'ipaWord': ipaWord,
                        'tradeWord': translatedWord,
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}