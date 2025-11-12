import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomeScreen extends StatelessWidget {
  final String indexNumber = "221070";

  final List<Exam> exams = [
    Exam(
      subject: "Мобилни информациски системи",
      dateTime: DateTime(2025, 12, 15, 10, 0),
      rooms: ["Амф-Г", "215"],
    ),
    Exam(
      subject: "Веб програмирање",
      dateTime: DateTime(2025, 11, 21, 18, 0),
      rooms: ["215", "117"],
    ),
    Exam(
      subject: "Бази на податоци",
      dateTime: DateTime(2025, 1, 20, 9, 0),
      rooms: ["322", "117"],
    ),
    Exam(
      subject: "Алгоритми и податочни структури",
      dateTime: DateTime(2025, 1, 22, 11, 0),
      rooms: ["200АБ"],
    ),
    Exam(
      subject: "Оперативни системи",
      dateTime: DateTime(2025, 1, 25, 10, 0),
      rooms: ["200АБ"],
    ),
    Exam(
      subject: "Вештачка интелигенција",
      dateTime: DateTime(2025, 11, 28, 14, 0),
      rooms: ["Амф-Г", "215"],
    ),
    Exam(
      subject: "Компјутерски мрежи",
      dateTime: DateTime(2025, 12, 19, 10, 0),
      rooms: ["215", "216"],
    ),
    Exam(
      subject: "Софтверско инженерство",
      dateTime: DateTime(2025, 12, 15, 12, 0),
      rooms: ["Амф-Г"],
    ),
    Exam(
      subject: "Дискретна математика",
      dateTime: DateTime(2024, 11, 6, 9, 0),
      rooms: ["322"],
    ),
    Exam(
      subject: "Веројатност и статистика",
      dateTime: DateTime(2025, 12, 8, 11, 0),
      rooms: ["Амф-МФ"],
    ),
    Exam(
      subject: "Мултимедијални технологии",
      dateTime: DateTime(2024, 2, 10, 12, 0),
      rooms: ["117", "215"],
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.assignment,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  "Вкупно испити: ${exams.length}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}