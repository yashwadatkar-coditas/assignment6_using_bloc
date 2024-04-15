import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/data_model/user_data_model.dart';
import 'package:magical_change/data/data_source/data_source.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_event.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_state.dart';

class UserProfileScreenBloc extends Bloc <UserProfileScreenEvent,UserProfileScreenState>{
  UserProfileScreenBloc():super(UserProfileScreenLoadingState()
  
  )
  {
    on<UserProfileScreenInitialEvent>(userProfileScreenInitialEvent);
    on<UserProfileScreenEditButtonClickedEvent>(userProfileScreenEditButtonClickedEvent);
    on<UserProfileScreenDeleteButtonClickedEvent>(userProfileScreenDeleteButtonClickedEvent);
  }

  FutureOr<void> userProfileScreenInitialEvent(UserProfileScreenInitialEvent event, Emitter emit) async{
    emit(UserProfileScreenLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(UserProfileScreenLoadedState(userDataList: userData.map((e) => UserDataModel(name: e.name, email: e.email, address: e.address, avatar: e.avatar, phoneNumber: e.phoneNumber)).toList()));
  }

  FutureOr<void> userProfileScreenDeleteButtonClickedEvent(UserProfileScreenDeleteButtonClickedEvent event, Emitter<UserProfileScreenState> emit) {
    userData.removeAt(event.index);
    emit(UserProfileScreenLoadedState(userDataList: userData.map((e) => UserDataModel(name: e.name, email: e.email, address: e.address, avatar: e.avatar, phoneNumber: e.phoneNumber)).toList()));
  }

  FutureOr<void> userProfileScreenEditButtonClickedEvent(UserProfileScreenEditButtonClickedEvent event, Emitter<UserProfileScreenState> emit) {
    emit(NavigateToEditUserProfileScreenState(index: event.index, userDataModel: userData[event.index]));
  }
}