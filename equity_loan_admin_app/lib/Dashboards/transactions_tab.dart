import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';

class TransactionsTab extends StatefulWidget {
  const TransactionsTab({super.key});

  @override
  State<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends State<TransactionsTab> {
  List<String> transactionInstance = [
    '30187050719',
    'Disbursement',
    'UGX 15,000,000',
    '29/01/2025',
    '12:00 am',
    '1022102094716',
    '1030984638523'
  ];
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 210;
    double height = MediaQuery.of(context).size.height - 80;
    double scrollwidth = 1200;
    Myconstants helper = Myconstants();

    return Expanded(
      child: Container(
        color: Myconstants.color2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                transactionTab('All', 0),
                transactionTab('Disbursements', 1),
                transactionTab('Repayments', 2),
              ],
            ),
            transactionsTable(width, height, helper, scrollwidth),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Disbursements:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'UGX 150,000,000',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Text(
                          'Total Repayments:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'UGX 150,000,000',
                            style: TextStyle(fontSize: 16),
                          ),
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
    );
  }

  Padding transactionTab(String text, int position) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  selectedTab = position;
                });
              },
              child: Text(text)),
          Container(
            color: (selectedTab == position)
                ? Myconstants.color1
                : Colors.transparent,
            width: 100,
            height: 2,
          )
        ],
      ),
    );
  }

  Container transactionsTable(
      double width, double height, Myconstants helper, double scrollwidth) {
    return Container(
      width: width,
      height: 0.8 * height,
      child: Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    helper.indexedValue(
                        scrollwidth, 0.2, 'Transaction ID', true),
                    helper.indexedValue(scrollwidth, 0.1, 'Type', true),
                    helper.indexedValue(scrollwidth, 0.1, 'Amount', true),
                    helper.indexedValue(scrollwidth, 0.1, 'Date', true),
                    helper.indexedValue(scrollwidth, 0.1, 'Time', true),
                    helper.indexedValue(scrollwidth, 0.15, 'Sender', true),
                    helper.indexedValue(scrollwidth, 0.15, 'Reciever', true),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  height: 0.8 * height - 80,
                  width: scrollwidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              children: [
                                helper.indexedValue(scrollwidth, 0.2,
                                    transactionInstance[0], false),
                                helper.indexedValue(scrollwidth, 0.1,
                                    transactionInstance[1], false),
                                helper.indexedValue(scrollwidth, 0.1,
                                    transactionInstance[2], false),
                                helper.indexedValue(scrollwidth, 0.1,
                                    transactionInstance[3], false),
                                helper.indexedValue(scrollwidth, 0.1,
                                    transactionInstance[4], false),
                                helper.indexedValue(scrollwidth, 0.15,
                                    transactionInstance[5], false),
                                helper.indexedValue(scrollwidth, 0.15,
                                    transactionInstance[6], false),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
