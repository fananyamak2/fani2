import 'package:fani/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:fani/pages/cleaning.dart';
import 'package:fani/serv/clean.dart';
import 'package:fani/serv/gardener.dart';
import 'package:fani/serv/electric.dart';
import 'package:fani/serv/plumber.dart';
import 'package:fani/serv/carpenter.dart';
import 'package:fani/serv/painter.dart';
import 'package:fani/serv/salon.dart';
import 'package:fani/serv/gas.dart';
import 'package:fani/serv/cc.dart';
import 'package:fani/serv/ccc.dart';
import 'dart:async';
import 'package:fani/animation/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/rendering.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class Service {
  final String name;
  final String imageURL;
  final String pageURL;
  Widget nextpage;
  Service(this.name, this.imageURL, this.pageURL, this.nextpage);
}

//  onTap: () {
//         setState(() {
//           if (selectedService == index)
//             selectedService = -1;
//           else
//             selectedService = index;
//         });
//       },

class _UserState extends State<User> {
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;
  int selectedService = -1;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  List<Service> services = [
    Service('بُستاني', 'images/gardening.png', 'gardener', const Gardener()),
    Service('كهربائي', 'images/electrical.png', 'electric', const Electric()),
    Service('مُنظف', 'images/cleaning.png', 'clean', const Clean()),
    Service('سَباك', 'images/plumber.png', 'plumber', const Plumber()),
    Service('نجار', 'images/carpenter.png', 'carpenter', const Carpenter()),
    Service('دهان', 'images/paint.png', 'painter', const Painter()),
    Service('كوفيرا', 'images/makeup.png', 'salon', const Salon()),
    Service('عامل غاز', 'images/gas.png', 'gas', const Gas()),
    Service('بُستاني', 'images/clean.png', 'cc', const Cc()),
    Service('كهربائي', 'images/clean.png', 'ccc', const Ccc()),
  ];
  bool showBtmAppBr = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: selectedService >= 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => services[selectedService].nextpage,
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                backgroundColor: Colors.blue,
              )
            : null,
        appBar: AppBar(
          backgroundColor: dy,
          title: Text(
            'مرحبا, شهد بلال ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          automaticallyImplyLeading: false,
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              SizedBox(
                  // height: 2,
                  ),
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: dy),
                accountName: Text(
                  "شهد بلال",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  "shahd@example.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
//                 currentAccountPicture: CircleAvatar(
//   backgroundColor: Colors.white,
//   child: userImage != null
//       ? ClipOval(
//           child: Image(
//             image: userImage,
//           ),
//         )
//       : Text(
//           firstChar,
//           style: TextStyle(fontSize: 28),
//         ),
// ),
                currentAccountPicture: ClipOval(
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage("images/sh.jpg"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 1,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(236, 231, 150, 74),
                        blurRadius: 10.0,
                      ),
                    ],
                  )),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: db,
                ),
                title: Text(
                  "صفحتي الشخصية",
                  style: TextStyle(color: db, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("foruser");
                  print("foruser profiles");
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(Icons.notification_add, color: db),
                title: Text(
                  "الإشعارات",
                  style: TextStyle(color: db, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("notifi");
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color: db,
                ),
                title: Text(
                  "الرسائل",
                  style: TextStyle(color: db, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  //  Navigator.of(context).pushNamed("mess");
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(
                  Icons.add_home_work,
                  color: db,
                ),
                title: Text(
                  " الخدمات التي قمت بحجزها",
                  style: TextStyle(color: db, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  //  Navigator.of(context).pushNamed("request");
                },
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: db,
                ),
                title: Text(
                  " تسجيل الخروج",
                  style: TextStyle(color: db, fontWeight: FontWeight.w300),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("home");
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  pageNo = index;
                  setState(() {});
                },
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Hello you tapped at ${index + 1} "),
                          ),
                        );
                      },
                      onPanDown: (d) {
                        carasouelTmer?.cancel();
                        carasouelTmer = null;
                      },
                      onPanCancel: () {
                        carasouelTmer = getTimer();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 8, left: 8, top: 24, bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // controller: cmob,

                decoration: InputDecoration(
                  hintText: 'ما هي الخدمة التي تريدها ؟',
                  hintStyle: TextStyle(color: db),
                  helperText: '',
                  // hintText: ' ',
                  prefixIcon: Icon(Icons.search_sharp, color: db),
                  suffixIcon: Icon(Icons.camera_alt, color: db),
                  // icon: Icon(Icons.search, color: db),
                ),
                validator: (value) {
                  print(value);
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //4
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0, //5
                  mainAxisSpacing: 30.0,
                ),
                // physics: NeverScrollableScrollPhysics(),
                // itemBuilder: (BuildContext context, int index) {
                //   return FadeAnimation(
                //       (1.0 + index) / 4,
                //       serviceContainer(
                //           "no", //services[index].imageURL,
                //           services[index].name,
                //           index));
                // }
                itemBuilder: (context, index) {
                  return InkResponse(
                    onTap: () {
                      setState(() {
                        if (selectedService == index)
                          selectedService = -1;
                        else
                          selectedService = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedService == index
                            ? Colors.blue.shade50
                            : Colors.grey.shade100,
                        border: Border.all(
                          color: selectedService == index
                              ? Colors.blue
                              : Colors.blue.withOpacity(0),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        // color: Color(0xffF4F3F4),
                        // borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //serviceContainer(services[index].imageURL,services[index].name, index),
                          Image.asset(
                            services[index].imageURL,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            services[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}
