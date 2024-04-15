import 'package:magical_change/data/data_model/user_data_model.dart';

sealed class UserProfileScreenState{}

class UserProfileScreenLoadingState extends UserProfileScreenState{}
class UserProfileScreenLoadedState extends UserProfileScreenState{
  final List<UserDataModel> userDataList;

  UserProfileScreenLoadedState({required this.userDataList}); 
}
class UserProfileScreenErrorState extends UserProfileScreenState{}

class NavigateToEditUserProfileScreenState extends UserProfileScreenState{
  final UserDataModel userDataModel;
  final int index;

  NavigateToEditUserProfileScreenState({required this.index , required this.userDataModel});
}