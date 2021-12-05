import 'package:flutter/material.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';


Widget BottoNavBar({int currentIndex,BuildContext context}) {
  AppHomePageCubit cubit=AppHomePageCubit.get(context);
  return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index){
        cubit.onBottomNavBarItemTapped(index);

},
      type: BottomNavigationBarType.shifting,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'New Tasks',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done Tasks',
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archived Tasks',
            backgroundColor: Colors.black),
      ]);
}
