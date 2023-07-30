// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of forecast;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Forecastmodel _$ForecastmodelFromJson(Map<String, dynamic> json) {
  return _Forecastmodel.fromJson(json);
}

/// @nodoc
mixin _$Forecastmodel {
  List<Weather> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForecastmodelCopyWith<Forecastmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastmodelCopyWith<$Res> {
  factory $ForecastmodelCopyWith(
          Forecastmodel value, $Res Function(Forecastmodel) then) =
      _$ForecastmodelCopyWithImpl<$Res, Forecastmodel>;
  @useResult
  $Res call({List<Weather> list});
}

/// @nodoc
class _$ForecastmodelCopyWithImpl<$Res, $Val extends Forecastmodel>
    implements $ForecastmodelCopyWith<$Res> {
  _$ForecastmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForecastmodelCopyWith<$Res>
    implements $ForecastmodelCopyWith<$Res> {
  factory _$$_ForecastmodelCopyWith(
          _$_Forecastmodel value, $Res Function(_$_Forecastmodel) then) =
      __$$_ForecastmodelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Weather> list});
}

/// @nodoc
class __$$_ForecastmodelCopyWithImpl<$Res>
    extends _$ForecastmodelCopyWithImpl<$Res, _$_Forecastmodel>
    implements _$$_ForecastmodelCopyWith<$Res> {
  __$$_ForecastmodelCopyWithImpl(
      _$_Forecastmodel _value, $Res Function(_$_Forecastmodel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_Forecastmodel(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Weather>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Forecastmodel implements _Forecastmodel {
  _$_Forecastmodel({required final List<Weather> list}) : _list = list;

  factory _$_Forecastmodel.fromJson(Map<String, dynamic> json) =>
      _$$_ForecastmodelFromJson(json);

  final List<Weather> _list;
  @override
  List<Weather> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'Forecastmodel(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Forecastmodel &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForecastmodelCopyWith<_$_Forecastmodel> get copyWith =>
      __$$_ForecastmodelCopyWithImpl<_$_Forecastmodel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForecastmodelToJson(
      this,
    );
  }
}

abstract class _Forecastmodel implements Forecastmodel {
  factory _Forecastmodel({required final List<Weather> list}) =
      _$_Forecastmodel;

  factory _Forecastmodel.fromJson(Map<String, dynamic> json) =
      _$_Forecastmodel.fromJson;

  @override
  List<Weather> get list;
  @override
  @JsonKey(ignore: true)
  _$$_ForecastmodelCopyWith<_$_Forecastmodel> get copyWith =>
      throw _privateConstructorUsedError;
}
