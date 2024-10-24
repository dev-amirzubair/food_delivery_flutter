import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cusotm_body_widget.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/profile/viewModal.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileViewModal>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      profile.goBack(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                      child: Text(
                        "Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            CusotmBodyWidget(
              childern: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ClipOval(
                  //   // clipper: MyClipper(),
                  //   child: Image.asset(
                  //     'assets/imgs/latte.png',
                  //     width: 150,
                  //     height: 150,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      profile.getImage();
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: profile.image == null
                                  ? AssetImage('assets/imgs/add_image.png')
                                  : FileImage(profile.image!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.00),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Enter Your Details',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, right: 15),
                      child: Table(
                        columnWidths: {
                          0: FixedColumnWidth(2),
                          1: FixedColumnWidth(1),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            Text('Name: '),
                            Text(
                              'Suraj shakya',
                              textAlign: TextAlign.start,
                            ),
                          ]),
                          TableRow(children: [
                            Text('Contact: '),
                            Text(
                              '9841222345',
                              textAlign: TextAlign.start,
                            ),
                          ]),
                          TableRow(children: [
                            Text('Location: '),
                            GestureDetector(
                              onTap: () {
                                profile.addLocation(context);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Add location',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: AppColors.blue),
                                  ),
                                  Icon(
                                    Icons.my_location_rounded,
                                    color: AppColors.blue,
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    return Rect.fromLTRB(0, 0, 200, 200);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
