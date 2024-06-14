import 'package:flutter/material.dart';
import 'main.dart';
import 'color.dart';
import 'exam.dart';
import 'controllers.dart';

void main() {
  runApp(const ResultPage());
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  Widget listErrors() {
    if (error.isEmpty) {
      return const Text(
        "You don't have any errors",
        style: TextStyle(
          color: bright1,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: error.map((i) {
          return Text(
            "question ${i + 1} Answer ${data[i][1]}",
            style: const TextStyle(
              color: bright1,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: dark3,
            title: const Text(
              "Result",
              style: TextStyle(fontSize: 20, color: bright1),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 22),
                    padding:
                        const EdgeInsets.only(right: 10, left: 25, top: 30),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 49, 46, 46),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: Text(
                      result > qCounter / 2 ? 'You Succeed' : "You Failed",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 88,
                    child: Text(
                      " Result: $result / $qCounter",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(top: 145, child: listErrors())
                ]),
                const SizedBox(
                  height: 25,
                ),
                Row(children: [
                  const SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    color: Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: dark1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: 100,
                    height: 50,
                    onPressed: () {
                      eCounter = 0;
                      error.clear();
                      result = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Exam(),
                        ),
                      );
                    },
                    child: const Text(
                      "Repeat Quiz",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    minWidth: 150,
                    color: Colors.grey,
                    disabledColor: Colors.grey,
                    textColor: dark1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    onPressed: () {
                      eCounter = 0;
                      qCounter = 0;
                      data.clear();
                      error.clear();
                      result = 0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GetQu(),
                        ),
                      );
                    },
                    child: const Text(
                      "New Quiz",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ));
  }
}
