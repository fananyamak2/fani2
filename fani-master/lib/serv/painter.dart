import 'package:fani/main.dart';
import 'package:flutter/material.dart';

class Painter extends StatefulWidget {
  const Painter({super.key});

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
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
//   child: PainterImage != null
//       ? ClipOval(
//           child: Image(
//             image: PainterImage,
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
