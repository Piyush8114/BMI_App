import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BMIstate();
  }
}
class BMIstate extends State<BMI>{

  var wtController = TextEditingController();
  var ftController =TextEditingController();
  var inchController = TextEditingController();
  var Result="";
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BMI',style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700,color: Colors.indigo),),

            Card(
                elevation: 7,
                color: Colors.white54,
                shadowColor: Colors.green,
                child: Text('Body Mass Index',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.indigo),)),

            SizedBox(height: 21,),
            TextField(
              controller: wtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.line_weight),
                label: Text('Enter Your Weight'),
              ),
            ),

            SizedBox(height: 11,),

            TextField(
              controller: ftController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.height),
                label: Text('Enter Your Height(feet)'),
              ),
            ),

            SizedBox(height: 11,),


            TextField(
            controller: inchController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.height),
              label: Text('Enter Your Height(Inch)'),
            ),
          ),

            SizedBox(height: 21,),

            ElevatedButton(onPressed: (){

              var weight = wtController.text.toString();
              var fheight = ftController.text.toString();
              var iheight = inchController.text.toString();

              if(weight!= "" && fheight!= "" && iheight!="" )
                {
                  var iwt = int.parse(weight);
                  var ft = int.parse(fheight);
                  var inchs = int.parse(iheight);

                  var Inch = (ft*12)+inchs;
                  var Cm = Inch * 2.54;
                  var Meter = Cm/100;
                  var BMI = iwt/(Meter * Meter);

                  setState(() {
                    Result = "Your BMI is : ${BMI.toStringAsFixed(3)}";
                  });
                }

              else{
                setState(() {
                  Result = "Please Enter all required blank box";
                });

              }

            }, child: Text('Calculate'),
            ),
            Text(Result,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300,color: Colors.red),),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'BMI App'),));
            }, child: Text('Back'))
          ],
            )
          ),
        ),
      ),
    );
  }
}