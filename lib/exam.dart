import 'package:flutter/material.dart';
import 'color.dart';
import 'result.dart';
import 'controllers.dart';

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int gameCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 46, 46),
        title: const Text(
          "QuizApp",
          style: TextStyle(
            color: bright1,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 18,
            ),
            Container(
              width: 85,
              height: 45,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 46, 46),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(
                " $eCounter  of $qCounter ",
                style: const TextStyle(
                  color: bright1,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 300,
              height: 135,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 49, 46, 46),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Center(
                child: Text(
                  data[eCounter][0],
                  style: const TextStyle(
                    color: bright1,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                controller: examAnswer,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              color: dark3,
              disabledColor: Colors.grey,
              textColor: dark2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minWidth: 120,
              height: 50,
              onPressed: () {
                if (eCounter + 1 == qCounter) {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResultPage(),
                      ),
                    );
                  });
                } else if (data[eCounter][1] == examAnswer.text) {
                  result++;
                } else {
                  error.add(eCounter);
                }

                setState(() {
                  ++eCounter;
                  examAnswer.clear();
                });
              },
              child: const Text(
                "Next Questions",
                style: TextStyle(
                  color: bright1,
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
