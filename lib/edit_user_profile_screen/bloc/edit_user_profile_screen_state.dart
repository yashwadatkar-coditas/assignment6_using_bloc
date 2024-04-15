import 'package:magical_change/data/data_model/user_data_model.dart';

sealed class EditUserProfileScreenState {}

class EditUserProfileScreenLoadingState extends EditUserProfileScreenState{}
class EditUserProfileScreenLoadedState extends EditUserProfileScreenState{
  
}

class SuccessDataSavedState extends EditUserProfileScreenState{}