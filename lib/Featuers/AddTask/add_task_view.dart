import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int colorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
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
                InkWell(
                  onTap: () {
                    setState(() {
                      colorIndex = 1;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.redColor,
                    child: (colorIndex == 1)
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
                      colorIndex = 2;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.orangeColor,
                    child: (colorIndex == 2)
                        ? Icon(Icons.check, color: AppColors.whiteColor)
                        : const SizedBox(),
                  ),
                ),
                Spacer(),
                CustomButton(
                  text: 'data',
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
