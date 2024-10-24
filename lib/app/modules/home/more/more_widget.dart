import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cusotm_body_widget.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/routes/routes.dart';
import 'package:food_delivery/app/modules/home/more/viewmodel.dart';
import 'package:provider/provider.dart';

class MoreWidget extends StatefulWidget {
  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  bool darkMode = false;
  bool pushNotifications = false;
  @override
  Widget build(BuildContext context) {
    final more = Provider.of<MoreViewModal>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 140,
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/imgs/more_banner.png',
                width: 180,
                height: 135,
                alignment: Alignment.topRight,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          // Wrap ListView.separated inside Expanded to handle scrolling properly
          CusotmBodyWidget(
            childern: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: Column(
                      children: [
                        Text(
                          tr('more'),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              CustomTile(
                                title: tr('profile'),
                                tailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () {
                                  // print('On Profile Tap');
                                  more.profilePress(context);
                                },
                              ),
                              CustomTile(
                                title: tr('darkMode'),
                                tailing: Switch(
                                  value: darkMode,
                                  onChanged: (bool value) {
                                    // Handle switch change
                                    setState(() {
                                      darkMode = value;
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    darkMode = !darkMode;
                                  });
                                },
                              ),
                              CustomTile(
                                title: tr('pushNotification'),
                                tailing: Switch(
                                  value: pushNotifications,
                                  onChanged: (bool value) {
                                    // Handle switch change
                                    setState(() {
                                      pushNotifications = value;
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    pushNotifications = !pushNotifications;
                                  });
                                },
                              ),
                              CustomTile(
                                title: tr('help'),
                                tailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () {
                                  print('On Help Tap');
                                },
                              ),
                              CustomTile(
                                title: tr('language'),
                                tailing: DropdownButton<String>(
                                  value: context.locale.languageCode,
                                  icon: Icon(Icons.language),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      context.setLocale(Locale(newValue));
                                    }
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: 'en',
                                      child: Text('English'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ur',
                                      child: Text('اردو'),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  print('Langage!');
                                },
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Text(
                                      tr('sendUsFeedback'),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomTile(
                                title: tr('chatWithUs'),
                                tailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () {
                                  Navigator.pushNamed(context, RouteName.chat);
                                },
                              ),
                              CustomTile(
                                title: tr('showMore'),
                                tailing: Icon(Icons.arrow_forward_ios_rounded),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.showMore);
                                  print('On Help Tap');
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  more.logout(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      tr('logout'),
                                      style: TextStyle(
                                          color: AppColors.red, fontSize: 18),
                                    ),
                                    Image.asset(
                                      'assets/imgs/logout.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final Widget tailing;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.title,
    required this.tailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      trailing: tailing,
      onTap: onTap,
    );
  }
}
