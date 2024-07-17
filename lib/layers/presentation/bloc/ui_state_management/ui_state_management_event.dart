part of 'ui_state_management_bloc.dart';

sealed class UiStateManagementEvent extends Equatable {
  const UiStateManagementEvent();

  @override
  List<Object> get props => [];
}

class GetUserListInitialEvent extends UiStateManagementEvent {
  const GetUserListInitialEvent();
  @override
  List<Object> get props => [];
}

class GetMoreUserListEvent extends UiStateManagementEvent {
  final List<UserDetails> previousUserList;
  final int pageIndex;
  const GetMoreUserListEvent(this.previousUserList, this.pageIndex);

  @override
  List<Object> get props => [previousUserList, pageIndex];
}
