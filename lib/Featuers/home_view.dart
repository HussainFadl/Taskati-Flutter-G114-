import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? path;
  @override
  void initState(){
    super.initState();
    path = AppLocal.getCacheData(AppLocal.IMAGE_KEY);
    name = AppLocal.getCacheData(AppLocal.NAME_KEY);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 25,
          backgroundColor: AppColors.greyColor,
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
                        style: getBodyStyle(color: AppColors.primaryColor),
                      ),
                      Text(
                        'Have a nice day',
                        style: getSmallStyle(color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                   CircleAvatar(
                    backgroundImage: path != null? FileImage(File(path!)) as ImageProvider
                    : const  AssetImage('Assets/accountingImage.png'),
                    maxRadius: 25,
                  )
                ],
              ),
              const Gap(10),
              Row(
                children: [
                  Text(
                      style: getTitleStyle(),
                      DateFormat.yMMMd().format(
                        DateTime.now(),
                      )),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: '+ Add Task',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              Text(
                'Today',
                style: getTitleStyle(),
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
                    onDateChange: (date) {
                      // New date selected
                      // setState(() {
                      //   _selectedValue = date;
                      // });
                    },
                    height: 114,
                    width: 75,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(itemCount: 3,itemBuilder: (context, index){
                   return  Container(
                    margin:const  EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),

                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text('data',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                              ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.watch_later_outlined,
                                  color: AppColors.whiteColor,),
                                  Text('data',
                                  style: TextStyle(
                                    color: AppColors.whiteColor
                                  ),),
                                ],
                              ),
                              Text('data',
                              style: TextStyle(
                                color: AppColors.whiteColor
                              )),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 70,
                            width: 0.5,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                         const  Gap(10),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Text('TO DO',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.whiteColor
                            ),),
                          ),
                        ],
                      ),
                    ),
                    
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
