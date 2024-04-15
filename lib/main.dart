import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_bloc.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_event.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_bloc.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_event.dart';
import 'package:magical_change/user_profile_screen/ui/user_profile_screen.dart';


void main()
{
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserProfileScreenBloc>(create: (context) => UserProfileScreenBloc()..add(UserProfileScreenInitialEvent()),
      
      ),

      BlocProvider<EditUserProfileScreenBloc>(create: (context) => EditUserProfileScreenBloc()..add(EditUserProfileScreenInitialEvent()))
    ],
    child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(cardTheme: CardTheme(margin: EdgeInsets.all(10))),
      home: UserProfileScreen(),
    );
  }
}