import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/App_HomePage_States.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';
import 'package:todo/components/TaskItem.dart';
import 'package:todo/components/Task_Item.dart';

class ArchievedTasksScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AppHomePageCubit cubit = AppHomePageCubit.get(context);
    return BlocConsumer<AppHomePageCubit, AppHomePageStates>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: cubit.archivedTasks.length,
              itemBuilder: (context, index) {
                return Task_Item(model:cubit.archivedTasks[index],context: context);
              });
        },
        listener: (context, state) {});
  }
}
