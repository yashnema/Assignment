import 'dart:async';

import 'package:assignment/modal/perform.dart';
import 'package:assignment/constants.dart';
import 'package:assignment/performScreen.dart';
import 'package:assignment/utility.dart';
import 'package:flutter/material.dart';
import 'stockData.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: DisplayPage()),
      ),
    ));

class DisplayPage extends StatefulWidget {
  const DisplayPage({Key? key}) : super(key: key);

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  Map<String, dynamic> overviewData = {};
  var stockDetails;

  List<Performance> performs = [];
  void getData() async {
    overviewData = await StockData().getOverviewData();
    performs = await StockData().getPerformanceData();
    stockDetails = await StockData().getStockDetails();

    setState(() {});
    Timer.periodic(const Duration(seconds: 5), ((timer) async {
      stockDetails = await StockData().getStockDetails();
      setState(() {});
    }));
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return overviewData.isEmpty || performs.isEmpty
        ? const Center(
            child: Text('Please wait....'),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 3.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'HDFC Bank',
                            textAlign: TextAlign.center,
                            style: kStockTextStyle(),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            stockDetails['O'].toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            style: kStockTextStyle(),
                          ),
                          Text(
                            '${stockDetails['CZ']}  (${stockDetails['CZG']}%)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: stockDetails['CZG'] < 0
                                  ? Colors.red
                                  : const Color.fromARGB(255, 17, 120, 21),
                              fontSize: 15.0,
                            ),
                          ),
                          OverviewData(
                            leftText: 'High',
                            rightText: stockDetails['H'].toStringAsFixed(2),
                            style: kStockTextStyle(),
                          ),
                          OverviewData(
                            leftText: 'Low',
                            rightText: stockDetails['L'].toStringAsFixed(2),
                            style: kStockTextStyle(),
                          ),
                          OverviewData(
                            leftText: 'Volume',
                            rightText: stockDetails['TQ'].toStringAsFixed(2),
                            style: kStockTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: kHeadingTextStyle(),
                    ),
                    underLine(context),
                    OverviewData(
                      leftText: 'Sector',
                      rightText: overviewData['Sector'],
                      icon: Icons.account_balance,
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Industry',
                      rightText: overviewData['Industry'],
                      icon: Icons.account_balance,
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Market Cap.',
                      rightText: overviewData['MCAP'].toString(),
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Enterprise Value(EV)',
                      rightText:
                          overviewData['Enterprise Value(EV)'].toString(),
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Book Value/ Share',
                      rightText: overviewData['BookNavPerShare'].toString() !=
                              'null'
                          ? overviewData['BookNavPerShare'].toStringAsFixed(2)
                          : '-',
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Price-Earning Ratio (PE)',
                      rightText: overviewData['TTMPE'].toStringAsFixed(2),
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'PEG Ratio',
                      rightText: overviewData['PEGRatio'].toStringAsFixed(2),
                      style: kNormalTextStyle(),
                    ),
                    OverviewData(
                      leftText: 'Dividend Yield',
                      rightText: overviewData['Yield'].toStringAsFixed(2),
                      style: kNormalTextStyle(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Performances(
                  list: performs,
                ),
              ],
            ),
          );
  }
}
