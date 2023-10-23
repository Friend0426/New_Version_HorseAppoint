import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:hourses/helper/My_Button.dart';
import 'package:hourses/helper/My_Text.dart';
import 'package:hourses/helper/Praf_handler.dart';
import 'package:hourses/helper/my_helper.dart';
import 'package:hourses/model/Shedule_model.dart';

class Sheduling extends StatefulWidget {
  final DateTime weekDay;
  const Sheduling({super.key, required this.weekDay});

  @override
  State<Sheduling> createState() => _ShedulingState(weekDay);
}

class _ShedulingState extends State<Sheduling> {
  final DateTime weekDay;

  _ShedulingState(this.weekDay);
  Contact? contact;
  bool alert_on=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AwesomeNotifications().initialize(
    //   // set the icon to null if you want to use the default app icon
    //     null,
    //     [
    //       NotificationChannel(
    //           channelGroupKey: 'mcg',
    //           channelKey: 'mc',
    //           channelName: 'bn',
    //           channelDescription: 'Notification channel for basic tests',
    //           defaultColor: Color(0xFF9D50DD),
    //           ledColor: Colors.white)
    //     ],
    //
    //
    // );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        SizedBox(height: 60,),
        Center(
          child: My_Btn(txt: 'Owner Search', btn_color: Colors.grey, btn_size: 300, gestureDetector: GestureDetector(onTap: () async{

             contact=await FlutterContactPicker().selectContact();

          },),txt_color: Colors.black),
        ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(txt: 'Time', color: Colors.white, txtSize: 20,fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(height: 10,),
        grid_time(),
      InkWell(
        onTap: () {
          mnt=30;
          setState(() {

          });
        },
        child: Container(
          width: 50,height: 50,

          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle
          ),
          child: Center(child: MyText(txt: '30', color: mnt==30?Colors.white:Colors.black, txtSize: 25,fontWeight: FontWeight.bold,)),
        ),
      ),

        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(txt: '# of Hourses', color: Colors.white, txtSize: 20,fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(height: 10,),
        grid_hourses(),
        SizedBox(height: 10,),
        Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: My_Btn(txt:alert_on? 'Alert On':'Alert Off', btn_color: Colors.pink, btn_size: 000, gestureDetector: GestureDetector(onTap: () {

                DateTime d=DateTime.now();
                d=d.add(Duration(seconds: 10));

                // AwesomeNotifications().createNotification(
                //     content: NotificationContent(
                //       id: 12313213,
                //       channelKey: 'mc',
                //       actionType: ActionType.Default,
                //       title: 'Hello World!',
                //       body: 'This is my first notification!',
                //     ),
                //   schedule: NotificationCalendar.fromDate(date: d)
                //
                //
                // );


                alert_on=!alert_on;
                setState(() {

                });

              },)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: My_Btn(txt: 'Submit', btn_color: Colors.yellow, btn_size: 00, gestureDetector: GestureDetector(onTap: () async{

                String time='';
                if(selectedTime<7)
                  time=selectedTime.toString()+':'+mnt.toString()+' am';
                else
                  time=selectedTime.toString()+':'+mnt.toString()+' pm';

                if(contact!=null) {
                    Shedule_modle model=Shedule_modle(hourses: hourses, time: time, owner_name: contact!.fullName!.toString(), owner_phone: contact!.phoneNumbers![0]);

                    String s=jsonEncode(model.toJson());
                    praf_handler.add_list(my_helper.shedule+weekDay.millisecondsSinceEpoch.toString(), s);

                    int h=await praf_handler.get_int(my_helper.hourse+weekDay.millisecondsSinceEpoch.toString());

                    h=h+hourses;

                    praf_handler.set_int(my_helper.hourse+weekDay.millisecondsSinceEpoch.toString(), h);

                   Navigator.pop(context,true);

                  }
                else{
                  EasyLoading.showError('select owner');
                }

                
              },),txt_color: Colors.black),
            ),
          ),

        ],)
      ],),
    );
  }
  int selectedTime=1,mnt=00;
 
  Widget grid_time(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,crossAxisSpacing: 5,mainAxisSpacing: 5

          ),
          itemBuilder: (context, index) {

          return InkWell(
            onTap: () {
              selectedTime=(index+1);
              setState(() {

              });
            },
            child: Container(

              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle
              ),
              child: Center(child: MyText(txt: (index+1).toString(), color: selectedTime==(index+1)?Colors.white:Colors.black, txtSize: 25,fontWeight: FontWeight.bold,)),
            ),
          );

          },),
    );
  }
  int hourses=1;
  Widget grid_hourses(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 18,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,crossAxisSpacing: 5,mainAxisSpacing: 5

          ),
          itemBuilder: (context, index) {

          return InkWell(
            onTap: () {
              hourses=(index+1);
              setState(() {

              });
            },
            child: Container(

              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
              ),
              child: Center(child: MyText(txt: (index+1).toString(), color: hourses==(index+1)?Colors.white:Colors.black, txtSize: 25,fontWeight: FontWeight.bold,)),
            ),
          );

          },),
    );
  }

}
