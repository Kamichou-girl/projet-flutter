import 'package:flutter/material.dart';

class Language {
  final String name;
  final String flagUrl;

  Language({required this.name, required this.flagUrl});
}

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key, required Null Function(dynamic language) onLanguageSelected}) : super(key: key);

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  final List<Language> _languages = [
    Language(name: 'English', flagUrl: 'https://flagcdn.com/48x36/us.png'),
    Language(name: 'French', flagUrl: 'https://flagcdn.com/48x36/fr.png'),
    Language(name: 'Spanish', flagUrl: 'https://flagcdn.com/48x36/es.png'),
    Language(name: 'Vietnamese', flagUrl: 'https://flagcdn.com/48x36/vn.png'),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredLanguages = _languages.where((lang) =>
        lang.name.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Language',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search Language',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: filteredLanguages.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade200,
              ),
              itemBuilder: (context, index) {
                final lang = filteredLanguages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(lang.flagUrl),
                  ),
                  title: Text(lang.name, style: const TextStyle(fontSize: 16)),
                  onTap: () {
                    // Appel unique pour retourner la langue sélectionnée
                    Navigator.pop(context, lang.name);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
