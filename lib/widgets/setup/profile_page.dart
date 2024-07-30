import 'package:flutter/material.dart';

import '../../main.dart';
import '../spalashscreen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            leading: Container(),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ); // Close functionality
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: ProfileHeader(
              name: 'Michael John',
              avatarImage: AssetImage('assets/avatar1.png'),
              avatarEmoji: '',
              AssetImage: 'assets/avatar1.png',
            ),
          ),
          SliverToBoxAdapter(
            child: FriendsSection(
              friends: [
                Friend(name: 'Leila', avatarEmoji: '🧕'),
                Friend(name: 'Uwase', avatarEmoji: '🙋🏾‍♀️'),
                Friend(name: 'Alex', avatarEmoji: '🙂'),
                Friend(name: 'Sandra', avatarEmoji: '🙋🏽‍♀️'),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: GroupsSection(
              groups: [
                Group(
                    name: 'Deep sleep',
                    icon: Icons.nights_stay,
                    memberCount: 1500,
                    isPublic: true),
                Group(name: 'Relaxation sleep', icon: Icons.star),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('LOGOUT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD3D3D3),
                    foregroundColor: Colors.red,
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String name;
  final String avatarEmoji;

  ProfileHeader(
      {super.key,
      required this.name,
      required this.avatarEmoji,
      required String AssetImage,
      required AssetImage avatarImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: Text(avatarEmoji, style: TextStyle(fontSize: 40)),
        ),
        SizedBox(height: 8),
        Text(name, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 8),
        ElevatedButton(
          child: Text('EDIT PROFILE'),
          onPressed: () {
            // Edit profile functionality
          },
        ),
      ],
    );
  }
}

class FriendsSection extends StatelessWidget {
  final List<Friend> friends;

  FriendsSection({super.key, required this.friends});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Friends', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                friends.map((friend) => FriendAvatar(friend: friend)).toList(),
          ),
        ],
      ),
    );
  }
}

class FriendAvatar extends StatelessWidget {
  final Friend friend;

  FriendAvatar({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(child: Text(friend.avatarEmoji)),
        SizedBox(height: 4),
        Text(friend.name, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class GroupsSection extends StatelessWidget {
  final List<Group> groups;

  GroupsSection({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Groups', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 8),
          ...groups.map((group) => GroupListTile(group: group)).toList(),
        ],
      ),
    );
  }
}

class GroupListTile extends StatelessWidget {
  final Group group;

  GroupListTile({super.key, required this.group});

  get borderRadius => null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: group.name == 'Deep sleep' ? Colors.transparent : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(group.icon, color: Colors.white),
      ),
      title: Text(group.name),
      subtitle: group.isPublic
          ? Text('Public • ${group.memberCount / 1000}k members')
          : null,
    );
  }
}

class Friend {
  final String name;
  final String avatarEmoji;

  Friend({required this.name, required this.avatarEmoji});
}

class Group {
  final String name;
  final IconData icon;
  final int memberCount;
  final bool isPublic;

  Group(
      {required this.name,
      required this.icon,
      this.memberCount = 0,
      this.isPublic = false});
}
