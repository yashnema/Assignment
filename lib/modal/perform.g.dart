part of 'perform.dart';

Performance _$ApiFromJson(Map<String, dynamic> json) => Performance(
      id: json['ID'] as int?,
      label: json['Label'] as String?,
      changePercent: json['ChangePercent'] as double?,
      chartPeriodCode: json['ChartPeriodCode'] as String?,
    );

Map<String, dynamic> _$ApiToJson(Performance instance) => <String, dynamic>{
      'ID': instance.id,
      'Label': instance.label,
      'ChartPeriodCode': instance.chartPeriodCode,
      'ChangePercent': instance.changePercent,
    };
