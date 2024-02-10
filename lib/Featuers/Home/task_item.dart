import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_project/Core/Model/task_model.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';

class TaskCardItem extends StatelessWidget {
  const TaskCardItem({
    super.key,
    required this.task,
  });

  final TaskModel task;
  Color? getColor(index) {
    if (index == 0) {
      return AppColors.primaryColor;
    } else if (index == 1) {
      return AppColors.orangeColor;
    } else if (index == 2) {
      return AppColors.redColor;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: getColor( task.color),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.whiteColor,
                    ),
                    Text(
                      '${task.startTime} - ${task.endTime}',
                    ),
                  ],
                ),
                Text(task.note, style: TextStyle(color: AppColors.whiteColor)),
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
            const Gap(10),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                (task.isCompleted) ? 'Completed' : 'TO DO',
                style: TextStyle(fontSize: 10, color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
