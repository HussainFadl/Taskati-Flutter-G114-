

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 25,
          backgroundColor: AppColors.greyColor,
          title:Text('I am AppBar',
          style: getTitleStyle(),),
          centerTitle: true,),
        body:  Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Hello, Hussain',
                      style: getTitleStyle(color: AppColors.primaryColor),),
                      Text('Have a nice day',
                      style: getSmallStyle(color: AppColors.blackColor),),
                    ],
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    backgroundImage: AssetImage('Assets/accountingImage.png'),
                    maxRadius:25  ,
                  )
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    style: getTitleStyle(),
                    DateFormat.yMMMd().format(DateTime.now(),
                    )
                  ),
                  
                  Spacer(),
                  CustomButton(text: '+ Add Task', onPressed: () {
                    
                  },)
                ],
              ),
              Text(
                    'Today',
                    style: getSmallStyle(),
                   )
                  ,
          
          
            ],
          ),
        ),
      ),
    );
  }
}