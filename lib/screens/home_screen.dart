import 'package:flutter/material.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/screens/category_set_screen.dart';

class HomeScreen extends StatelessWidget {
  final textColor = Colors.white;

  const HomeScreen({super.key});

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
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Test Skills",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox( height: 5,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Prepare yourself for test",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Data.categories.length,
                padding: EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:(MediaQuery.of(context).size.height - 50 - 25) /(4 * 240),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final category = Data.categories[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: 
                      (context)=> CategorySetScreen(category: category,),
                      ));
                    },
                    child: Container(
                      padding:EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10),
                          child: Image.asset(category.image,
                          height: 100,
                          width: 100,
                          ),
                          ),

                          SizedBox(height: 10,),
                          Text(category.name,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
