part 'perform.g.dart';

class Performance {
  int? id;
  String? label;
  String? chartPeriodCode;
  double? changePercent;
  Performance({this.id, this.label, this.changePercent, this.chartPeriodCode});

  factory Performance.fromJson(json) => _$ApiFromJson(json);

  Map<String, dynamic> toJson() => _$ApiToJson(this);
}
