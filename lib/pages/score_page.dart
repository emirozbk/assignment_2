import 'package:flutter/material.dart';
import 'package:quiz_app/pages/question_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  const ScorePage({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(),
          const SizedBox(height: 12),
          _buildScore(),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionPage()),
                  (route) => false);
            },
            child: const Text(
              "Restart the Game",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Center _buildScore() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your Score: ",
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            " $score",
            style: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  Text _buildTitle() {
    return const Text(
      "CONGRATULATIONS ! ",
      style: TextStyle(
        fontSize: 28,
      ),
    );
  }
}
