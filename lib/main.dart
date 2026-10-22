import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const new({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dice1 = 1;
  var dice2 = 1;
  var score1 = 0;
  var score2 = 0;
  var round = 0;
  var player = false;
  var pressed1 = true;
  var pressed2 = false;
  var winner = "?";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(backgroundColor: Colors.teal,
          appBar: AppBar(backgroundColor: Colors.teal,
          centerTitle: true,
          elevation: 5,
          shadowColor: Colors.orange,
          title:Text('Dice Game',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),

          ),
          body: Column(
            children: [
              SizedBox(height: 60,),
              Text(

                'Winner: $winner',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Player 1',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Player 2',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),


              Row(
                children: [
                  Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      onPressed: () {
                      setState(() {
                        if(!player){
                          dice1 = Random().nextInt(6)+1;
                          player = true;
                          pressed2= false;
                          pressed1 = true;
                        }
                      });
                    },
                      child: Image(image: AssetImage('images/dice$dice1.png'),
                      color: pressed1 ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextButton(
                        onPressed: () {
                      setState(() {
                        if(player){
                          dice2 = Random().nextInt(6)+1;
                          player = false;
                          pressed2= true;
                          pressed1 = false;
                          if (dice1 > dice2){
                            score1++;
                          }else if (dice2 > dice1){
                            score2++;
                          }
                          if (++round == 4){
                            if(score1 > score2){
                              winner = "Player 1";
                            }
                            else if (score2>score1){
                              winner = "player 2";;
                            }else {
                              winner = "Draw";
                            }
                          }

                          
                        }                        
                      });
                    },
                        child: Image(image: AssetImage('images/dice$dice2.png'),
                        color: pressed2 ? Colors.orange : Colors.white,
                        )
                        ),
                      ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              
              Row(
                children: [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      '$score1',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                      
                    ),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      '$score2',
                                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              TextButton(
                onPressed: (){
                  setState(() {
                    dice1 = Random().nextInt(6)+1;
                    dice2 = Random().nextInt(6)+1;
                  });
                },
                child: Container(
                  width: 115,
                  height: 55,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 3, color: Colors.orange)
                  ),
                  child: Text(
                    
                    round > 0 ? "Re-start":"Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight(1000)
                              ),
                  ),
                ),
              )

            ],

          ),
        ),
    );
  }
}