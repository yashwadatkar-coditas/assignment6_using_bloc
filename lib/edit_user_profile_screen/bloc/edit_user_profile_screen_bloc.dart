import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/data_source/data_source.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_event.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_state.dart';

class EditUserProfileScreenBloc extends Bloc <EditUserProfileScreenEvent,EditUserProfileScreenState>{
  EditUserProfileScreenBloc():super(EditUserProfileScreenLoadingState())
  {
    on<EditUserProfileScreenInitialEvent>(editUserProfileScreenInitialEvent);
on<SavedButtonClickedEvent>(savedButtonClickedEvent);
  }

  FutureOr<void> savedButtonClickedEvent(SavedButtonClickedEvent event, Emitter<EditUserProfileScreenState> emit) {
    userData.add(event.userDataEvent);
     emit(SuccessDataSavedState());
    userData[event.index] = event.userDataEvent;
    
   

    
    
  }

  FutureOr<void> editUserProfileScreenInitialEvent(EditUserProfileScreenInitialEvent event, Emitter<EditUserProfileScreenState> emit) async{
    emit(EditUserProfileScreenLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(EditUserProfileScreenLoadedState());
  }
}