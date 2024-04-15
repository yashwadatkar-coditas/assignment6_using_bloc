import 'package:magical_change/data/data_model/user_data_model.dart';

sealed class EditUserProfileScreenEvent{}

class EditUserProfileScreenInitialEvent extends EditUserProfileScreenEvent{}
class SavedButtonClickedEvent extends EditUserProfileScreenEvent{
  final UserDataModel userDataEvent;
  final int index;

  SavedButtonClickedEvent({required this.userDataEvent, required this.index});
}
class CancleButtonClickedEvent extends EditUserProfileScreenEvent{}