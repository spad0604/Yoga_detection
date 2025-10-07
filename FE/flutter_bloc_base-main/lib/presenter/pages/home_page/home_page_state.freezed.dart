// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  HomePageStatus get status => throw _privateConstructorUsedError;
  List<YogaPoseDetails> get yogaPoses => throw _privateConstructorUsedError;
  String get chooseYogaPose => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {HomePageStatus status,
      List<YogaPoseDetails> yogaPoses,
      String chooseYogaPose,
      BaseException<dynamic>? error});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? yogaPoses = null,
    Object? chooseYogaPose = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomePageStatus,
      yogaPoses: null == yogaPoses
          ? _value.yogaPoses
          : yogaPoses // ignore: cast_nullable_to_non_nullable
              as List<YogaPoseDetails>,
      chooseYogaPose: null == chooseYogaPose
          ? _value.chooseYogaPose
          : chooseYogaPose // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HomePageStatus status,
      List<YogaPoseDetails> yogaPoses,
      String chooseYogaPose,
      BaseException<dynamic>? error});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? yogaPoses = null,
    Object? chooseYogaPose = null,
    Object? error = freezed,
  }) {
    return _then(_$HomePageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomePageStatus,
      yogaPoses: null == yogaPoses
          ? _value._yogaPoses
          : yogaPoses // ignore: cast_nullable_to_non_nullable
              as List<YogaPoseDetails>,
      chooseYogaPose: null == chooseYogaPose
          ? _value.chooseYogaPose
          : chooseYogaPose // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {this.status = HomePageStatus.initial,
      final List<YogaPoseDetails> yogaPoses = const [],
      this.chooseYogaPose = '',
      this.error})
      : _yogaPoses = yogaPoses;

  @override
  @JsonKey()
  final HomePageStatus status;
  final List<YogaPoseDetails> _yogaPoses;
  @override
  @JsonKey()
  List<YogaPoseDetails> get yogaPoses {
    if (_yogaPoses is EqualUnmodifiableListView) return _yogaPoses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yogaPoses);
  }

  @override
  @JsonKey()
  final String chooseYogaPose;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'HomePageState(status: $status, yogaPoses: $yogaPoses, chooseYogaPose: $chooseYogaPose, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._yogaPoses, _yogaPoses) &&
            (identical(other.chooseYogaPose, chooseYogaPose) ||
                other.chooseYogaPose == chooseYogaPose) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_yogaPoses), chooseYogaPose, error);

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final HomePageStatus status,
      final List<YogaPoseDetails> yogaPoses,
      final String chooseYogaPose,
      final BaseException<dynamic>? error}) = _$HomePageStateImpl;

  @override
  HomePageStatus get status;
  @override
  List<YogaPoseDetails> get yogaPoses;
  @override
  String get chooseYogaPose;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of HomePageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
