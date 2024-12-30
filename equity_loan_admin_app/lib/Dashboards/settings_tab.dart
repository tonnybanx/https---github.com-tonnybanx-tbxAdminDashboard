import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  int selectedTab = 0;
  List<bool> visible = [false, false, false];

  bool multiCheck = false;
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: width,
              height: 0.8 * height,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabsRow(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      width: width,
                      child: Divider(
                        thickness: 0.5,
                        color: const Color.fromARGB(255, 241, 237, 237),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: (selectedTab == 0)
                        ? profileTab(width, height)
                        : Container(
                            height: 0.6 * height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Two factor authentication',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        children: [
                                          Switch(
                                              activeColor: Myconstants.color1,
                                              value: multiCheck,
                                              onChanged: (newvalue) {
                                                setState(() {
                                                  multiCheck = newvalue;
                                                });
                                              }),
                                          Text(
                                              'Enable or disable multifactor authentication'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Change password',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    passwordField(1.5 * width,
                                        'Current password', '1234', 0),
                                    passwordField(
                                        1.5 * width, 'New password', '', 1),
                                    passwordField(
                                        1.5 * width, 'Confirm password', '', 2),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Myconstants.color1,
                                            foregroundColor: Colors.white),
                                        onPressed: () {},
                                        child: SizedBox(
                                            height: 40,
                                            child:
                                                Center(child: Text('Save')))),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                )
                              ],
                            ),
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

  Column profileTab(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myProfilepic(),
              Container(
                height: 0.5 * height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    inputField(width, 'Names', 'Bwambale Palasidi Robert'),
                    inputField(width, 'Email', 'robertpalasidi2@gmail.com'),
                    inputField(width, 'Contact', '+256 780166542'),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                height: 0.5 * height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    inputField(width, 'Username', 'Kai Haverts'),
                    passwordField(width, 'Password', '1234', 0),
                    SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Myconstants.color1),
              onPressed: () {},
              child: SizedBox(height: 40, child: Center(child: Text('Save'))),
            ),
            SizedBox(
              width: 20,
            )
          ],
        )
      ],
    );
  }

  Column passwordField(double width, String header, String info, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            header,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        Container(
          height: 50,
          width: 0.3 * width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              obscureText: visible[index] ? false : true,
              controller: TextEditingController(text: info),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible[index] = !visible[index];
                        });
                      },
                      icon: Icon(visible[index]
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }

  Column inputField(double width, String header, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            header,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
        Container(
          height: 50,
          width: 0.3 * width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: TextEditingController(text: info),
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        )
      ],
    );
  }

  Stack myProfilepic() {
    return Stack(
      children: [
        Container(
          height: 120,
          width: 120,
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Myconstants.color1),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/palasidi.jpg')),
              borderRadius: BorderRadius.circular(50)),
        ),
        Positioned(
          bottom: 30,
          right: 5,
          child: Container(
            decoration: BoxDecoration(
                color: Myconstants.color1,
                border: Border.all(width: 1, color: Myconstants.color1),
                borderRadius: BorderRadius.circular(25)),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        )
      ],
    );
  }

  Row tabsRow() {
    return Row(
      children: [
        singleTab('Edit profile', 0),
        SizedBox(
          width: 20,
        ),
        singleTab('Security', 1),
      ],
    );
  }

  Column singleTab(String text, int tabPosition) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                selectedTab = tabPosition;
              });
            },
            child: Text(
              text,
              style: TextStyle(
                  color: (selectedTab == tabPosition)
                      ? Myconstants.color1
                      : Colors.black,
                  fontSize: 14),
            )),
        Container(
          width: 100,
          height: 2,
          color: (selectedTab == tabPosition)
              ? Myconstants.color1
              : Colors.transparent,
        )
      ],
    );
  }
}
