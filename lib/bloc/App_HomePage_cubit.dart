import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/components/BottomSheetDesign.dart';
import 'package:todo/layout/AppHomePage.dart';
import 'package:todo/screens/ArchivedTasksScreen.dart';
import 'package:todo/screens/DoneTasksScren.dart';
import 'package:todo/screens/NewTaskScren.dart';

import 'App_HomePage_States.dart';

class AppHomePageCubit extends Cubit<AppHomePageStates> {
  AppHomePageCubit() : super(AppHomePageInitialState());
  //public Instance of this cubit
  static AppHomePageCubit get(context) => BlocProvider.of(context);
  //lists
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchievedTasksScreen()
  ];
  List newTasks = [];
  List doneTasks=[];
  List archivedTasks=[];
   
  //variabiles
  Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  IconData fabIcon = Icons.add;
  int currentIndex = 0;
  bool isBottomShetOpened = false;

  //BottomNavBarState
  void onBottomNavBarItemTapped(int index) {
    currentIndex = index;
    emit(BotomNavigationBarItemsState());
  }

//floating ActionButton State
  void onFabButtonTapped(BuildContext context) {
    if (isBottomShetOpened) {
      Navigator.pop(context);
      fabIcon = Icons.add;
      isBottomShetOpened = false;
    } else {
      fabIcon = Icons.edit;
      scaffoldKey.currentState
          .showBottomSheet((context) {
            return BottonSheetDesign(context);
          })
          .closed
          .then((value) {
            fabIcon = Icons.add;
            isBottomShetOpened = false;

            emit(FloatingActionButtonState());
          });
      isBottomShetOpened = true;
    }
    emit(FloatingActionButtonState());
  }

//Database
//1.create Database
//2.insert into database
//3. getdata from database
//4.update database
//5.delete from database


  //1.create Database
  void createDatabase() async {
    database = await openDatabase('todo.db', version: 1,
        onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY,taskName TEXT,taskIntialTime TEXT,taskFinshTime TEXT,taskDate TEXT,status TEXT )')
          .then((value) {
        print('database created successfully');
        emit(CreateDatabaseState());
      }).catchError((error) {
        print('error${error.toString()}');
      });
    }, onOpen: (database) {
      print('database opened');
      getDataFomDatabase(database);
      emit(OpenDatabaseState());
    });
  }


  //2.insert into database
  void insertIntoDatabase({
    @required String taskName,
    @required String taskIntialTime,
    @required String taskFinshTime,
    @required String taskDate,
  }) {
    database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks (taskName,taskIntialTime,taskFinshTime,taskDate,status) VALUES'
              '("$taskName","$taskIntialTime","$taskFinshTime","$taskDate","new")');
    }).then((value) {
      print('$value added Successfully');
      emit(InsertIntoDatabaseStae());
      getDataFomDatabase(database);
    }).catchError((error) {
      print('error${error.toString()}');
    });
  }
//3. getdata from database
void getDataFomDatabase(database){
  newTasks=[];
  doneTasks=[];
  archivedTasks=[];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status']=='new'){
          newTasks.add(element);
        }else if(element['status']=='done'){
          doneTasks.add(element);

        }else{
          archivedTasks.add(element);
        }
      });
      
      emit(GetDatabaseState());
    }).catchError((error){
      print('error${error.toString()}');
    });

}

//updatedatabase
  void updateDatabase(
    @required String status,
    @required int id
    ){

    database.rawUpdate('UPDATE tasks SET status = ? WHERE  id =?',
        ['$status', id]).then((value) {
      print ('$value updated successfully ');
      getDataFomDatabase(database);
      emit(UpdateDatabaseState());

    }).catchError((error){
      print ('error${error.toString()}');
    });
}

  void deleteFromDatabase(
      @required int id
      ){
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      print('$value  deleted  successfully');
      getDataFomDatabase(database);
      emit(DeleteFromDatabaseState());
    }).catchError((error){
      print ('error ${error.toString()}');
    });
    
  }
}
