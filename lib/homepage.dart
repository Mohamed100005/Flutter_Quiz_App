import 'package:flutter/material.dart';
import 'color.dart';
import 'controllers.dart';
import 'exam.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark3,
        title: const Text(
          "quiz app",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Please! add questions & answer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: const TextStyle(color: dark1),
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Question',
                    prefixIcon: Icon(Icons.question_mark),
                    border: OutlineInputBorder()),
                controller: question,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: const TextStyle(color: dark1),
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Answer',
                    prefixIcon: Icon(Icons.question_answer),
                    border: OutlineInputBorder()),
                controller: answer,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
                color: dark3,
                textColor: bright1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 120,
                height: 50,
                onPressed: () {
                  List<dynamic> d = [question.text, answer.text];
                  data.add(d);
                  qCounter++;
                  setState(() {
                    question.clear();
                    answer.clear();
                  });
                },
                child: const Text(
                  "add",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: dark3,
              disabledColor: Colors.grey,
              textColor: bright1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minWidth: 120,
              height: 50,
              onPressed: () {
                data.add(['', '']);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Exam(),
                  ),
                );
              },
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
