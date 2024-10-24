import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/login/signin/signin_widget.dart';
import 'package:food_delivery/app/modules/login/signup/signup_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Image.asset(
                'assets/imgs/splash.png',
                // height: 350,
                fit: BoxFit.fitWidth,
              ),
            ),
            // White rounded container with Tabs
            Positioned(
              top: 250, // Adjust this value as needed
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Column(
                    children: [
                      // TabBar
                      TabBar(
                        indicatorColor: AppColors.primaryColor,
                        dividerColor: Colors.transparent,
                        labelColor: AppColors.black,
                        unselectedLabelColor: AppColors.grey,
                        tabs: [
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                tr('login'),
                              ),
                            ),
                          ),
                          Tab(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                tr('signUp'),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      // TabBarView for content

                      Expanded(
                        child: TabBarView(
                          children: [
                            // Login Tab Content
                            LoginTab(),
                            // Register Tab Content
                            SignUpTab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
