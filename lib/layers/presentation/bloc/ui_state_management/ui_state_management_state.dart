part of 'ui_state_management_bloc.dart';

sealed class UiStateManagementState extends Equatable {
  const UiStateManagementState();

  @override
  List<Object> get props => [];
}

final class UiStateManagementInitial extends UiStateManagementState {}

class UserListloadingState extends UiStateManagementState {
  const UserListloadingState(this.isLoadMoreEventCalled);
  final bool isLoadMoreEventCalled;
  @override
  List<Object> get props => [];
}

class GetUserListInitialState extends UiStateManagementState {
  final List<UserDetails> useDetails;

  const GetUserListInitialState(this.useDetails);
  @override
  List<Object> get props => [useDetails];
}

class MoreUserDetailsLoadedState extends UiStateManagementState {
  final List<UserDetails> useDetails;
  final bool isDataOver;

  const MoreUserDetailsLoadedState(this.useDetails, this.isDataOver);

  @override
  List<Object> get props => [useDetails, useDetails.length, isDataOver];
}
