import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/App_HomePage_States.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';

Widget TaskItemOptions(int id, BuildContext context ){
AppHomePageCubit cubit=AppHomePageCubit.get(context);
  return     BlocConsumer<AppHomePageCubit,AppHomePageStates>(
    listener: (context ,state){},
    builder: (context,state){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(backgroundColor: Colors.white,
          child: IconButton(icon:Icon(Icons.done,color: Colors.black,),onPressed: (){
cubit.updateDatabase('done', id);
          }, ),
        ),
        CircleAvatar(backgroundColor: Colors.white,
          child: IconButton(icon: Icon(Icons.archive,color: Colors.black,),onPressed: (){
            cubit.updateDatabase('archived', id);

          },),
        ),
        CircleAvatar(backgroundColor: Colors.white,
          child: IconButton(icon:Icon(Icons.delete,color: Colors.black,),onPressed: (){
            cubit.deleteFromDatabase(id);
          },),
        ),
      ],);}
  );

}