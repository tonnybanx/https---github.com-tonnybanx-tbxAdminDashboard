import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class LoansTab extends StatefulWidget {
  LoansTab({super.key});

  @override
  State<LoansTab> createState() => _LoansTabState();
}

class _LoansTabState extends State<LoansTab> {
  int selectedtab = 0;
  int selectedDetail = 0;
  int selectedLoantype = 0;

  bool needsDetails = false;
  bool manageLoans = false;
  List<List<String>> runningLoans = [
    [
      '1',
      '42784',
      'Robert Palasidi Bwambale owe kassese',
      'Personal',
      'UGX 5000000000',
      'UGX 1000000',
      'UGX 30000',
      '12/09/2024',
      'Atuyambe Shimon',
      '45621',
      'Alimu Gavin',
      '46210',
      '5%'
    ],
    [
      '2',
      '42788',
      'Agaba Chris',
      'Emergency',
      'UGX 500000',
      'UGX 100000',
      'UGX 20000',
      '12/09/2024',
      'Atuyambe Shimon',
      '45621',
      'Alimu Gavin',
      '46210',
      '5%'
    ],
    [
      '3',
      '42783',
      'Owino Moses',
      'Development',
      'UGX 7000000',
      'UGX 4000000',
      'UGX 40000',
      '12/09/2024',
      'Atuyambe Shimon',
      '45621',
      'Alimu Gavin',
      '46210',
      '5%'
    ],
    [
      '4',
      '42774',
      'Duncan Abraham',
      'Emergency',
      'UGX 7000000',
      'UGX 1000000',
      'UGX 30000',
      '12/09/2024',
      'Atuyambe Shimon',
      '45621',
      'Alimu Gavin',
      '46210',
      '5%'
    ]
  ];
  List<List<String>> loantypes = [
    ['Personal loan', '5%', '12 months', 'For self reliance'],
    [
      'Emergency loan',
      '5%',
      '6 months',
      'miscelleneous occurences that might happen'
    ],
    ['School fees loan', '5%', '6 months', 'Paying for children school fees'],
    [
      'Long term loan',
      '5%',
      '24 months',
      'Loans that may take a long period of time approaching two years'
    ]
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 250;
    double height = MediaQuery.of(context).size.height - 80;
    double scrollwidth = 1200;
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Myconstants.color2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                manageCategories(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Active loan overview',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        loanTab('Pending', 0),
                        loanTab('Approved', 1),
                        loanTab('Running', 2),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Search loan by PF number",
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 0.6 * height,
                  width: scrollwidth,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Stack(
                        children: [
                          runningLoanContainer(scrollwidth, context, height),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          needsDetails ? myLoanDetailsOverlay(width) : Container(),
          manageLoans
              ? Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Container(
                    width: width,
                    height: 650,
                    decoration: BoxDecoration(
                        color: Myconstants.color2,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 197, 195, 195))),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    hoverColor:
                                        const Color.fromARGB(255, 199, 57, 14),
                                    onPressed: () {
                                      setState(() {
                                        manageLoans = false;
                                      });
                                    },
                                    icon: Icon(Icons.close))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 600,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: scrollwidth,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              style: ElevatedButton.styleFrom(
                                                  iconColor: Colors.blue),
                                              onPressed: () {},
                                              icon: Icon(Icons.delete)),
                                          IconButton(
                                              style: ElevatedButton.styleFrom(
                                                  iconColor: Colors.blue),
                                              onPressed: () {},
                                              icon: Icon(Icons.edit)),
                                          IconButton(
                                              style: ElevatedButton.styleFrom(
                                                  iconColor: Colors.blue),
                                              onPressed: () {},
                                              icon: Icon(Icons.add))
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        indexedInput(
                                            Text('Type'), 1.5 * scrollwidth),
                                        indexedInput(Text('interest'),
                                            1.5 * scrollwidth),
                                        indexedInput(Text('Duration'),
                                            1.5 * scrollwidth),
                                        indexedInput(Text('Description'),
                                            1.5 * scrollwidth)
                                      ],
                                    ),
                                    Container(
                                      width: scrollwidth,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey, width: 1)),
                                      child: ListView.builder(
                                          itemCount: loantypes.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: singleLoantypeEntry(
                                                  index, scrollwidth),
                                            );
                                          }),
                                    ),
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 40),
                                              child: SizedBox(
                                                width: scrollwidth,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    loanInputfield('Type'),
                                                    loanInputfield('Interest'),
                                                    loanInputfield('Duration'),
                                                    loanInputfield(
                                                        'Description'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: SizedBox(
                                                width: scrollwidth,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        child: ElevatedButton(
                                                            onPressed: () {},
                                                            child:
                                                                Text('Update')),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Container loanInputfield(String header) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        width: 200,
        child: TextField(
          decoration: InputDecoration(labelText: header),
        ));
  }

  Column singleLoantypeEntry(int index, double scrollwidth) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedLoantype = index;
            });
          },
          child: Container(
            height: 50,
            color: (selectedLoantype == index)
                ? const Color.fromARGB(255, 208, 223, 235)
                : Colors.white,
            child: Row(
              children: [
                indexedInput(Text(loantypes[index][0]), 1.5 * scrollwidth),
                indexedInput(Text(loantypes[index][1]), 1.5 * scrollwidth),
                indexedInput(Text(loantypes[index][2]), 1.5 * scrollwidth),
                indexedInput(Text(loantypes[index][3]), 2 * scrollwidth),
              ],
            ),
          ),
        ),
        Divider(thickness: 1, color: Myconstants.color2)
      ],
    );
  }

  Padding myLoanDetailsOverlay(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20),
      child: Container(
        width: width,
        height: 650,
        decoration: BoxDecoration(
            color: Myconstants.color2,
            border: Border.all(
                width: 1, color: const Color.fromARGB(255, 197, 195, 195))),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        hoverColor: const Color.fromARGB(255, 199, 57, 14),
                        onPressed: () {
                          setState(() {
                            needsDetails = false;
                          });
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loanDetailsRow('Date:', 7),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Applicants Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  loanDetailsRow('PF number:', 1),
                  loanDetailsRow('Name:', 2),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Guaranter 1',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  loanDetailsRow('Name:', 8),
                  loanDetailsRow('PF number:', 9),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Guaranter 2',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  loanDetailsRow('Name:', 10),
                  loanDetailsRow('PF number:', 11),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Loan Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  loanDetailsRow('Loan Type:', 3),
                  loanDetailsRow('Loan amount:', 4),
                  loanDetailsRow('Balance:', 5),
                  loanDetailsRow('Interest:', 12),
                  loanDetailsRow('Monthly installment:', 6),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'Loan status:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Text(
                        'waiting for approval',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (selectedtab == 0)
                            ? myElevatedButton('Approve', 0)
                            : SizedBox(),
                        (selectedtab == 0)
                            ? myElevatedButton('Decline', 1)
                            : SizedBox(),
                        myElevatedButton(
                            (selectedtab == 1 || selectedtab == 2)
                                ? 'OK'
                                : 'cancel',
                            2),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container myElevatedButton(String header, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Myconstants.color1, borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              setState(() {
                needsDetails = false;
              });
            },
            child: Text(
              header,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Column loanDetailsRow(String header, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  header,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                ),
              ),
              Text(
                runningLoans[selectedDetail][index],
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container runningLoanContainer(
      double scrollwidth, BuildContext context, double height) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                indexedInput2(Text('No'), scrollwidth),
                indexedInput2(Text('PF number '), scrollwidth),
                indexedInput(Text('Name'), scrollwidth),
                indexedInput(Text('Type'), scrollwidth),
                indexedInput(Text('Amount'), scrollwidth),
                indexedInput(Text('Balance'), scrollwidth),
                indexedInput(Text('Monthly installment'), scrollwidth),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
            child: Container(
              width: scrollwidth,
              height: 0.6 * height - 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color.fromARGB(255, 247, 245, 245)),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: scrollwidth,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                indexedInput2(
                                    Text(runningLoans[index][0]), scrollwidth),
                                indexedInput2(
                                    Text(runningLoans[index][1]), scrollwidth),
                                indexedInput(
                                    Text(
                                      runningLoans[index][2],
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    scrollwidth),
                                indexedInput(
                                    Text(runningLoans[index][3]), scrollwidth),
                                indexedInput(
                                    Text(runningLoans[index][4]), scrollwidth),
                                (selectedtab == 2)
                                    ? indexedInput(Text(runningLoans[index][5]),
                                        scrollwidth)
                                    : Container(
                                        width: scrollwidth / 7,
                                        child: Center(
                                          child: Text('-'),
                                        ),
                                      ),
                                (selectedtab == 2 || selectedtab == 1)
                                    ? indexedInput(Text(runningLoans[index][6]),
                                        scrollwidth)
                                    : Container(
                                        width: scrollwidth / 7,
                                        child: Center(
                                          child: Text('-'),
                                        ),
                                      ),
                                TextButton(
                                    onPressed: () {
                                      setState(() {
                                        needsDetails = true;
                                        selectedDetail = index;
                                      });
                                    },
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue),
                                    )),
                                (selectedtab == 0)
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color: Myconstants.color1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, right: 5),
                                              child: Text('Approve'),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: const Color.fromARGB(255, 244, 243, 243),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Container indexedInput(Text text, double width) {
    return Container(
      width: width / 8,
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: text,
      ),
    );
  }

  Container indexedInput2(Text text, double width) {
    return Container(
      width: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: text,
          )
        ],
      ),
    );
  }

  Column loanTab(String header, int position) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                selectedtab = position;
              });
            },
            child: Text(header)),
        Container(
          height: 2,
          width: 100,
          color: (selectedtab == position)
              ? Myconstants.color1
              : Colors.transparent,
        )
      ],
    );
  }

  Container manageCategories() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Manage loan categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Manage loans by viewing , deleting ,adding or updating the available loan types',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      manageLoans = true;
                    });
                  },
                  child: Text(
                    'manage loan categories',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
