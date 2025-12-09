import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int _currentQuestionIndex = 0;
  double _progress = 0.1;
  int? _selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you say "Hello"?',
      'options': ['Hola', 'Adios', 'Por favor', 'Gracias'],
      'answer': 0,
    },
    {
      'question': 'Translate "The apple"',
      'options': ['La leche', 'El pan', 'La manzana', 'El agua'],
      'answer': 2,
    },
  ];

  void _checkAnswer() {
    if (_selectedOption == null) return;

    bool isCorrect = _selectedOption == _questions[_currentQuestionIndex]['answer'];

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isCorrect ? const Color(0xFFD7FFB8) : const Color(0xFFFFDFE0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? AppColors.green : AppColors.red,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Text(
                  isCorrect ? 'Excellent!' : 'Incorrect',
                  style: TextStyle(
                    color: isCorrect ? AppColors.green : AppColors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close modal
                  if (isCorrect) {
                    if (_currentQuestionIndex < _questions.length - 1) {
                      setState(() {
                        _currentQuestionIndex++;
                        _progress += 0.4;
                        _selectedOption = null;
                      });
                    } else {
                      Navigator.pop(context); // Finish lesson
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCorrect ? AppColors.green : AppColors.red,
                  elevation: 0,
                ),
                child: const Text('CONTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: _progress,
            minHeight: 16,
            backgroundColor: AppColors.grey,
            color: AppColors.green,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: AppColors.red),
                const SizedBox(width: 4),
                const Text('5', style: TextStyle(color: AppColors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select the correct translation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.volume_up, color: AppColors.blue),
                  const SizedBox(width: 16),
                  Text(
                    question['question'],
                    style: const TextStyle(fontSize: 18, color: AppColors.textDark),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: (question['options'] as List).length,
                itemBuilder: (context, index) {
                  final option = question['options'][index];
                  final isSelected = _selectedOption == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedOption = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.blue.withOpacity(0.1) : Colors.white,
                        border: Border.all(
                          color: isSelected ? AppColors.blue : AppColors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected ? AppColors.blueShadow : AppColors.greyShadow,
                            offset: const Offset(0, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? AppColors.blue : AppColors.textDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedOption == null ? null : _checkAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedOption == null ? AppColors.grey : AppColors.green,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('CHECK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
