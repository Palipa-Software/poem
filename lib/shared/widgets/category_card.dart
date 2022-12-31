import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tutorai/modules/category/category_controller.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.questionText,
    required this.answerText,
    required this.onTap,
    required this.children,
  });
  final String questionText;
  final String answerText;
  final Function() onTap;

  final List<Widget> children;
  CategoryController controller = CategoryController();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        onExpansionChanged: (value) {
          controller.isExpanded1.value = value;
        },
        textColor: Color(0xffa289f8),
        title: Container(
          height: 12.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionText,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 2.h),
                Container(
                  height: 5.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xffbec0c7), width: 0.5.w))),
                  child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          answerText,
                          style: TextStyle(
                              color: Color(
                                0xffbec0c7,
                              ),
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        children: children);
  }
}
