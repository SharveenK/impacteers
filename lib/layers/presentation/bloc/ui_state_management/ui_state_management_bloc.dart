import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:impacteers/layers/data/models/user_details.dart';
import 'package:impacteers/layers/data/models/user_model.dart';
import 'package:impacteers/layers/domain/repo_abstract/user_details_repo.dart';

part 'ui_state_management_event.dart';
part 'ui_state_management_state.dart';

class UiStateManagementBloc
    extends Bloc<UiStateManagementEvent, UiStateManagementState> {
  UiStateManagementBloc(this.userDetailsRepo)
      : super(UiStateManagementInitial()) {
    on<UiStateManagementEvent>((event, emit) {});
    on<GetUserListInitialEvent>(
      (event, emit) async {
        emit(const UserListloadingState(false));
        UserModel userModel = await userDetailsRepo.getList();

        List<UserDetails> userDetails = userModel.data!.toList();
        emit(GetUserListInitialState(userDetails));
      },
    );
    on<GetMoreUserListEvent>(
      (event, emit) async {
        emit(const UserListloadingState(true));
        UserModel userModel =
            await userDetailsRepo.getList(pageIndex: event.pageIndex);

        List<UserDetails> currentPageUserDetails = userModel.data!.toList();
        List<UserDetails> combinedUserDetails = [];
        combinedUserDetails = event.previousUserList + currentPageUserDetails;
        await Future.delayed(const Duration(seconds: 2)).then(
          (value) {
            emit(MoreUserDetailsLoadedState(
                combinedUserDetails, currentPageUserDetails.isEmpty));
          },
        );
      },
    );
  }
  final UserDetailsRepo userDetailsRepo;
}
