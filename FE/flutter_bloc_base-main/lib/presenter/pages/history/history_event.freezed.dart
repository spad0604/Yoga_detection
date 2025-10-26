// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(DateTime startDate, DateTime endDate, int page)
        loadPosesByDate,
    required TResult Function(String poseId) loadPoseDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult? Function(String poseId)? loadPoseDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult Function(String poseId)? loadPoseDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryErrorOccurred value) errorOccurred,
    required TResult Function(HistoryLoadPosesByDate value) loadPosesByDate,
    required TResult Function(HistoryLoadPoseDetail value) loadPoseDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryErrorOccurred value)? errorOccurred,
    TResult? Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult? Function(HistoryLoadPoseDetail value)? loadPoseDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryErrorOccurred value)? errorOccurred,
    TResult Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult Function(HistoryLoadPoseDetail value)? loadPoseDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEventCopyWith<$Res> {
  factory $HistoryEventCopyWith(
          HistoryEvent value, $Res Function(HistoryEvent) then) =
      _$HistoryEventCopyWithImpl<$Res, HistoryEvent>;
}

/// @nodoc
class _$HistoryEventCopyWithImpl<$Res, $Val extends HistoryEvent>
    implements $HistoryEventCopyWith<$Res> {
  _$HistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HistoryErrorOccurredImplCopyWith<$Res> {
  factory _$$HistoryErrorOccurredImplCopyWith(_$HistoryErrorOccurredImpl value,
          $Res Function(_$HistoryErrorOccurredImpl) then) =
      __$$HistoryErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseException<dynamic>? error});
}

/// @nodoc
class __$$HistoryErrorOccurredImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$HistoryErrorOccurredImpl>
    implements _$$HistoryErrorOccurredImplCopyWith<$Res> {
  __$$HistoryErrorOccurredImplCopyWithImpl(_$HistoryErrorOccurredImpl _value,
      $Res Function(_$HistoryErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$HistoryErrorOccurredImpl(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$HistoryErrorOccurredImpl implements HistoryErrorOccurred {
  const _$HistoryErrorOccurredImpl([this.error]);

  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'HistoryEvent.errorOccurred(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryErrorOccurredImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryErrorOccurredImplCopyWith<_$HistoryErrorOccurredImpl>
      get copyWith =>
          __$$HistoryErrorOccurredImplCopyWithImpl<_$HistoryErrorOccurredImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(DateTime startDate, DateTime endDate, int page)
        loadPosesByDate,
    required TResult Function(String poseId) loadPoseDetail,
  }) {
    return errorOccurred(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult? Function(String poseId)? loadPoseDetail,
  }) {
    return errorOccurred?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult Function(String poseId)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryErrorOccurred value) errorOccurred,
    required TResult Function(HistoryLoadPosesByDate value) loadPosesByDate,
    required TResult Function(HistoryLoadPoseDetail value) loadPoseDetail,
  }) {
    return errorOccurred(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryErrorOccurred value)? errorOccurred,
    TResult? Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult? Function(HistoryLoadPoseDetail value)? loadPoseDetail,
  }) {
    return errorOccurred?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryErrorOccurred value)? errorOccurred,
    TResult Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult Function(HistoryLoadPoseDetail value)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (errorOccurred != null) {
      return errorOccurred(this);
    }
    return orElse();
  }
}

abstract class HistoryErrorOccurred implements HistoryEvent {
  const factory HistoryErrorOccurred([final BaseException<dynamic>? error]) =
      _$HistoryErrorOccurredImpl;

  BaseException<dynamic>? get error;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryErrorOccurredImplCopyWith<_$HistoryErrorOccurredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryLoadPosesByDateImplCopyWith<$Res> {
  factory _$$HistoryLoadPosesByDateImplCopyWith(
          _$HistoryLoadPosesByDateImpl value,
          $Res Function(_$HistoryLoadPosesByDateImpl) then) =
      __$$HistoryLoadPosesByDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startDate, DateTime endDate, int page});
}

