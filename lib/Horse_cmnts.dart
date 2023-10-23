import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hourses/helper/My_Text.dart';
import 'package:hourses/model/Horse_coment_model.dart';

class Horse_cmnts extends StatefulWidget {

  final List<Horse_cmnt_model> list;
  final int pos;


  const Horse_cmnts({super.key, required this.list, required this.pos});

  @override
  State<Horse_cmnts> createState() => _Horse_cmntsState(list,pos);
}

class _Horse_cmntsState extends State<Horse_cmnts> {

  final List<Horse_cmnt_model> list;
  final int pos;

  _Horse_cmntsState(this.list, this.pos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 80,),
              MyText(txt: list[pos].owner_name, color: Colors.black, txtSize: 20),
              Image.file(File(list[pos].img)),
              MyText(txt: list[pos].cmnt, color: Colors.black, txtSize: 18),
            ],
          ),
        ),
      ),
      // ListView.builder(
      //   itemCount: list.length,
      //     itemBuilder: (context, index) {
      //       Horse_cmnt_model model=list[index];
      //
      //       File file=File(model.img);
      //       return Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           children: [
      //             MyText(txt: model.owner_name, color: Colors.black, txtSize: 20),
      //             Image.file(file),
      //             MyText(txt: model.cmnt, color: Colors.black, txtSize: 18),
      //           ],
      //         ),
      //       );
      //
      //     },),


    );
  }
}
