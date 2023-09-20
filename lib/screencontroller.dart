
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController with StateMixin{

  List<TextEditingController> model=[];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    change(model,status: RxStatus.success());



  }


  void add(){
    model.add(TextEditingController());
    change(model,status: RxStatus.success());

  }

  void delete(int index){
    model.removeAt(index);
    change(model,status: RxStatus.success());

  }

  String? validatorCheck(String v,String title){

    if(v.trim().isEmpty){
      return "Please enter your "+title;
    }
    return null;

  }

}