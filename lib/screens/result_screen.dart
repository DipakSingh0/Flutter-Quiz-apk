import 'package:flutter/material.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/screens/home_screen.dart';
import 'package:quiz/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestions;
  final int totalAttempts;
  final int totalCorrect;
  final int totalScore; // Add this parameter
  final QuizSet quizSet;

  const ResultScreen({
    super.key,
    required this.totalQuestions,
    required this.totalAttempts,
    required this.totalCorrect,
    required this.totalScore,
    required this.quizSet,
  });

  @override
  Widget build(BuildContext context) {
    String feedback = totalScore < 3
        ? "You Failed!!!"
        : totalScore < 6
            ? "Good!"
            : totalScore < 8
                ? "Great!"
                : "Awesome!"; 

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.indigo,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize:
              MainAxisSize.min, // Ensure Column takes minimal height
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(
                  8.0), // You can adjust the padding value as needed
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Quiz Result",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: Container(

                width: MediaQuery.of(context).size.width / 1.3,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Text(feedback,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    ),
                    SizedBox(height: 20,),
              
                    Text("You have Scored",
                     style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              
                    SizedBox(
                      height: 10,
                    ),
              
                     Text(
                      "${totalScore} / ${totalQuestions}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
              
                     SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(
                              builder: (context) => QuizScreen(quizSet: quizSet),));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.purple,
                                  Colors.indigo,
                                ],
                              ),
                            ),
                            child:  Text(
                              "Repeat",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            
                          ),
                        ),
                        SizedBox(width: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.purple,
                                  Colors.indigo,
                                ],
                              ),
                            ),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
              
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:quiz/model/model.dart';

// class ResultScreen extends StatelessWidget {
//   // const ResultScreen({super.key});
//   final int totalQuestions;
//   final int totalAttempts;
//   final int totalCorrect;
//   final int totalScore;
//   final QuizSet quizSet;

//   const ResultScreen({super.key, required this.totalQuestions, required this.totalAttempts, required this.totalCorrect, required this.quizSet});
 
//   @override
//   Widget build(BuildContext context) {
//     String feedback = totalScore<30? "You Failed!!!": totalScore<60?"Good!": totalScore < 80? "Great:Awesome!";
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.purple,
//               Colors.indigo,
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 60,
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(
//                     8.0), // You can adjust the padding value as needed
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                     ),
//                     Text(
//                       "Quiz Result",
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

            

//               // SizedBox(height: 15),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }