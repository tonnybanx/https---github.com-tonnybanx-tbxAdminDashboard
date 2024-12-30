import 'package:equity_loan_admin_app/helper_values/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key,required});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = (MediaQuery.of(context).size.width - 210);
    double screenheight = (MediaQuery.of(context).size.height - 80);

    final data = [
      DataPoint('Jan', 200.5),
      DataPoint('Feb', 300.0),
      DataPoint('Mar', 250.5),
      DataPoint('Apr', 400.0),
      DataPoint('May', 300.5),
      DataPoint('Jun', 300.6),
      DataPoint('Jul', 200.5),
      DataPoint('Aug', 300.0),
      DataPoint('Sep', 250.5),
      DataPoint('Oct', 400.0),
      DataPoint('Nov', 300.5),
      DataPoint('Dec', 100.6),
    ];

    final dataset1 = [
      DataPoint('Jan', 200.5),
      DataPoint('Feb', 300.0),
      DataPoint('Mar', 250.5),
      DataPoint('Apr', 400.0),
      DataPoint('May', 300.5),
      DataPoint('Jun', 300.6),
      DataPoint('Jul', 200.5),
      DataPoint('Aug', 300.0),
      DataPoint('Sep', 250.5),
      DataPoint('Oct', 400.0),
      DataPoint('Nov', 300.5),
      DataPoint('Dec', 100.6),
    ];

    final dataset2 = [
      DataPoint('Jan', 100.5),
      DataPoint('Feb', 30.0),
      DataPoint('Mar', 280.5),
      DataPoint('Apr', 400.0),
      DataPoint('May', 390.5),
      DataPoint('Jun', 310.6),
      DataPoint('Jul', 150.5),
      DataPoint('Aug', 220.0),
      DataPoint('Sep', 240.5),
      DataPoint('Oct', 300.0),
      DataPoint('Nov', 400.5),
      DataPoint('Dec', 200.6),
    ];
    return Container(
      width: screenwidth,
      height: screenheight,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 0.6 * screenwidth,
            height: screenheight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    module1(screenwidth, Colors.black, Icons.arrow_upward,
                        'Disburstments', 'UGX 652.7 M'),
                    module1(screenwidth, Colors.green, Icons.arrow_downward,
                        "Repayments", 'UGX 450.3 M')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      repaymentGraph(
                          screenwidth, screenheight, dataset1, dataset2),
                      Column(
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 0.5 * screenwidth - 30,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.red, width: 1)),
                            child: ListView(
                              children: [
                                recentTransaction(),
                                recentTransaction(),
                                recentTransaction(),
                                recentTransaction(),
                                recentTransaction(),
                                recentTransaction(),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 0.4 * screenwidth,
            height: screenheight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                balanceModule(screenheight, screenwidth),
                balanceHistoryModule(screenheight, screenwidth, data)
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding recentTransaction() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 253, 253, 253),
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.currency_exchange,
                size: 30,
                color: Colors.black,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Disburstment to Palasidi Robert',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '21  jan 2024   12:00',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1022102094716',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'UGX 100,000',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container repaymentGraph(double screenwidth, double screenheight,
      List<DataPoint> dataset1, List<DataPoint> dataset2) {
    return Container(
      width: 0.6 * screenwidth - 60,
      height: screenheight - 400,
      child: SfCartesianChart(
        title: ChartTitle(
            text: 'Monthly disburstments and repayments',
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        borderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          title: AxisTitle(
              text: 'Amount in millions',
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        legend: Legend(
          isVisible: true, // Show the legend
          position: LegendPosition.top, // Position: top, bottom, left, right
          overflowMode: LegendItemOverflowMode
              .wrap, // Handles legend items when space is tight
        ),
        series: [
          ColumnSeries<DataPoint, String>(
            dataSource: dataset1,
            xValueMapper: (DataPoint disburstments, _) =>
                disburstments.category,
            yValueMapper: (DataPoint disburstments, _) => disburstments.value,
            name: 'Disburstments',
            color: Colors.yellow,
          ),
          ColumnSeries<DataPoint, String>(
            dataSource: dataset2,
            xValueMapper: (DataPoint disburstments, _) =>
                disburstments.category,
            yValueMapper: (DataPoint disburstments, _) => disburstments.value,
            name: 'Repayments',
            color: Myconstants.color1,
          ),
        ],
      ),
    );
  }

  Padding balanceHistoryModule(
      double screenheight, double screenwidth, List<DataPoint> data) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 0.5 * screenheight - 50,
        width: 0.4 * screenwidth,
        child: Center(
          child: SfCartesianChart(
            title: ChartTitle(
                text: 'Account Balance history',
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            borderColor: Colors.red,
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              title: AxisTitle(
                  text: 'Amount in millions',
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            series: [
              LineSeries<DataPoint, String>(
                color: Colors.red,
                dataSource: data,
                xValueMapper: (DataPoint Balance, _) => Balance.category,
                yValueMapper: (DataPoint Balance, _) => Balance.value,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding balanceModule(double screenheight, double screenwidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Sacco Account Balance',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 0.5 * screenheight - 30,
              width: 0.4 * screenwidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 390,
                      height: 230,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/card1.png'))),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80, top: 10),
                        child: Text(
                          'UGX 150,000,000',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding module1(double screenwidth, Color color, IconData icon, String header,
      String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
      child: Container(
        width: 0.3 * screenwidth - 45,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Myconstants.color1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(10)),
                width: 50,
                height: 50,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  header,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DataPoint {
  final String category;
  final double value;

  DataPoint(this.category, this.value);
}
