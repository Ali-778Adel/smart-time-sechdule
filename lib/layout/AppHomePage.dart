import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/App_HomePage_States.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';
import 'package:todo/components/BottomSheetDesign.dart';
import 'package:todo/components/Bottom_Nav_Bar_Widget.dart';

class AppHomePage extends StatelessWidget {

static AppHomePage get(context)=>AppHomePage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppHomePageCubit()..createDatabase(),
      child: BlocConsumer<AppHomePageCubit, AppHomePageStates>(
        builder: (BuildContext context, AppHomePageStates state) {
          AppHomePageCubit cubit = AppHomePageCubit.get(context);

          return Scaffold(
            key:cubit. scaffoldKey,
            appBar: AppBar(
              title: Center(child: Text(cubit.titles[cubit.currentIndex])),backgroundColor: Colors.white10,
            ),
            body: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.screens,
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fabIcon),
              onPressed: (){
                cubit.onFabButtonTapped(context);
              },
            ),

            bottomNavigationBar:
                BottoNavBar(currentIndex: cubit.currentIndex, context: context),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
