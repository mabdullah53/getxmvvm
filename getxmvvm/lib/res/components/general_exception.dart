import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxmvvm/res/colors/app_color.dart';

class generalExceptionWidget extends StatefulWidget {

  //ye click ka function hai

  final VoidCallback onPress ;
  const generalExceptionWidget({super.key, required this.onPress});

  @override
  State<generalExceptionWidget> createState() => _generalExceptionWidgetState();
}

class _generalExceptionWidgetState extends State<generalExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15,),
          Icon(Icons.cloud_off, color: AppColor.redColor,size: 58,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('general_exception'.tr,textAlign: TextAlign.center,),),
          ),
          SizedBox(height: height * .15,),

          GestureDetector(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(50),

              ),
              child: Center(child: Text('Retry',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),)),
            ),
          )
        ],
      ),
    );
  }
}
