import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('HH:mm');

    final cardColor = exam.isPast
        ? Colors.grey[300]
        : Colors.blue[50];

    final borderColor = exam.isPast
        ? Colors.grey[400]!
        : Colors.green;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 4,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: borderColor, width: 2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExamDetailScreen(exam: exam),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Icon(
                    exam.isPast ? Icons.check_circle : Icons.school,
                    color: exam.isPast ? Colors.grey[600] : Colors.green,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exam.subject,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: exam.isPast ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),


              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.blue,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    dateFormat.format(exam.dateTime),
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPast ? Colors.grey[700] : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),


              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeFormat.format(exam.dateTime),
                    style: TextStyle(
                      fontSize: 16,
                      color: exam.isPast ? Colors.grey[700] : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  Icon(
                    Icons.room,
                    size: 18,
                    color: exam.isPast ? Colors.grey[600] : Colors.green,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(", "),
                      style: TextStyle(
                        fontSize: 16,
                        color: exam.isPast ? Colors.grey[700] : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              if (exam.isPast)
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Поминат",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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