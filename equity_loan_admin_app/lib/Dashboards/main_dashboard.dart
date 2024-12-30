import 'package:equity_loan_admin_app/Dashboards/dashboard_tab.dart';
import 'package:equity_loan_admin_app/Dashboards/loans_tab.dart';
import 'package:equity_loan_admin_app/Dashboards/members_tab.dart';
import 'package:equity_loan_admin_app/Dashboards/notifications_tab.dart';
import 'package:equity_loan_admin_app/Dashboards/settings_tab.dart';
import 'package:equity_loan_admin_app/Dashboards/transactions_tab.dart';
import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  Color selectedItemColor = Myconstants.color1;
  int dashIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      DashboardTab(),
      LoansTab(),
      MembersTab(),
      TransactionsTab(),
      SettingsTab(),
      NotificationsTab()
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> headings = [
      'Dashboard',
      'Loans',
      'Members',
      'Transactions',
      'Settings',
      'Notifications'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        color: Myconstants.homecolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 210,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        right: BorderSide(
                            color: const Color.fromARGB(255, 240, 239, 239),
                            width: 1)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/sacco log.jpg'))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sacco Dashboard',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        dashboardOption(0, Icons.home, 'Dashboard'),
                        dashboardOption(1, Icons.payment, 'Loans'),
                        dashboardOption(2, Icons.person, 'Members'),
                        dashboardOption(
                            3, Icons.currency_exchange, 'Transactions'),
                        dashboardOption(4, Icons.settings, 'Settings'),
                        dashboardOption(
                            5, Icons.notifications, 'Notifications'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width - 210,
                  height: height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: width - 210,
                        color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  headings[dashIndex],
                                  style: TextStyle(
                                      color: Myconstants.color1, fontSize: 30),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.settings)),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.notifications)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    'assets/images/palasidi.jpg')),
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      tabs[dashIndex]
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding dashboardOption(int position, IconData icon, String header) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 4,
            color: (position == dashIndex)
                ? selectedItemColor
                : Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              icon,
              color:
                  (position == dashIndex) ? Myconstants.color1 : Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () {
                setState(() {
                  dashIndex = position;
                });
              },
              child: Text(header,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: (position == dashIndex)
                        ? selectedItemColor
                        : Colors.black,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
