import 'package:flutter/material.dart';
import 'package:quiz_app/dummy/questions.dart';
import 'package:quiz_app/pages/score_page.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _currentQuestionIndex = 0;
  int _selectedOption = -1;
  int _currentPoint = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            _buildQuestionText(),
            const SizedBox(height: 20.0),
            _buildOptions(),
            const SizedBox(height: 20.0),
            _buildNextButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    bool isLastQuestion =
        _currentQuestionIndex == DummyData().questions.length - 1;
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: _selectedOption == -1
            ? null
            : () => clickContinueButton(isLastQuestion),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child:
              isLastQuestion ? const Text("Complete") : const Text('Continue'),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: DummyData().questions[_currentQuestionIndex].options.length,
        itemBuilder: (BuildContext context, int optionIndex) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 52,
            child: OutlinedButton(
              onPressed: _selectedOption == -1
                  ? () => clickOptionButton(optionIndex)
                  : null,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: _getBackgroundColor(optionIndex),
              ),
              child: Center(
                child: Text(
                  DummyData()
                      .questions[_currentQuestionIndex]
                      .options[optionIndex],
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Text _buildQuestionText() {
    return Text(
      DummyData().questions[_currentQuestionIndex].question,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Color? _getBackgroundColor(int index) {
    if (DummyData().questions[_currentQuestionIndex].answerIndex == index &&
        _selectedOption != -1) {
      return Colors.blue;
    }
    if (_selectedOption == index &&
        _selectedOption ==
            DummyData().questions[_currentQuestionIndex].answerIndex) {
      return Colors.blue;
    }
    if (_selectedOption !=
        DummyData().questions[_currentQuestionIndex].answerIndex) {
      Colors.blue;
    }
    if (_selectedOption == index) {
      return Colors.red;
    }
    return null;
  }

  void clickContinueButton(bool isLastQuestion) {
    if (isLastQuestion) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ScorePage(score: _currentPoint),
          ),
          (route) => false);
      return;
    }
    setState(() {
      _currentQuestionIndex++;
      _selectedOption = -1;
    });
  }

  void clickOptionButton(int optionIndex) {
    setState(() {
      _selectedOption = optionIndex;
      if (_selectedOption ==
          DummyData().questions[_currentQuestionIndex].answerIndex) {
        _currentPoint += 10;
      }
    });
  }
}
