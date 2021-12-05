import 'package:sqflite/sqflite.dart';

abstract class AppHomePageStates{}
//initial State
class AppHomePageInitialState extends AppHomePageStates{}
//BootomNavigationBar State
class BotomNavigationBarItemsState extends AppHomePageStates{}

//gloating ActionButtonState
class FloatingActionButtonState extends AppHomePageStates{}

//Database

//CreateDatabaseState
class CreateDatabaseState extends AppHomePageStates{}
//OpenDatabaseState
class OpenDatabaseState extends AppHomePageStates{}

//InsertIntoDatabaseStae
class InsertIntoDatabaseStae extends AppHomePageStates{}

//GetDatabaseState
class GetDatabaseState extends AppHomePageStates{}

//UpdateDatabaseState
class UpdateDatabaseState extends AppHomePageStates{}

//DeleteFromDatabaseState
class DeleteFromDatabaseState extends AppHomePageStates{}
