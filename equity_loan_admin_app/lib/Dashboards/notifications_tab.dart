import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({super.key});

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  int selectedtab = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 210;
    double height = MediaQuery.of(context).size.height - 80;

    return Container(
      width: width,
      height: height,
      color: Myconstants.color2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                myTab('All', 0),
                myTab('Unread', 1),
                myTab('Read', 2),
              ],
            ),
          ),
          Container(
            color: Myconstants.color2,
            width: width,
            height: height - 60,
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dec 2024',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 0.7 * width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  child: Icon(
                                    color: Myconstants.color1,
                                    Icons.notifications,
                                    size: 30,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Equity Sacco',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: SizedBox(
                                        width: 0.7 * width - 100,
                                        child: Text(
                                          'Dear Robert Palasidi, we are pleased to inform you that loan disbursement of UGX 15,000,000 has been made to account number 1022102094716 on 30th Dec 2024 under transaction ID TXN 7142340 with a tenure of 36 months at an interest of 12% per annum',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '07:00 AM',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              '11/12/2024',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Column myTab(String header, tabIndex) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                selectedtab = tabIndex;
              });
            },
            child: Text(
              header,
              style: TextStyle(
                  color: (selectedtab == tabIndex)
                      ? Myconstants.color1
                      : Colors.black),
            )),
        Container(
          height: 2,
          width: 100,
          color: (selectedtab == tabIndex)
              ? Myconstants.color1
              : Colors.transparent,
        )
      ],
    );
  }
}
