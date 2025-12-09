import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';
import 'package:couldai_user_app/widgets/lesson_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Flag Icon (Mock)
            Container(
              width: 32,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(child: Text('🇪🇸', style: TextStyle(fontSize: 16))),
            ),
            const SizedBox(width: 16),
            // Streak
            const Icon(Icons.local_fire_department, color: AppColors.red),
            const SizedBox(width: 4),
            const Text('2', style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold)),
            const Spacer(),
            // Gems
            const Icon(Icons.diamond, color: AppColors.blue),
            const SizedBox(width: 4),
            const Text('450', style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: AppColors.grey,
            height: 2.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          _buildUnitHeader('Unit 1', 'Intro to Spanish'),
          const SizedBox(height: 20),
          // Path of lessons
          const LessonButton(level: 1, status: LessonStatus.completed, alignment: 0),
          const LessonButton(level: 2, status: LessonStatus.completed, alignment: -0.5),
          const LessonButton(level: 3, status: LessonStatus.current, alignment: 0.5),
          const LessonButton(level: 4, status: LessonStatus.locked, alignment: 0),
          const LessonButton(level: 5, status: LessonStatus.locked, alignment: -0.5),
          const LessonButton(level: 6, status: LessonStatus.locked, alignment: 0.5),
          const SizedBox(height: 20),
          const Divider(thickness: 2, color: AppColors.grey),
          const SizedBox(height: 20),
          _buildUnitHeader('Unit 2', 'Greetings & Basics'),
          const SizedBox(height: 20),
          const LessonButton(level: 1, status: LessonStatus.locked, alignment: 0),
          const LessonButton(level: 2, status: LessonStatus.locked, alignment: -0.5),
          const LessonButton(level: 3, status: LessonStatus.locked, alignment: 0.5),
        ],
      ),
    );
  }

  Widget _buildUnitHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const Icon(Icons.menu_book, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
