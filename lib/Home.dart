import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hourses/Date_added_hourses.dart';
import 'package:hourses/Setting.dart';
import 'package:hourses/Shedulaining.dart';
import 'package:hourses/helper/My_Button.dart';
import 'package:hourses/helper/My_Methods.dart';
import 'package:hourses/helper/My_Text.dart';
import 'package:hourses/helper/Praf_handler.dart';
import 'package:hourses/helper/my_helper.dart';
import 'package:hourses/model/Shedule_model.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelectedWeeks();
    getWeekDays();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: my_helper.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: MyText(txt: 'Home', color: Colors.white, txtSize: 18,fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          selected_weeks(),
          SizedBox(height: 50,),
          week_days(),

          My_Btn(txt: 'Setting', btn_color: Colors.red, btn_size: 100, gestureDetector: GestureDetector(onTap: () async{

            Get.to(Setting())!.then((value) {

              if(value!=null)
                {
                  getSelectedWeeks();
                  getWeekDays();
                }
            });

          },),txt_color: Colors.white),

          SizedBox(height: 30,),


        ],


      )

    );
  }

  int selected_week=1;
  Widget selected_weeks(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        InkWell(
          onTap: () {
            week_showing=selected_week-week_showing;
            show_d1_list=false;
            show_d2_list=false;
            show_d3_list=false;
            show_d4_list=false;
            show_d5_list=false;
            show_d6_list=false;
            show_d7_list=false;
            getWeekDays();
          },
            child: Icon(Icons.arrow_back,size: 50,)),

        SizedBox(width: 20,),

        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle
          ),
          child: Center(child: InkWell(
              onTap: () {
                selected_week=w1;
                setState(() {

                });
              },
              child: MyText(txt: w1.toString(), color: selected_week==w1?Colors.white: Colors.black, txtSize: 20,fontWeight: FontWeight.bold))),

        ),
        SizedBox(width: 5,),

        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle
          ),
          child: Center(child: InkWell(
              onTap: () {
                selected_week=w2;
                setState(() {

                });
              },
              child: MyText(txt: w2.toString(), color:selected_week==w2?Colors.white: Colors.black, txtSize: 20,fontWeight: FontWeight.bold))),

        ),
        SizedBox(width: 5,),

        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle
          ),
          child: Center(child: InkWell(
              onTap: () {
                selected_week=w3;
                setState(() {

                });
              },
              child: MyText(txt: w3.toString(), color:selected_week==w3?Colors.white: Colors.black, txtSize: 20,fontWeight: FontWeight.bold))),

        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: () {
            week_showing=selected_week+week_showing;
            show_d1_list=false;
            show_d2_list=false;
            show_d3_list=false;
            show_d4_list=false;
            show_d5_list=false;
            show_d6_list=false;
            show_d7_list=false;
            getWeekDays();
          },
            child: Icon(Icons.arrow_forward,size: 50,)),

    ],);
  }

  Widget week_days(){
    if(weekDays.length<1)
      return Container();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            days_view(weekDays[0],d1h),

            Container(
              child: show_d1_list?days_list_view(shedule_list_d1,weekDays[0]):Container(),
            ),
            SizedBox(height: 5,),
            days_view(weekDays[1],d2h),

            Container(
              child: show_d2_list?days_list_view(shedule_list_d2,weekDays[1]):Container(),
            ),
            SizedBox(height: 5,),
            days_view(weekDays[2],d3h),
            Container(
              child: show_d3_list?days_list_view(shedule_list_d3,weekDays[2]):Container(),
            ),
            SizedBox(height: 5,),
            days_view(weekDays[3],d4h),

            Container(
              child: show_d4_list?days_list_view(shedule_list_d4,weekDays[3]):Container(),
            ),
            SizedBox(height: 5,),
            days_view(weekDays[4],d5h),

            Container(
              child: show_d5_list?days_list_view(shedule_list_d5,weekDays[4]):Container(),
            ),

            SizedBox(height: 5,),
            days_view(weekDays[5],d6h),

            Container(
              child: show_d6_list?days_list_view(shedule_list_d6,weekDays[5]):Container(),
            ),
            SizedBox(height: 5,),
            days_view(weekDays[6],d7h),

            Container(
              child: show_d7_list?days_list_view(shedule_list_d7,weekDays[6]):Container(),
            ),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }


  bool show_d1_list=false,show_d2_list=false,show_d3_list=false,show_d4_list=false
  ,show_d5_list=false,show_d6_list=false,show_d7_list=false;
  List<Shedule_modle> shedule_list_d1=[],shedule_list_d2=[],shedule_list_d3=[],
      shedule_list_d4=[],shedule_list_d5=[],shedule_list_d6=[],shedule_list_d7=[];
  Widget days_view(DateTime dateTime,int hours){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,

          ),
          child: Center(child: MyText(txt: hours.toString(), color: Colors.black, txtSize: 25,fontWeight: FontWeight.bold)),

        ),
        SizedBox(width: 5,),
        Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: InkWell(
              onTap: () async{


                if(dateTime.millisecondsSinceEpoch==weekDays[0].millisecondsSinceEpoch) {
                  shedule_list_d1=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d1_list=!show_d1_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[1].millisecondsSinceEpoch) {
                  shedule_list_d2=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d2_list=!show_d2_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[2].millisecondsSinceEpoch) {
                  shedule_list_d3=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d3_list=!show_d3_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[3].millisecondsSinceEpoch) {
                  shedule_list_d4=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d4_list=!show_d4_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[4].millisecondsSinceEpoch) {
                  shedule_list_d5=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d5_list=!show_d5_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[5].millisecondsSinceEpoch) {
                  shedule_list_d6=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d6_list=!show_d6_list;
                }
                else if(dateTime.millisecondsSinceEpoch==weekDays[6].millisecondsSinceEpoch) {
                  shedule_list_d7=await praf_handler.get_shedule_list(my_helper.shedule+dateTime.millisecondsSinceEpoch.toString());
                  show_d7_list=!show_d7_list;
                }




                setState(() {

                });

              },
              child: Column(children: [

                MyText(txt: DateFormat.EEEE().format(dateTime), color: Colors.black, txtSize: 20),
                MyText(txt: DateFormat.yMMMd().format(dateTime), color: Colors.black, txtSize: 20),



              ],),
            ),
          ),
        ),
        SizedBox(width: 5,),
        Container(
          width: 50,height: 50,
          decoration: BoxDecoration(
            color: Colors.red,

          ),
          child: Center(child: IconButton(onPressed: () async{
             Get.to(Sheduling(weekDay: dateTime),transition: Transition.circularReveal,duration: Duration(seconds: 1))!.then((value) {
               if(value!=null)
                 {
                   getWeekDays();

                 }
             });

          }, icon: Icon(Icons.add,color: Colors.black,size: 30,))),

        ),


      ],
    );
  }



  Widget days_list_view(List<Shedule_modle> list,DateTime dateTime){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {

        Shedule_modle model=list[index];
        print(model.owner_name);
        
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          MyText(txt: model.hourses.toString()+' HD', color: Colors.black, txtSize: 20),
          SizedBox(width: 10,),
          InkWell(
            onTap: () {
              Get.to(Date_added_hourses(shedule_modle: model, weekDay: dateTime,),transition: Transition.circularReveal,duration: Duration(seconds: 1));
            },
              child: MyText(txt: model.time.toString()+' - '+model.owner_name, color: Colors.black, txtSize: 20)),
        ],);


        
        
        },);
  }

  

  List<DateTime> weekDays=[];
  int d1h=0,d2h=0,d3h=0,d4h=0,d5h=0,d6h=0,d7h=0;
  getWeekDays()async{
    weekDays=await my_Methods.get_days_in_week(week_showing);
    
    d1h=await praf_handler.get_int(my_helper.hourse+weekDays[0].millisecondsSinceEpoch.toString());
    d2h=await praf_handler.get_int(my_helper.hourse+weekDays[1].millisecondsSinceEpoch.toString());
    d3h=await praf_handler.get_int(my_helper.hourse+weekDays[2].millisecondsSinceEpoch.toString());
    d4h=await praf_handler.get_int(my_helper.hourse+weekDays[3].millisecondsSinceEpoch.toString());
    d5h=await praf_handler.get_int(my_helper.hourse+weekDays[4].millisecondsSinceEpoch.toString());
    d6h=await praf_handler.get_int(my_helper.hourse+weekDays[5].millisecondsSinceEpoch.toString());
    d7h=await praf_handler.get_int(my_helper.hourse+weekDays[6].millisecondsSinceEpoch.toString());
    
    setState(() {

    });
  }

  int w1=1,w2=2,w3=3,week_showing=1;
  getSelectedWeeks()async{
    w1=await praf_handler.get_int(my_helper.w1);
    if(w1==0)
      w1=1;
    w2=await praf_handler.get_int(my_helper.w2);
    if(w2==0)
      w2=2;
    w3=await praf_handler.get_int(my_helper.w3);
    if(w3==0)
      w3=3;

    selected_week=w1;
    week_showing= 1;
    getWeekDays();
    setState(() {

    });
  }



}
