import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: index < 3 ? AppColors.yellow : AppColors.grey,
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
            ),
            title: Text('User ${index + 1}'),
            trailing: Text('${1000 - (index * 50)} XP'),
          );
        },
      ),
    );
  }
}
