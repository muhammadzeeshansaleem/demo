
import 'package:demo/screencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatelessWidget {

  ScreenController controller= Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Screen 2"),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: controller.obx((state) => controller.model.length!=0?Column(
                  children: List.generate(controller.model.length, (index) {

                    return ListTile(
                      title: Text(controller.model[index].text),
                      subtitle: Text("Edit Text "+(index+1).toString()),
                      leading:  Text((index+1).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    );


                  }
                  )):Center(child: Card(
            elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No Data Found"),
                    ),
                  )))





    )));}
}
