import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati_project/Core/Model/task_model.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';
import 'package:taskati_project/Featuers/AddTask/add_task_view.dart';
import 'package:taskati_project/Featuers/Home/task_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? path;
  @override
  void initState() {
    super.initState();
    path = AppLocal.getCacheData(AppLocal.IMAGE_KEY);
    name = AppLocal.getCacheData(AppLocal.NAME_KEY);
  }

  String selectedDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 25,
          backgroundColor: Colors.blue[200],
          title: Text(
            'I am AppBar',
            style: getTitleStyle(),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '''Hello, $name''',
                      ),
                      const Text(
                        'Have a nice day',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundImage: path != null
                        ? FileImage(File(path!)) as ImageProvider
                        : const AssetImage('Assets/accountingImage.png'),
                    maxRadius: 50,
                  )
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Text(
                      style: getTitleStyle(color: Colors.white),
                      DateFormat.yMMMd().format(
                        DateTime.now(),
                      )),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: CustomButton(
                        text: '+ Add Task',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AddTaskView()));
                        }),
                  )
                ],
              ),
              Text(
                'Today',
                style: getTitleStyle(color: AppColors.whiteColor),
              ),
              const Gap(20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: AppColors.primaryColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: TextStyle(color: Colors.white),
                    monthTextStyle: TextStyle(color: Colors.grey[100]),
                    dayTextStyle: TextStyle(color: AppColors.whiteColor),
                    onDateChange: (date) {
                      setState(() {
                        selectedDate = DateFormat.yMd().format(date);
                      });
                    },
                    height: 114,
                    width: 75,
                  ),
                ],
              ),
              Expanded(
                  child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                builder: (context, Box<TaskModel> value, child) {
                  List<TaskModel> tasks = [];
                  for (var element in value.values) {
                    if (selectedDate == element.date) {
                      tasks.add(element);
                    }
                  }
                  return tasks.isEmpty?  
                      Center(child: Text('You Have no Tasks this day ...')):
                   ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      TaskModel task = tasks[index];
                      return  
                      Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            margin: EdgeInsets.all(30),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 40,
                                  ),
                                  Text(
                                    'Completed',
                                    style:
                                        TextStyle(color: AppColors.blackColor),
                                  )
                                ],
                              ),
                            ),
                            color: AppColors.greenColor,
                          ),
                          secondaryBackground: Container(
                            margin: EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete_forever_outlined,
                                  size: 40,
                                ),
                                Text(
                                  'Deleted',
                                  style: TextStyle(color: AppColors.blackColor),
                                )
                              ],
                            ),
                            color: AppColors.redColor,
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              // complete
                              value.put(
                                  task.id,
                                  TaskModel(
                                      id: task.id,
                                      title: task.title,
                                      note: task.note,
                                      startTime: task.startTime,
                                      endTime: task.endTime,
                                      color: 3,
                                      isCompleted: true,
                                      date: task.date));
                            } else {
                              // delete
                              value.delete(task.id);
                            }
                          },
                          child: TaskCardItem(task: task));
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