/// @nodoc
class __$$HistoryLoadPosesByDateImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$HistoryLoadPosesByDateImpl>
    implements _$$HistoryLoadPosesByDateImplCopyWith<$Res> {
  __$$HistoryLoadPosesByDateImplCopyWithImpl(
      _$HistoryLoadPosesByDateImpl _value,
      $Res Function(_$HistoryLoadPosesByDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? page = null,
  }) {
    return _then(_$HistoryLoadPosesByDateImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HistoryLoadPosesByDateImpl implements HistoryLoadPosesByDate {
  const _$HistoryLoadPosesByDateImpl(
      {required this.startDate, required this.endDate, this.page = 0});

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'HistoryEvent.loadPosesByDate(startDate: $startDate, endDate: $endDate, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryLoadPosesByDateImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, page);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryLoadPosesByDateImplCopyWith<_$HistoryLoadPosesByDateImpl>
      get copyWith => __$$HistoryLoadPosesByDateImplCopyWithImpl<
          _$HistoryLoadPosesByDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(DateTime startDate, DateTime endDate, int page)
        loadPosesByDate,
    required TResult Function(String poseId) loadPoseDetail,
  }) {
    return loadPosesByDate(startDate, endDate, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult? Function(String poseId)? loadPoseDetail,
  }) {
    return loadPosesByDate?.call(startDate, endDate, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult Function(String poseId)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (loadPosesByDate != null) {
      return loadPosesByDate(startDate, endDate, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryErrorOccurred value) errorOccurred,
    required TResult Function(HistoryLoadPosesByDate value) loadPosesByDate,
    required TResult Function(HistoryLoadPoseDetail value) loadPoseDetail,
  }) {
    return loadPosesByDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryErrorOccurred value)? errorOccurred,
    TResult? Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult? Function(HistoryLoadPoseDetail value)? loadPoseDetail,
  }) {
    return loadPosesByDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryErrorOccurred value)? errorOccurred,
    TResult Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult Function(HistoryLoadPoseDetail value)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (loadPosesByDate != null) {
      return loadPosesByDate(this);
    }
    return orElse();
  }
}

abstract class HistoryLoadPosesByDate implements HistoryEvent {
  const factory HistoryLoadPosesByDate(
      {required final DateTime startDate,
      required final DateTime endDate,
      final int page}) = _$HistoryLoadPosesByDateImpl;

  DateTime get startDate;
  DateTime get endDate;
  int get page;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryLoadPosesByDateImplCopyWith<_$HistoryLoadPosesByDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HistoryLoadPoseDetailImplCopyWith<$Res> {
  factory _$$HistoryLoadPoseDetailImplCopyWith(
          _$HistoryLoadPoseDetailImpl value,
          $Res Function(_$HistoryLoadPoseDetailImpl) then) =
      __$$HistoryLoadPoseDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String poseId});
}

/// @nodoc
class __$$HistoryLoadPoseDetailImplCopyWithImpl<$Res>
    extends _$HistoryEventCopyWithImpl<$Res, _$HistoryLoadPoseDetailImpl>
    implements _$$HistoryLoadPoseDetailImplCopyWith<$Res> {
  __$$HistoryLoadPoseDetailImplCopyWithImpl(_$HistoryLoadPoseDetailImpl _value,
      $Res Function(_$HistoryLoadPoseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poseId = null,
  }) {
    return _then(_$HistoryLoadPoseDetailImpl(
      poseId: null == poseId
          ? _value.poseId
          : poseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HistoryLoadPoseDetailImpl implements HistoryLoadPoseDetail {
  const _$HistoryLoadPoseDetailImpl({required this.poseId});

  @override
  final String poseId;

  @override
  String toString() {
    return 'HistoryEvent.loadPoseDetail(poseId: $poseId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryLoadPoseDetailImpl &&
            (identical(other.poseId, poseId) || other.poseId == poseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poseId);

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryLoadPoseDetailImplCopyWith<_$HistoryLoadPoseDetailImpl>
      get copyWith => __$$HistoryLoadPoseDetailImplCopyWithImpl<
          _$HistoryLoadPoseDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BaseException<dynamic>? error) errorOccurred,
    required TResult Function(DateTime startDate, DateTime endDate, int page)
        loadPosesByDate,
    required TResult Function(String poseId) loadPoseDetail,
  }) {
    return loadPoseDetail(poseId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BaseException<dynamic>? error)? errorOccurred,
    TResult? Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult? Function(String poseId)? loadPoseDetail,
  }) {
    return loadPoseDetail?.call(poseId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BaseException<dynamic>? error)? errorOccurred,
    TResult Function(DateTime startDate, DateTime endDate, int page)?
        loadPosesByDate,
    TResult Function(String poseId)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (loadPoseDetail != null) {
      return loadPoseDetail(poseId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HistoryErrorOccurred value) errorOccurred,
    required TResult Function(HistoryLoadPosesByDate value) loadPosesByDate,
    required TResult Function(HistoryLoadPoseDetail value) loadPoseDetail,
  }) {
    return loadPoseDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HistoryErrorOccurred value)? errorOccurred,
    TResult? Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult? Function(HistoryLoadPoseDetail value)? loadPoseDetail,
  }) {
    return loadPoseDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HistoryErrorOccurred value)? errorOccurred,
    TResult Function(HistoryLoadPosesByDate value)? loadPosesByDate,
    TResult Function(HistoryLoadPoseDetail value)? loadPoseDetail,
    required TResult orElse(),
  }) {
    if (loadPoseDetail != null) {
      return loadPoseDetail(this);
    }
    return orElse();
  }
}

abstract class HistoryLoadPoseDetail implements HistoryEvent {
  const factory HistoryLoadPoseDetail({required final String poseId}) =
      _$HistoryLoadPoseDetailImpl;

  String get poseId;

  /// Create a copy of HistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryLoadPoseDetailImplCopyWith<_$HistoryLoadPoseDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
