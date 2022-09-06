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
  var overviewData;
  List<Performance> performs = [];
  void getData() async {
    overviewData = await StockData().getOverviewData();
    performs = await StockData().getPerformanceData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return overviewData == null || performs.isEmpty
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
                    ),
                    OverviewData(
                      leftText: 'Industry',
                      rightText: overviewData['Industry'],
                      icon: Icons.account_balance,
                    ),
                    OverviewData(
                      leftText: 'Market Cap.',
                      rightText: overviewData['MCAP'].toString(),
                    ),
                    OverviewData(
                      leftText: 'Enterprise Value(EV)',
                      rightText:
                          overviewData['Enterprise Value(EV)'].toString(),
                    ),
                    OverviewData(
                      leftText: 'Book Value/ Share',
                      rightText: overviewData['BookNavPerShare'].toString() !=
                              'null'
                          ? overviewData['BookNavPerShare'].toStringAsFixed(2)
                          : '-',
                    ),
                    OverviewData(
                      leftText: 'Price-Earning Ratio (PE)',
                      rightText: overviewData['TTMPE'].toStringAsFixed(2),
                    ),
                    OverviewData(
                      leftText: 'PEG Ratio',
                      rightText: overviewData['PEGRatio'].toStringAsFixed(2),
                    ),
                    OverviewData(
                      leftText: 'Dividend Yield',
                      rightText: overviewData['Yield'].toStringAsFixed(2),
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
