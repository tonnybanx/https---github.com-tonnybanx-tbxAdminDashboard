import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:equity_loan_admin_app/login/main.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Row(
          children: [
            Container(
              width: 0.6 * width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/vector.png'))),
              child: Padding(
                padding: const EdgeInsets.all(80),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ellipse 1.png')))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to EQUITY SACCO',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Manage all your sacco operations in one place efficiently and securely. Whether you're tracking disburstments,reviewing transactions or managing user accounts,you have all the tools you need to oversee the system effortlessly.",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              'Equity Sacco, Empowering lives.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
            Container(
              width: 0.4 * width,
              height: height,
              color: Myconstants.homecolor,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/sacco log.jpg'))),
                          ),
                          Text(
                            'EQUITY SACCO',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Reset password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    passwordFields(width, 'New password', 'Enter new password'),
                    passwordFields(
                        width, 'Confirm password', 'Enter new password'),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        title: "Equity sacco",
                                      )));
                        },
                        child: Container(
                          height: 50,
                          width: 0.4 * width,
                          decoration: BoxDecoration(
                              color: Myconstants.color1,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'Reset',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding passwordFields(double width, String header, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              header,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: 0.4 * width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 1)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: TextField(
                  obscureText: visible ? false : true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          icon: Icon(
                            visible ? Icons.visibility : Icons.visibility_off,
                          )),
                      border: InputBorder.none,
                      hintText: hintText),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
