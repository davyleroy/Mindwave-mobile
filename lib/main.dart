// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/auth_service.dart';
import 'widgets/spalashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: authService.currentUser != null ? HomePage() : SplashScreen(),
    );
  }
}

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
              color: isSelected ? Colors.white : Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentCard extends StatefulWidget {
  final Content content;

  const ContentCard({Key? key, required this.content}) : super(key: key);

  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  bool isFavorite = false;
  bool isSelected = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
          _timer = Timer(Duration(seconds: 2), () {
            setState(() {
              isSelected = false;
            });
          });
        });
      },
      child: Stack(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.content.imageUrl,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: FavoriteButton(
                        isFavorite: isFavorite,
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.content.duration} min, ${widget.content.level}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.content.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Text(
                              ' ${widget.content.rating} ${widget.content.author}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned.fill(
              child: Container(
                color: Color.fromARGB(255, 2, 57, 153).withOpacity(0.8),
                child: Center(
                  child: Text(
                    'Read More ...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onPressed;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }
}

class Content {
  final String imageUrl;
  final String title;
  final String duration;
  final String level;
  final double rating;
  final String author;

  Content({
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.level,
    required this.rating,
    required this.author,
  });
}

Future<List<Content>> fetchCuratedContent(String mood) async {
  // Simulating a delay for demonstration purposes
  await Future.delayed(Duration(seconds: 2));

  // Replace this with your actual logic to fetch curated content based on the mood
  return [
    Content(
      imageUrl: 'assets/nature.jpg',
      title: 'Abundance Guided Practice',
      duration: '12',
      level: 'Intermediate',
      rating: 4.5,
      author: 'Scott & Shanice',
    ),
    Content(
      imageUrl: 'assets/nature2.png',
      title: 'Mindfulness Meditation',
      duration: '20',
      level: 'Beginner',
      rating: 4.2,
      author: 'Sarah Johnson',
    ),
    Content(
      imageUrl: 'assets/insight.png',
      title: 'Self-awareness Assessment',
      duration: '25',
      level: 'Intermediate',
      rating: 4.7,
      author: 'Bruce Wayne',
    )
  ];
}
