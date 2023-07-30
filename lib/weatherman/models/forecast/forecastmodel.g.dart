// GENERATED CODE - DO NOT MODIFY BY HAND

part of forecast;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Forecastmodel _$$_ForecastmodelFromJson(Map<String, dynamic> json) =>
    _$_Forecastmodel(
      list: (json['list'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ForecastmodelToJson(_$_Forecastmodel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
