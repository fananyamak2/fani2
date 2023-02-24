import 'package:fani/main.dart';
import 'package:flutter/material.dart';
import 'package:fani/animation/FadeAnimation.dart';
import 'package:fani/pages/date_time.dart';
import 'package:flutter/material.dart';

class Clean extends StatefulWidget {
  const Clean({super.key});

  @override
  State<Clean> createState() => _CleanState();
}

class _CleanState extends State<Clean> {
  List<dynamic> _rooms = [
    [
      'غرفة المعيشة',
      'https://img.icons8.com/officel/2x/living-room.png',
      Colors.red,
      0
    ],
    [
      'غرفة نوم',
      'https://img.icons8.com/fluency/2x/bedroom.png',
      Colors.orange,
      1
    ],
    ['حمام', 'https://img.icons8.com/color/2x/bath.png', Colors.blue, 1],
    ['مطبخ', 'https://img.icons8.com/dusk/2x/kitchen.png', Colors.purple, 0],
    ['مكتب', 'https://img.icons8.com/color/2x/office.png', Colors.green, 0]
  ];

  List<int> _selectedRooms = [];
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
//   child: CleanImage != null
//       ? ClipOval(
//           child: Image(
//             image: CleanImage,
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

        // backgroundColor: Colors.white,
        floatingActionButton: _selectedRooms.length > 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DateAndTime()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_selectedRooms.length}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
                backgroundColor: Colors.blue,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    //  'Where do you want \ncleaned?',
                    'ما الذي تريد تنظيفه؟',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _rooms.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                      (1.2 + index) / 4, room(_rooms[index], index));
                }),
          ),
        ),
      ),
    );
  }

  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedRooms.contains(index))
            _selectedRooms.remove(index);
          else
            _selectedRooms.add(index);
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _selectedRooms.contains(index)
                ? room[2].shade50.withOpacity(0.5)
                : Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.network(
                        room[1],
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        room[0],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  _selectedRooms.contains(index)
                      ? Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 20,
                          ))
                      : SizedBox()
                ],
              ),
              (_selectedRooms.contains(index) && room[3] >= 1)
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "كم  ${room[0]}?",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 45,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        room[3] = index + 1;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10.0),
                                      padding: EdgeInsets.all(10.0),
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: room[3] == index + 1
                                            ? room[2].withOpacity(0.5)
                                            : room[2].shade200.withOpacity(0.5),
                                      ),
                                      child: Center(
                                          child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      )),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          )),
    );
  }
}
