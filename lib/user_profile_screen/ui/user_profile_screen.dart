import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/data_source/data_source.dart';
import 'package:magical_change/edit_user_profile_screen/ui/ui/edit_user_profile_screen.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_bloc.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_event.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_state.dart';
import 'package:magical_change/user_profile_screen/widgets/user_profile_screen_card.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile Screen')),
      body: BlocConsumer<UserProfileScreenBloc,UserProfileScreenState>(
        buildWhen: (previous, current) => current is! NavigateToEditUserProfileScreenState ,
        builder: (context, state) {
        switch(state.runtimeType)
        {
        case UserProfileScreenLoadingState:
        return Center(
          child: CircularProgressIndicator(),
        );

        case UserProfileScreenLoadedState:
        final loadedState = state as UserProfileScreenLoadedState;
        return ListView.builder(
          itemCount: loadedState.userDataList.length,
          itemBuilder: (context, index) {
            
            return UserProfileScreenCard(userDataModel: userData[index], index: index);
          },);

          case UserProfileScreenErrorState:
          return Center(child: Text('Some Error has Ocurred'));

          default :
          return Center(child: Text('Data not found'));
        }
      }, 
      listenWhen: (previous, current) => current is NavigateToEditUserProfileScreenState,
      listener: (context, state) {
        final navigateState = state as NavigateToEditUserProfileScreenState;
        if(state is NavigateToEditUserProfileScreenState)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserProfileScreen(userListData: navigateState.userDataModel, index: navigateState.index),));
        }
      },),
    );
  }
}