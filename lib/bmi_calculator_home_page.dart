import 'main.dart';
import 'package:flutter/material.dart';

class bmi_calculator_home extends StatefulWidget {
  bmi_calculator_home({super.key});

  @override
  State<bmi_calculator_home> createState() => _bmi_calculator_homeState();
}
TextEditingController _user_height= TextEditingController();
TextEditingController _user_weight= TextEditingController();

String bmi_value='0';
String bmi_result='0';


class _bmi_calculator_homeState extends State<bmi_calculator_home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 5,
        shadowColor: Colors.black,
        title: Text("Tutorial on Flutter(BMI Calculator)",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
        backgroundColor:Color(0xff317156),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff317156),width: 2.0)

                ),
                height: 60,
                width: 300,
                child: TextField(

                  keyboardType: TextInputType.number,
                  controller: _user_height,
                  decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                      border: InputBorder.none,
                      hintText: 'Enter Your Height',
                      hintStyle: TextStyle(
                          fontWeight:FontWeight.w400
                      )
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    border: Border.all(color: Color(0xff317156),width: 2.0)

                ),
                height: 60,
                width: 300,
                child: TextField(

                  keyboardType: TextInputType.number,
                  controller: _user_weight,
                  decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),

                      border: InputBorder.none,
                      hintText: 'Enter Your Weight',
                      hintStyle: TextStyle(
                          fontWeight:FontWeight.w400
                      )
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Your BMI is $bmi_value",style: TextStyle(color: Color(0xff317156),fontSize: 40),),
              Text(bmi_result,style: TextStyle(color: Color(0xff317156),fontSize: 25),),
              SizedBox(height: 200,),
              InkWell(
                onTap: (){

                  setState(() {
                    double bmi_weight_double=double.parse(_user_weight.text.trim()); //CONVERTION
                    double bmi_height_double=double.parse(_user_height.text.trim());

                    bmi_value=(bmi_weight_double/(bmi_height_double * bmi_height_double)).toStringAsFixed(2); //bmi calculation formula

                    double bmi_value_double=double.parse(bmi_value);

                    if (bmi_value_double < 18.5) {
                      print('You are underweight.');

                      bmi_result='You are underweight.';

                    } else if (bmi_value_double >= 18.5 && bmi_value_double < 25) {
                      print('You have a normal weight.');

                      bmi_result='You have a normal weight.';

                    } else if (bmi_value_double >= 25 && bmi_value_double < 30) {
                      print('You are overweight.');
                      bmi_result='You are overweight.';

                    } else {
                      print('You are obese.');
                      bmi_result='You are obese.';
                    }
                  });
                },
                child: Card(
                  elevation: 7,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xff317156),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: 250,
                      child: Center(child: Text("Calculate your BMI",style: TextStyle(color: Colors.white,fontSize: 20),)) ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
