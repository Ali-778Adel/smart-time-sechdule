import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/bloc/App_HomePage_States.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';

Widget BottonSheetDesign(BuildContext context){
  TextEditingController taskName=TextEditingController();
  TextEditingController taskInitialTime=TextEditingController();
  TextEditingController taskFinshTime=TextEditingController();
  TextEditingController taskDate=TextEditingController();

  final formKey = GlobalKey<FormState>();
  return BlocConsumer<AppHomePageCubit,AppHomePageStates>(
    listener: (context,state){},
    builder: (context,state) {
      AppHomePageCubit cubit=AppHomePageCubit.get(context);
      return Container(
        height: MediaQuery
            .of( context )
            .size
            .height * .4,

        width: double.infinity,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.all( 5 ),
                    decoration: BoxDecoration(
                        color: Color( 0xFFEDE7F6 ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular( 5.0 ),
                            bottomRight: Radius.circular( 5.0 ) ) ),
                    child: TextFormField(
                      controller: taskName,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: Icon(
                              Icons.title ), //icon of text field
                          hintText: 'Enter Task Name'
                        //label text of field
                      ),
                    ),
                  ) ),
              SizedBox(
                height: 1,
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.all( 5 ),
                  decoration: BoxDecoration(
                      color: Color( 0xFFEDE7F6 ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular( 5.0 ),
                          bottomRight: Radius.circular( 5.0 ) ) ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: taskInitialTime,
                        autocorrect: false,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            icon:
                            Icon( Icons.timer ), //icon of text field
                            hintText: 'Enter Task InitialTime'

                          //label text of field
                        ),
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now( ) )
                              .then( (value) {
                            taskInitialTime.text =
                                value.format( context ).toString( );
                            print( value.format( context ).toString( ) );
                          } );
                        },
                      ),
                      TextFormField(
                        controller: taskFinshTime,
                        autocorrect: false,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            icon:
                            Icon( Icons.timer_off ), //icon of text field
                            hintText: 'Enter Task FinshTime'

                          //label text of field
                        ),
                        onTap: () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now( ) )
                              .then( (value) {
                            taskFinshTime.text =
                                value.format( context ).toString( );
                            print( value.format( context ).toString( ) );
                          } );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.all( 5 ),
                  decoration: BoxDecoration(
                      color: Color( 0xFFEDE7F6 ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular( 5.0 ),
                          bottomRight: Radius.circular( 5.0 ) ) ),
                  child: TextFormField(
                    controller: taskDate,
                    autocorrect: false,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        icon: Icon( Icons.date_range ),
                        hintText: 'Enter Task Date' ),
                    onTap: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now( ),
                          firstDate: DateTime.now( ),
                          lastDate:
                          DateTime.parse( '2022-12-01' ) )
                          .then( (value) {
                        taskDate.text =
                            DateFormat.yMMMd( ).format( value );
                        print( DateFormat.yMMMd( ).format( value ) );
                      } );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Expanded(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.all( 5 ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular( 5.0 ),
                            bottomRight: Radius.circular( 5.0 ) ) ),
                    child: ElevatedButton(
                      child: Text( 'Ok' ),
                      onPressed: () {
                        cubit.insertIntoDatabase(taskName:taskName.text, taskIntialTime:taskInitialTime.text, taskFinshTime:taskFinshTime.text, taskDate:taskDate.text);



                      },
                    ),
                  ) ),
              SizedBox(
                  height: 1
              ),
            ],
          ),
        ),
      );

    });

}