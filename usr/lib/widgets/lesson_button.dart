import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';

enum LessonStatus { completed, current, locked }

class LessonButton extends StatelessWidget {
  final int level;
  final LessonStatus status;
  final double alignment; // -1.0 (left) to 1.0 (right)

  const LessonButton({
    super.key,
    required this.level,
    required this.status,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    Color shadowColor;
    IconData icon;
    double iconOpacity = 1.0;

    switch (status) {
      case LessonStatus.completed:
        color = AppColors.yellow;
        shadowColor = AppColors.yellowShadow;
        icon = Icons.check;
        break;
      case LessonStatus.current:
        color = AppColors.green;
        shadowColor = AppColors.greenShadow;
        icon = Icons.star;
        break;
      case LessonStatus.locked:
        color = AppColors.grey;
        shadowColor = AppColors.greyShadow;
        icon = Icons.lock;
        iconOpacity = 0.5;
        break;
    }

    return Align(
      alignment: Alignment(alignment, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: GestureDetector(
          onTap: status == LessonStatus.locked
              ? null
              : () {
                  Navigator.pushNamed(context, '/lesson');
                },
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      offset: const Offset(0, 6),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white.withOpacity(iconOpacity),
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
