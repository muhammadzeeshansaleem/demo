
import 'package:demo/screencontroller.dart';
import 'package:demo/screentwo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatelessWidget {

  ScreenController controller= Get.put(ScreenController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   controller.obx((state) =>Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:controller.model.length!=0?Expanded(
        child: ElevatedButton(onPressed: (){

          if(!_formKey.currentState!.validate()) {
            return;
          }

          Get.to(ScreenTwo());


        }, child: Text("Submit")),
      ):Text("") ,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Screen 1"),),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
             Column(
               
               children: [

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Items",style: TextStyle(fontWeight: FontWeight.bold),),
                  ElevatedButton(onPressed: (){
                    controller.add();

                  }, child: Text("Add")),
                ],
              ),

          controller.model.length!=0?Form(
            key: _formKey,
            child: Column(
                    children: List.generate(controller.model.length, (index) {

                      return buildTextField(index);


                    }
                    )),
          ):Center(child: Card(
            elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No Data Found"),
                    ),
                  ))








            ],),
          ),
      ),

    ));
  }

  Widget buildTextField(int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(

            validator: (v){
              return controller.validatorCheck(v.toString(), "edit text "+(index+1).toString());
            },
            controller: controller.model[index], decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Edit Text "+(index+1).toString(),
              label: Text("Edit Text "+(index+1).toString(),),
              fillColor: Colors.white70),),
        ),
        IconButton(onPressed: (){

          controller.delete(index);
        }, icon: Icon(Icons.delete))

      ],
    ),
  );
}
