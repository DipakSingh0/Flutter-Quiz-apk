import 'package:flutter/material.dart';
// import 'package:quiz/data/data.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/screens/quiz_screen.dart';

class CategorySetScreen extends StatelessWidget {
  final textColor = Colors.white;
  final Category category;
  const CategorySetScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: textColor,
                        size: 30,
                      ),
                    ),
                    Text(
                      "${category.name} Quiz",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: category.quizSets.length,
                  itemBuilder: (context, index) {
                    final quizSet = category.quizSets[index];

                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizSet: quizSet
                            ),
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: textColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                category.image,
                                height: 40,
                                width: 4,
                              ),
                              SizedBox( width: 20,),
                              Text(
                                quizSet.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })

              // SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}