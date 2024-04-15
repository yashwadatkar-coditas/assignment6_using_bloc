sealed class UserProfileScreenEvent {}

class UserProfileScreenInitialEvent extends UserProfileScreenEvent{}
class UserProfileScreenEditButtonClickedEvent extends UserProfileScreenEvent{
  final int index;

  UserProfileScreenEditButtonClickedEvent({required this.index});
}
class UserProfileScreenDeleteButtonClickedEvent extends UserProfileScreenEvent{
  final int index;

  UserProfileScreenDeleteButtonClickedEvent({required this.index});
}
