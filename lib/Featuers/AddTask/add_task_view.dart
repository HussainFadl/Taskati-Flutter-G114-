import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati_project/Core/Model/task_model.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Functions.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';
import 'package:taskati_project/Featuers/Home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String date = DateFormat.yMEd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));

  int colorIndex = 1;
  var titleCon = TextEditingController();
  var noteCon = TextEditingController();
  late Box<TaskModel> taskBox;
  @override
  void initState() {
    super.initState();

    taskBox = Hive.box('task');
  }

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
                Text(
                  'Title',
                  style: getBodyStyle(color: Colors.white),
                ),
                TextFormField(
                  controller: titleCon,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Enter Title here ...',
                    labelStyle: TextStyle(color: Colors.white),
                    //hintStyle: getSmallStyle(color: AppColors.greyColor),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const Gap(20),
                Text(
                  'Note',
                  style: getBodyStyle(color: Colors.white),
                ),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(40)],
                  controller: noteCon,
                  maxLines: 4,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    fillColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Note here',
                    //hintStyle: getSmallStyle(color: AppColors.greyColor),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const Gap(10),
                Text(
                  'Date',
                  style: getBodyStyle(color: Colors.white),
                ),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: date,
                      //s hintStyle: getSmallStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showDateDialuge();
                            });
                          },
                          icon: const Icon(Icons.calendar_month))),
                ),
                const Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Text('Start time',
                          style: getBodyStyle(color: AppColors.whiteColor)),
                    ),
                    Expanded(
                      child: Text('End time',
                          style: getBodyStyle(color: AppColors.whiteColor)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: startTime,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  showStartTime();
                                },
                                icon: const Icon(Icons.watch_later_outlined))),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: endTime,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  showEndTime();
                                },
                                icon: const Icon(Icons.watch_later_outlined))),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
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
                    Spacer(),
                    SizedBox(
                        height: 60,
                        child: CustomButton(
                            text: "Create Task",
                            onPressed: () {
                              String id =
                                  '${titleCon.text}${DateTime.now().millisecond}';
                              taskBox.put(
                                  id,
                                  TaskModel(
                                    id: id,
                                    title: titleCon.text,
                                    note: noteCon.text,
                                    endTime: endTime,
                                    startTime: startTime,
                                    color: colorIndex,
                                    isCompleted: false,
                                    date: date,
                                  ));
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()));
                            }))
                  ],
                )
              ]),
        ),
      ),
    );
  }

  showDateDialuge() async {
    var pickedDate = await showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      setState(() {
        date = DateFormat.yMd().format(pickedDate);
      });
    }
  }

  showStartTime() async {
    var startTimePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (startTimePicked != null) {
      setState(() {
        startTime = startTimePicked.format(context);
        int startMin = startTimePicked.minute;
        startTimePicked.replacing(minute: startMin + 15).format(context);
      });
    }
  }

  showEndTime() async {
    var startTimePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (startTimePicked != null) {
      setState(() {
        endTime = startTimePicked.format(context);
      });
    }
  }
}
