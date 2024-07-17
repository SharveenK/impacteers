import 'package:flutter/material.dart';
import 'package:impacteers/layers/data/models/user_details.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key, required this.userDetail});
  final UserDetails userDetail;

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with TickerProviderStateMixin {
  late Size screenSize;
  late AnimationController _resizableController;
  late AnimationController _textWidgetController;
  late Animation<double> animation;
  late UserDetails _userDetail;

  @override
  void initState() {
    _userDetail = widget.userDetail;
    _textWidgetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
        parent: _textWidgetController, curve: Curves.fastOutSlowIn);
    _textWidgetController.value = 0;
    _textWidgetController.forward();
    _resizableController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _resizableController.dispose();
    _textWidgetController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: AnimatedBuilder(
        animation: _resizableController,
        builder: (context, child) => Container(
          decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                  width: _resizableController.value * 5,
                  color: const Color.fromARGB(255, 227, 242, 87),
                ),
                right: BorderSide(
                  width: _resizableController.value * 5,
                  color: const Color.fromARGB(255, 227, 242, 87),
                )),
          ),
          child: Stack(
            children: [
              SizedBox(
                width: screenSize.width,
                height: screenSize.height * 0.3,
                child: Image.network(
                  _userDetail.avatarUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment(Alignment.topLeft.x, -0.5),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: screenSize.width * 0.3,
                      height: screenSize.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.blue,
                            width: _resizableController.value * 3),
                        borderRadius: BorderRadius.circular(
                          100,
                        ), // More than 50% of width makes it a circle
                      ),
                      child: CircleAvatar(
                        radius: screenSize.width * 0.3,
                        backgroundImage: NetworkImage(
                          _userDetail.avatarUrl,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment(Alignment.topLeft.x, 0.7),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      4,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0, (1.0 - animation.value) * 30, 0),
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100)),
                              ),
                              child: Center(
                                child: Text(
                                    index == 0
                                        ? 'Id : ${_userDetail.id}'
                                        : index == 1
                                            ? 'First Name : ${_userDetail.firstName}'
                                            : index == 2
                                                ? 'Last Name : ${_userDetail.lastName}'
                                                : 'Email Address : ${_userDetail.email}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'SF-Pro',
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic)),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.arrow_back_ios_new_rounded)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
