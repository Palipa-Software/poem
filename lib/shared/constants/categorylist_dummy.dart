import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lovespoem/modules/category/category_controller.dart';
import 'package:lovespoem/shared/widgets/category_card.dart';

CategoryController controller = CategoryController();
ScrollController _scrollController = ScrollController();

final List<Widget> categorys = [
  Obx(() {
    return CategoryCard(
      questionText: "Who do you want to write to?",
      answerText: controller.answer1.value,
      onTap: () {},
      children: [
        Container(
          height: 70.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: answers1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Bounceable(
                  onTap: () {
                    controller.selectedIndex1.value = index + 1;
                    controller.answer1.value = answers1[index];
                    controller.isExpanded1.value = false;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: index + 1 == controller.selectedIndex1.value ? Color(0xffa289f8) : Colors.white,
                        border: Border.all(
                          width: 0.1.w,
                          color: Color(
                            0xffbec0c7,
                          ),
                        )),
                    height: 7.h,
                    width: 100.w,
                    child: Center(
                        child: Text(
                      answers1[index],
                      style: TextStyle(fontSize: 20.sp),
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }),
  Obx(() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: CategoryCard(
        questionText: "What is the occassion?",
        answerText: controller.answer2.value,
        onTap: () {},
        children: [
          Container(
            height: 52.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: answers2.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Bounceable(
                    onTap: () {
                      controller.selectedIndex2.value = index + 1;
                      controller.answer2.value = answers2[index];
                      controller.isExpanded2.value = false;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index + 1 == controller.selectedIndex2.value ? Color(0xffa289f8) : Colors.white,
                          border: Border.all(
                            width: 0.1.w,
                            color: Color(
                              0xffbec0c7,
                            ),
                          )),
                      height: 7.h,
                      width: 100.w,
                      child: Center(
                          child: Text(
                        answers2[index],
                        style: TextStyle(fontSize: 20.sp),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }),
  Obx(() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: CategoryCard(
        questionText: "What is your style?",
        answerText: controller.answer3.value,
        onTap: () {},
        children: [
          Container(
            height: 38.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: answers3.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Bounceable(
                    onTap: () {
                      controller.selectedIndex3.value = index + 1;
                      controller.answer3.value = answers3[index];
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index + 1 == controller.selectedIndex3.value ? Color(0xffa289f8) : Colors.white,
                          border: Border.all(
                            width: 0.1.w,
                            color: Color(
                              0xffbec0c7,
                            ),
                          )),
                      height: 7.h,
                      width: 100.w,
                      child: Center(
                          child: Text(
                        answers3[index],
                        style: TextStyle(fontSize: 20.sp),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }),
  Obx(() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h),
      child: CategoryCard(
        questionText: "What is your Tone?",
        answerText: controller.answer4.value,
        onTap: () {},
        children: [
          Container(
            height: 20.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: answers4.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Bounceable(
                    onTap: () {
                      controller.selectedIndex4.value = index + 1;
                      controller.answer4.value = answers4[index];
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: index + 1 == controller.selectedIndex4.value ? Color(0xffa289f8) : Colors.white,
                          border: Border.all(
                            width: 0.1.w,
                            color: Color(
                              0xffbec0c7,
                            ),
                          )),
                      height: 7.h,
                      width: 100.w,
                      child: Center(
                          child: Text(
                        answers4[index],
                        style: TextStyle(fontSize: 20.sp),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }),
];

final List<String> answers1 = [
  "Lover",
  "Girl Friend",
  "Boy Friend",
  "Wife",
  "Husband",
  "Mother",
  "Father",
  "Grand Ma",
  "Grand Pa",
  "Sister",
  "Brother",
  "Daughter",
  "Son"
];
final List<String> answers2 = [
  "Anniversary",
  "Birthday",
  "Congratulations",
  "Get Well Soon",
  "Miss You",
  "Thank You",
  "Love You",
  "Forgive Me",
];
final List<String> answers3 = [
  "Haiku",
  "Sonnet",
  "Lambic",
  "Limerick",
  "Ode",
  "Eiegy",
  "Acrostic",
];
final List<String> answers4 = [
  "Sweet",
  "Spicy",
  "Caring",
  "Adoring",
  "Snarky",
  "Sarcastic",
  "Naughty",
  "Funny",
];
