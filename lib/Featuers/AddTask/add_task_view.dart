import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int colorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Add Task',
              style: getHeadlineStyle(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          backgroundColor: Colors.blue[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter Title here ...',
                    
                  ),
                ),
                const Gap(50),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Note',
                      hintText: 'Enter Note here',
                      contentPadding: EdgeInsets.only(top: 25, bottom: 25)),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date', style: getTitleStyle()),
                          Text(
                            '6/2/2024',
                            style: getSmallStyle(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.calendar_month,
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        colorIndex == 0;
                        setState(() {
                          colorIndex = 0;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: (colorIndex == 0)
                            ? Icon(
                                Icons.check,
                                color: AppColors.whiteColor,
                              )
                            : const SizedBox(),
                      ),
                    ),
                    Gap(5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          colorIndex = 1;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.orangeColor,
                        child: (colorIndex == 1)
                            ? Icon(Icons.check, color: AppColors.whiteColor)
                            : const SizedBox(),
                      ),
                    ),
                    const Gap(5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          colorIndex = 2;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.redColor,
                        child: (colorIndex == 2)
                            ? Icon(Icons.check, color: AppColors.whiteColor)
                            : const SizedBox(),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
