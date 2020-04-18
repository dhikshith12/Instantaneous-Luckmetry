import 'package:flutter/material.dart';
import 'dart:math';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 //TODO:import images
 AssetImage circle = AssetImage("images/circle.png");
 AssetImage lucky = AssetImage("images/rupee.png");
 AssetImage unlucky = AssetImage("images/sadFace.png");

 //TODO:get an array
 List<String> itemArray;
 int luckyNumber;
 int lf=0;
 dynamic k = 0;
 
 
 //TODO:init array with 25 elements
 @override
 void initState() {
   super.initState();
   itemArray = List<String>.generate(25,(index) => "empty");
   generateRandomNumber();
 }
 generateRandomNumber(){
 int random = Random().nextInt(25);
 setState(() {
 luckyNumber = random;
 });
 }
 //TODO: define a getImage method
 AssetImage getImage(int index){
   String currentState = itemArray[index];
   switch (currentState) {
     case "lucky":
        return lucky;
        break;
    case "unlucky":
        return unlucky;
        break;
   }
   return circle;
 }
 
 //TODO:play game method 
 playGame(int index){
   
   setState(() {
     if (luckyNumber==index) {
       itemArray[index] = "lucky";
   } else if (itemArray[index] != "unlucky") {
       itemArray[index] = "unlucky";
    }
    lf++;
    if (k>=0 && itemArray[index] != "unlucky"){
    k = (1-(lf/25))*100;
    }
   });
   
 }

 //TODO:showall
 // showAll(){
 // setState(() {
 //  itemArray[luckyNumber] = "lucky";
 // });
 //}
 //TODO: Reset all
 resetGame(){
   setState(() {
     itemArray = List<String>.filled(25, "empty");
     generateRandomNumber();
     lf = 0;
     k=0;
   });
 }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Scratch And Win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 70.0),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                ),
                itemCount: itemArray.length,
                itemBuilder: (context, i) => SizedBox(
                  width:50.0,
                  height:50.0,
                  child: RaisedButton(
                    onPressed: (){
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(i),
                      ),
                    ),
                ),
            ),
          ),
           Column(
             children: <Widget>[
               Container(
                   child: Row(
                    children: <Widget>[
                      SizedBox(width: 129),
                      Text("YourLuck : ${(k).round()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        ),
                      ],
                    ),
                  ),
              Row(
                children: <Widget>[
                  SizedBox(width:100),
                  LinearPercentIndicator(
                    width:150,
                    animation:true,
                    lineHeight:15,
                    animationDuration:1700,
                    percent:k/100,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor:Colors.pink
                  ),
                  Icon(
                     Icons.favorite_border
                  )
                ],
              )
             ],
           ),
          Container(
            child: SizedBox(height:8),
          ),
          
         
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              shape:RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(35)
               ),
                onPressed: (){
                  this.resetGame();
                },
                color: Colors.pink,
                padding: EdgeInsets.all(15.0),
                child: Text('Reset',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 20.0,
                 ),
                ),
            ),
          ),
        ],
      ),
    );
   }
}