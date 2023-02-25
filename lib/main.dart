import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(360, 690),
        builder: (context, index) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController? verAnimation;
  AnimationController? horAnimation;
  Widget eye = Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      CircleAvatar(
        radius: 2.r,
        backgroundColor: Colors.black,
      ),
      CircleAvatar(
        radius: 2.r,
        backgroundColor: Colors.black,
      )
    ],
  );
  @override
  void initState() {
    verAnimation = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(seconds: 5));
    horAnimation = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(seconds: 5));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: 360.w,
                    height: 578.h,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 556 * verAnimation!.value.h,
                    left: 350 * horAnimation!.value.w,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Colors.lightGreen,
                      child: Container(width: double.infinity, child: eye),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.blue,
                child: Center(
                  child: Column(children: [
                    InkWell(
                      onTap: () {
                        verAnimation!.reverse();
                        horAnimation!.stop();
                        eye = Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 2.r,
                              backgroundColor: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 2.r,
                              backgroundColor: Colors.black,
                            )
                          ],
                        );
                        verAnimation!.addListener(() {
                          setState(() {});
                        });
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            horAnimation!.reverse();
                            verAnimation!.stop();
                            eye = Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 2.r,
                                  backgroundColor: Colors.black,
                                ),
                                CircleAvatar(
                                  radius: 2.r,
                                  backgroundColor: Colors.black,
                                ),
                              ],
                            );
                            horAnimation!.addListener(() {
                              setState(() {});
                            });
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.arrow_left,
                              size: 24.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        InkWell(
                          onTap: () {
                            horAnimation!.forward();
                            eye = Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                  radius: 2.r,
                                  backgroundColor: Colors.black,
                                ),
                                CircleAvatar(
                                  radius: 2.r,
                                  backgroundColor: Colors.black,
                                )
                              ],
                            );
                            verAnimation!.stop();
                            horAnimation!.addListener(() {
                              setState(() {});
                            });
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.arrow_right,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        verAnimation!.forward();
                        eye = Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 2.r,
                              backgroundColor: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 2.r,
                              backgroundColor: Colors.black,
                            )
                          ],
                        );
                        horAnimation!.stop();
                        verAnimation!.addListener(() {
                          setState(() {});
                        });
                      },
                      child: CircleAvatar(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ]),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {
            verAnimation!.reset();
            horAnimation!.reset();
          });
        },
        child: Container(
            child: Icon(
          Icons.replay_sharp,
          size: 24.sp,
        )),
      ),
    );
  }
}
