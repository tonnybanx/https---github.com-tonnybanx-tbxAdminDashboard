import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class MembersTab extends StatefulWidget {
  const MembersTab({super.key});

  @override
  State<MembersTab> createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {
  List<String> memberEntry = [
    '45456',
    'Palasidi Robert Bwambale',
    'Kai Havertz',
    '1022102094716',
    '0780166542',
    'robertpalasidi2@gmail.com',
    'UGX 5000000',
    '4',
    'UGX 15,000,000'
  ];
  Color selectedItemColor = const Color.fromARGB(255, 201, 210, 218);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 80;
    double width = MediaQuery.of(context).size.width - 200;
    double scrollwidth = 1400;
    return Expanded(
      child: Container(
        color: Myconstants.color2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              mysearchBar(),
              saccoMembersList(height, width, scrollwidth),
            ],
          ),
        ),
      ),
    );
  }

  Container mysearchBar() {
    return Container(
      height: 40,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search member by PF number or name',
              suffixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))),
        ),
      ),
    );
  }

  Container saccoMembersList(double height, double width, double scrollwidth) {
    return Container(
      height: 0.8 * height,
      width: width,
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      indexedValue(scrollwidth, 0.06, 'PF number', true),
                      indexedValue(scrollwidth, 0.14, 'Names', true),
                      indexedValue(scrollwidth, 0.1, 'Username', true),
                      indexedValue(scrollwidth, 0.1, 'Account no.', true),
                      indexedValue(scrollwidth, 0.1, 'Phone no.', true),
                      indexedValue(scrollwidth, 0.14, 'Email', true),
                      indexedValue(scrollwidth, 0.06, 'Savings', true),
                      indexedValue(scrollwidth, 0.1, 'Shares', true),
                      indexedValue(scrollwidth, 0.1, 'Loan limit', true),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: scrollwidth,
                    height: 0.6 * height,
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        color: (selectedIndex == index)
                                            ? selectedItemColor
                                            : Colors.white,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            indexedValue(scrollwidth, 0.06,
                                                memberEntry[0], false),
                                            indexedValue(scrollwidth, 0.14,
                                                memberEntry[1], false),
                                            indexedValue(scrollwidth, 0.1,
                                                memberEntry[2], false),
                                            indexedValue(scrollwidth, 0.1,
                                                memberEntry[3], false),
                                            indexedValue(scrollwidth, 0.1,
                                                memberEntry[4], false),
                                            indexedValue(scrollwidth, 0.14,
                                                memberEntry[5], false),
                                            indexedValue(scrollwidth, 0.1,
                                                memberEntry[6], false),
                                            indexedValue(scrollwidth, 0.06,
                                                memberEntry[7], false),
                                            indexedValue(scrollwidth, 0.1,
                                                memberEntry[8], false),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: scrollwidth - 20,
                                      child: Divider(
                                          thickness: 1,
                                          color: const Color.fromARGB(
                                              255, 245, 244, 244)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding indexedValue(double width, double length, String text, bool bold) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: length * width,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: bold ? FontWeight.bold : FontWeight.normal),
                ),
              )),
        ],
      ),
    );
  }
}
