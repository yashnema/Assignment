import 'dart:convert';

import 'package:assignment/modal/perform.dart';
import 'package:http/http.dart' as http;

const stockEdgeOverviewUrl =
    'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en';
const stockEdgeTechnicalPerformanceUrl =
    'https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en';
const stockDetailsUrl =
    'https://api.stockedge.com/api/LatestListingPriceDashboardApi/GetLatestListingPrice/5866?lang=en';

class StockData {
  Future getStockDetails() async {
    http.Response response = await http.get(Uri.parse(stockDetailsUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {}
  }

  Future getOverviewData() async {
    http.Response response = await http.get(Uri.parse(stockEdgeOverviewUrl));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {}
  }

  Future<List<Performance>> getPerformanceData() async {
    List<Performance> performs = [];
    try {
      http.Response response =
          await http.get(Uri.parse(stockEdgeTechnicalPerformanceUrl));
      if (response.statusCode == 200) {
        String data = response.body;
        for (var perform in jsonDecode(data)) {
          Performance per = Performance.fromJson(perform);
          performs.add(per);
        }
      }
      // ignore: empty_catches
    } catch (e) {}
    return performs;
  }
}
