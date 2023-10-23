import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hourses/helper/My_Button.dart';
import 'package:hourses/helper/My_Text.dart';
import 'package:hourses/helper/Praf_handler.dart';
import 'package:hourses/helper/my_helper.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  final w1=TextEditingController(),w2=TextEditingController(),w3=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: MyText(txt: 'Setting', color: Colors.white, txtSize: 18),
      ),

      body: Column(
        children: [


          SizedBox(height: 20,),
          Center(child: MyText(txt: 'Enter Week days', color: Colors.black, txtSize: 20)),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: w1,
                    decoration: InputDecoration(
                      hintText: 'week 1'
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: w2,
                    decoration: InputDecoration(
                      hintText: 'week 2'
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: w3,
                    decoration: InputDecoration(
                      hintText: 'week 3'
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30,),
          My_Btn(txt: 'Save', btn_color: Colors.red, btn_size: 200, gestureDetector: GestureDetector(onTap: () {

            if(w1.text.isEmpty||w2.text.isEmpty||w3.text.isEmpty){
             EasyLoading.showError('fill all the fields');
            }
            else{
              praf_handler.set_int(my_helper.w1, int.parse(w1.text));
              praf_handler.set_int(my_helper.w2, int.parse(w2.text));
              praf_handler.set_int(my_helper.w3, int.parse(w3.text));
              EasyLoading.showSuccess('saved');
              Navigator.pop(context,true);
            }

          },),txt_color: Colors.white,)


        ],
      ),
    );
  }
}
