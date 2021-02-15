import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyCaculator(),
    );
  }
}

class MyCaculator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyCaculatorState();
  }
}

class MyCaculatorState extends State<MyCaculator>{

  final controlNumberA = TextEditingController();
  final controlNumberB = TextEditingController();

  final myFormKey = GlobalKey<FormState>();
  String result = "";
  String textToShow = "";


  void sum(){
    if(myFormKey.currentState.validate()) {
       int numberA = int.parse(controlNumberA.text);
       int numberB = int.parse(controlNumberB.text);
       int result = numberA + numberB;

       setState(() {
         textToShow = "$numberA + $numberB = $result";
       });
    }
  }

  void minus(){
    if(myFormKey.currentState.validate()){
      int numberA = int.parse(controlNumberA.text);
      int numberB = int.parse(controlNumberB.text);
      int result = numberA - numberB;
      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void times(){
    if(myFormKey.currentState.validate()) {
      int numberA = int.parse(controlNumberA.text);
      int numberB = int.parse(controlNumberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });

    }
  }


  void divide(){
    if(myFormKey.currentState.validate()) {
      int numberA = int.parse(controlNumberA.text);
      int numberB = int.parse(controlNumberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";

      });
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Form(
          key: myFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child:  TextFormField(
                  controller: controlNumberA,
                  validator: (value){
                    if(value.isEmpty) return "Please enter a number";
                  },
                  decoration: InputDecoration(hintText: "Enter a number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child:  TextFormField(
                  controller: controlNumberB,
                  validator: (value){
                    if(value.isEmpty) return "Please enter a number";
                  },
                  decoration: InputDecoration(hintText: "Enter a number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(textToShow, style: TextStyle(fontSize: 20.0),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: sum,
                    child: Text('+'),
                  ),
                  RaisedButton(onPressed: minus,
                    child: Text('-'),
                  ),
                  RaisedButton(onPressed: times,
                    child: Text('*'),
                  ),
                  RaisedButton(onPressed: divide,
                    child: Text('/'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

}

