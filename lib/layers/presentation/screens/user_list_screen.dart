import 'package:flutter/material.dart';
import 'package:impacteers/layers/data/models/user_details.dart';
import 'package:impacteers/layers/presentation/bloc/ui_state_management/ui_state_management_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:impacteers/layers/presentation/screens/user_details_screen.dart';
import '../../domain/repo_imp/user_details_imp_repo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 1;
  late ScrollController _listViewController;
  List<UserDetails> useDetails = [];
  late UiStateManagementBloc uiStateManagementBloc;
  bool _isLoadMore = false;
  @override
  void initState() {
    _listViewController = ScrollController();
    _listViewController.addListener(
      () {
        if (_listViewController.position.maxScrollExtent ==
                _listViewController.offset &&
            !_isLoadMore) {
          _isLoadMore = true;
          _pageIndex += 1;
          uiStateManagementBloc
              .add(GetMoreUserListEvent(useDetails, _pageIndex));
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UiStateManagementBloc>(
      create: (_) => UiStateManagementBloc(UserDetailsimp()),
      child: Builder(builder: (builderContext) {
        uiStateManagementBloc =
            BlocProvider.of<UiStateManagementBloc>(builderContext);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Users'),
          ),
          body: Center(
              child: BlocBuilder<UiStateManagementBloc, UiStateManagementState>(
            bloc: BlocProvider.of<UiStateManagementBloc>(builderContext)
              ..add(const GetUserListInitialEvent()),
            buildWhen: (previous, current) {
              if (current is UserListloadingState &&
                  current.isLoadMoreEventCalled) {
                return true;
              }
              if (current is GetUserListInitialState) {
                useDetails.addAll(current.useDetails);
                return true;
              }
              if (current is MoreUserDetailsLoadedState) {
                _isLoadMore = false;
                if (current.isDataOver) {
                  const snackBar = SnackBar(
                    content: Text('No more data available'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return true;
                }
                useDetails = [];
                useDetails.addAll(current.useDetails);
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                child: ListView.builder(
                  controller: _listViewController,
                  itemCount: useDetails.length +
                      ((state is UserListloadingState &&
                              state.isLoadMoreEventCalled)
                          ? 1
                          : 0),
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    if (state is UserListloadingState &&
                        state.isLoadMoreEventCalled &&
                        useDetails.length == index) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailScreen(
                                  userDetail: useDetails[index],
                                ),
                              ));
                        },
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              AnimatedSize(
                                duration: const Duration(milliseconds: 500),
                                child: Image.network(
                                  useDetails[index].avatarUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Flexible(
                                child: ListTile(
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Text(
                                      '${useDetails[index].firstName} ${useDetails[index].lastName}',
                                      style: const TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    useDetails[index].email,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )),
        );
      }),
    );
  }
}
