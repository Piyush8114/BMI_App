import 'package:bmi_app/BMI_App.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),


      home: const MyHomePage(title: 'BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var WtController = TextEditingController();
var FtController = TextEditingController();
var InController = TextEditingController();
var Result= "";
var bgcolor =Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(widget.title),
      ),
      body:
      Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    color: Colors.lightBlueAccent,
                    shadowColor: Colors.red,
                    elevation: 6,
                    child: Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold,color: Colors.black87),)),

                SizedBox(height: 20,),

                TextField(
                  controller: WtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight(kg)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),

                SizedBox(height: 13,),

                TextField(
                  controller: FtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height(Feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),

                SizedBox(height: 13,),

                TextField(
                  controller: InController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height(Inch)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),

                SizedBox(height: 17,),


                ElevatedButton(onPressed: (){
                  var wt = WtController.text.toString();
                  var feet = FtController.text.toString();
                  var inch = InController.text.toString();

                  if(wt!="" && feet!="" && inch!=""){
                    var iwt = int.parse(wt);
                    var ifeet = int.parse(feet);
                    var Iinch = int.parse(inch);

                    var INCH = (ifeet*12)+Iinch;
                    var CM = INCH * 2.54;
                    var METER = CM/100;
                    var BMI = iwt/(METER*METER);

                    var msg;
                    if(BMI>25){
                      msg = " You're OVerWeidth";
                      bgcolor= Colors.orange.shade50;
                    }
                    else if(BMI <18){
                      msg = " You're UnderWeidth";
                      bgcolor= Colors.red.shade100;
                    }
                    else{
                      msg = " You're Healtly";
                      bgcolor= Colors.green.shade100;
                    }

                    setState(() {
                      Result = "$msg \n Your BMI is : ${BMI.toStringAsFixed(4)}";
                    });

                  }
                  else{
                    setState(() {
                      Result = "Please fill the all required blank!!!";
                    });
                  }

                }, child: Text('Calculate')),

                SizedBox(height: 15,),
                Text(Result,style: TextStyle(fontSize: 17,color: Colors.red.shade400),),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BMI(),));
                }, child: Text('Next'))
              ],
            ),
          ),
        ),
      )
    );
  }
}
