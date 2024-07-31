import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMood = '😄';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Michael',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'How are you feeling ?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMoodButton('😄', isSelected: selectedMood == '😄'),
                    _buildMoodButton('🙂', isSelected: selectedMood == '🙂'),
                    _buildMoodButton('😐', isSelected: selectedMood == '😐'),
                    _buildMoodButton('🙁', isSelected: selectedMood == '🙁'),
                    _buildMoodButton('😞', isSelected: selectedMood == '😞'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'For your mood',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                FutureBuilder<List<Content>>(
                  future: fetchCuratedContent(selectedMood),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ContentCard(content: snapshot.data![index]);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = emoji;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color:
              isSelected ? Color.fromARGB(255, 0, 33, 132) : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 0, 33, 132)
                : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            emoji,
            style: TextStyle(
              fontSize: 24,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final Content content;

  ContentCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(content.imageUrl),
        title: Text(content.title),
        subtitle: Text(content.subtitle),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle navigation to content details
        },
      ),
    );
  }
}

Future<List<Content>> fetchCuratedContent(String mood) async {
  // Replace this with your actual API call logic
  await Future.delayed(Duration(seconds: 2));
  return [
    Content(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Content Title 1',
      subtitle: 'Subtitle 1',
    ),
    Content(
      imageUrl: 'https://via.placeholder.com/150',
      title: 'Content Title 2',
      subtitle: 'Subtitle 2',
    ),
  ];
}

class Content {
  final String imageUrl;
  final String title;
  final String subtitle;

  Content({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}