import 'package:flutter/material.dart';
import 'package:getxmvvm/res/colors/app_color.dart';

class RoundButton extends StatelessWidget {
  //hum ye islia kr rahy hn k ta k app hudh sy value na dy ye initial value honi chihey
  const RoundButton({super.key,
    this.buttonColor = AppColor.primaryColor,
    this.textColor = AppColor.PrimaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height=50,
    this.loading=false,
  });

  final bool loading;

  final String title;

  final double height , width;

  final VoidCallback onPress;

  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading ? Center(child: CircularProgressIndicator()) :
        Center(
          child: Text(title,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),)),

      ),
    );
  }
}
