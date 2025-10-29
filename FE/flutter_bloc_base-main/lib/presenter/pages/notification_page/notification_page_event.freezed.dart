// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_page_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size) loadNotifications,
    required TResult Function() refreshNotifications,
    required TResult Function() loadMoreNotifications,
    required TResult Function(String id) markAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size)? loadNotifications,
    TResult? Function()? refreshNotifications,
    TResult? Function()? loadMoreNotifications,
    TResult? Function(String id)? markAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size)? loadNotifications,
    TResult Function()? refreshNotifications,
    TResult Function()? loadMoreNotifications,
    TResult Function(String id)? markAsRead,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotifications value) loadNotifications,
    required TResult Function(RefreshNotifications value) refreshNotifications,
    required TResult Function(LoadMoreNotifications value)
        loadMoreNotifications,
    required TResult Function(MarkAsRead value) markAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotifications value)? loadNotifications,
    TResult? Function(RefreshNotifications value)? refreshNotifications,
    TResult? Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult? Function(MarkAsRead value)? markAsRead,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotifications value)? loadNotifications,
    TResult Function(RefreshNotifications value)? refreshNotifications,
    TResult Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult Function(MarkAsRead value)? markAsRead,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPageEventCopyWith<$Res> {
  factory $NotificationPageEventCopyWith(NotificationPageEvent value,
          $Res Function(NotificationPageEvent) then) =
      _$NotificationPageEventCopyWithImpl<$Res, NotificationPageEvent>;
}

/// @nodoc
class _$NotificationPageEventCopyWithImpl<$Res,
        $Val extends NotificationPageEvent>
    implements $NotificationPageEventCopyWith<$Res> {
  _$NotificationPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadNotificationsImplCopyWith<$Res> {
  factory _$$LoadNotificationsImplCopyWith(_$LoadNotificationsImpl value,
          $Res Function(_$LoadNotificationsImpl) then) =
      __$$LoadNotificationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int size});
}

/// @nodoc
class __$$LoadNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res, _$LoadNotificationsImpl>
    implements _$$LoadNotificationsImplCopyWith<$Res> {
  __$$LoadNotificationsImplCopyWithImpl(_$LoadNotificationsImpl _value,
      $Res Function(_$LoadNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$LoadNotificationsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadNotificationsImpl implements LoadNotifications {
  const _$LoadNotificationsImpl({this.page = 0, this.size = 20});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'NotificationPageEvent.loadNotifications(page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNotificationsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNotificationsImplCopyWith<_$LoadNotificationsImpl> get copyWith =>
      __$$LoadNotificationsImplCopyWithImpl<_$LoadNotificationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size) loadNotifications,
    required TResult Function() refreshNotifications,
    required TResult Function() loadMoreNotifications,
    required TResult Function(String id) markAsRead,
  }) {
    return loadNotifications(page, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size)? loadNotifications,
    TResult? Function()? refreshNotifications,
    TResult? Function()? loadMoreNotifications,
    TResult? Function(String id)? markAsRead,
  }) {
    return loadNotifications?.call(page, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size)? loadNotifications,
    TResult Function()? refreshNotifications,
    TResult Function()? loadMoreNotifications,
    TResult Function(String id)? markAsRead,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(page, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotifications value) loadNotifications,
    required TResult Function(RefreshNotifications value) refreshNotifications,
    required TResult Function(LoadMoreNotifications value)
        loadMoreNotifications,
    required TResult Function(MarkAsRead value) markAsRead,
  }) {
    return loadNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotifications value)? loadNotifications,
    TResult? Function(RefreshNotifications value)? refreshNotifications,
    TResult? Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult? Function(MarkAsRead value)? markAsRead,
  }) {
    return loadNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotifications value)? loadNotifications,
    TResult Function(RefreshNotifications value)? refreshNotifications,
    TResult Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult Function(MarkAsRead value)? markAsRead,
    required TResult orElse(),
  }) {
    if (loadNotifications != null) {
      return loadNotifications(this);
    }
    return orElse();
  }
}

abstract class LoadNotifications implements NotificationPageEvent {
  const factory LoadNotifications({final int page, final int size}) =
      _$LoadNotificationsImpl;

  int get page;
  int get size;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadNotificationsImplCopyWith<_$LoadNotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshNotificationsImplCopyWith<$Res> {
  factory _$$RefreshNotificationsImplCopyWith(_$RefreshNotificationsImpl value,
          $Res Function(_$RefreshNotificationsImpl) then) =
      __$$RefreshNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res,
        _$RefreshNotificationsImpl>
    implements _$$RefreshNotificationsImplCopyWith<$Res> {
  __$$RefreshNotificationsImplCopyWithImpl(_$RefreshNotificationsImpl _value,
      $Res Function(_$RefreshNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshNotificationsImpl implements RefreshNotifications {
  const _$RefreshNotificationsImpl();

  @override
  String toString() {
    return 'NotificationPageEvent.refreshNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size) loadNotifications,
    required TResult Function() refreshNotifications,
    required TResult Function() loadMoreNotifications,
    required TResult Function(String id) markAsRead,
  }) {
    return refreshNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size)? loadNotifications,
    TResult? Function()? refreshNotifications,
    TResult? Function()? loadMoreNotifications,
    TResult? Function(String id)? markAsRead,
  }) {
    return refreshNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size)? loadNotifications,
    TResult Function()? refreshNotifications,
    TResult Function()? loadMoreNotifications,
    TResult Function(String id)? markAsRead,
    required TResult orElse(),
  }) {
    if (refreshNotifications != null) {
      return refreshNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotifications value) loadNotifications,
    required TResult Function(RefreshNotifications value) refreshNotifications,
    required TResult Function(LoadMoreNotifications value)
        loadMoreNotifications,
    required TResult Function(MarkAsRead value) markAsRead,
  }) {
    return refreshNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotifications value)? loadNotifications,
    TResult? Function(RefreshNotifications value)? refreshNotifications,
    TResult? Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult? Function(MarkAsRead value)? markAsRead,
  }) {
    return refreshNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotifications value)? loadNotifications,
    TResult Function(RefreshNotifications value)? refreshNotifications,
    TResult Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult Function(MarkAsRead value)? markAsRead,
    required TResult orElse(),
  }) {
    if (refreshNotifications != null) {
      return refreshNotifications(this);
    }
    return orElse();
  }
}

abstract class RefreshNotifications implements NotificationPageEvent {
  const factory RefreshNotifications() = _$RefreshNotificationsImpl;
}

/// @nodoc
abstract class _$$LoadMoreNotificationsImplCopyWith<$Res> {
  factory _$$LoadMoreNotificationsImplCopyWith(
          _$LoadMoreNotificationsImpl value,
          $Res Function(_$LoadMoreNotificationsImpl) then) =
      __$$LoadMoreNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res,
        _$LoadMoreNotificationsImpl>
    implements _$$LoadMoreNotificationsImplCopyWith<$Res> {
  __$$LoadMoreNotificationsImplCopyWithImpl(_$LoadMoreNotificationsImpl _value,
      $Res Function(_$LoadMoreNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreNotificationsImpl implements LoadMoreNotifications {
  const _$LoadMoreNotificationsImpl();

  @override
  String toString() {
    return 'NotificationPageEvent.loadMoreNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size) loadNotifications,
    required TResult Function() refreshNotifications,
    required TResult Function() loadMoreNotifications,
    required TResult Function(String id) markAsRead,
  }) {
    return loadMoreNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size)? loadNotifications,
    TResult? Function()? refreshNotifications,
    TResult? Function()? loadMoreNotifications,
    TResult? Function(String id)? markAsRead,
  }) {
    return loadMoreNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size)? loadNotifications,
    TResult Function()? refreshNotifications,
    TResult Function()? loadMoreNotifications,
    TResult Function(String id)? markAsRead,
    required TResult orElse(),
  }) {
    if (loadMoreNotifications != null) {
      return loadMoreNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotifications value) loadNotifications,
    required TResult Function(RefreshNotifications value) refreshNotifications,
    required TResult Function(LoadMoreNotifications value)
        loadMoreNotifications,
    required TResult Function(MarkAsRead value) markAsRead,
  }) {
    return loadMoreNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotifications value)? loadNotifications,
    TResult? Function(RefreshNotifications value)? refreshNotifications,
    TResult? Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult? Function(MarkAsRead value)? markAsRead,
  }) {
    return loadMoreNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotifications value)? loadNotifications,
    TResult Function(RefreshNotifications value)? refreshNotifications,
    TResult Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult Function(MarkAsRead value)? markAsRead,
    required TResult orElse(),
  }) {
    if (loadMoreNotifications != null) {
      return loadMoreNotifications(this);
    }
    return orElse();
  }
}

abstract class LoadMoreNotifications implements NotificationPageEvent {
  const factory LoadMoreNotifications() = _$LoadMoreNotificationsImpl;
}

/// @nodoc
abstract class _$$MarkAsReadImplCopyWith<$Res> {
  factory _$$MarkAsReadImplCopyWith(
          _$MarkAsReadImpl value, $Res Function(_$MarkAsReadImpl) then) =
      __$$MarkAsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MarkAsReadImplCopyWithImpl<$Res>
    extends _$NotificationPageEventCopyWithImpl<$Res, _$MarkAsReadImpl>
    implements _$$MarkAsReadImplCopyWith<$Res> {
  __$$MarkAsReadImplCopyWithImpl(
      _$MarkAsReadImpl _value, $Res Function(_$MarkAsReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MarkAsReadImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MarkAsReadImpl implements MarkAsRead {
  const _$MarkAsReadImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'NotificationPageEvent.markAsRead(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      __$$MarkAsReadImplCopyWithImpl<_$MarkAsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size) loadNotifications,
    required TResult Function() refreshNotifications,
    required TResult Function() loadMoreNotifications,
    required TResult Function(String id) markAsRead,
  }) {
    return markAsRead(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size)? loadNotifications,
    TResult? Function()? refreshNotifications,
    TResult? Function()? loadMoreNotifications,
    TResult? Function(String id)? markAsRead,
  }) {
    return markAsRead?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size)? loadNotifications,
    TResult Function()? refreshNotifications,
    TResult Function()? loadMoreNotifications,
    TResult Function(String id)? markAsRead,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadNotifications value) loadNotifications,
    required TResult Function(RefreshNotifications value) refreshNotifications,
    required TResult Function(LoadMoreNotifications value)
        loadMoreNotifications,
    required TResult Function(MarkAsRead value) markAsRead,
  }) {
    return markAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadNotifications value)? loadNotifications,
    TResult? Function(RefreshNotifications value)? refreshNotifications,
    TResult? Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult? Function(MarkAsRead value)? markAsRead,
  }) {
    return markAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadNotifications value)? loadNotifications,
    TResult Function(RefreshNotifications value)? refreshNotifications,
    TResult Function(LoadMoreNotifications value)? loadMoreNotifications,
    TResult Function(MarkAsRead value)? markAsRead,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(this);
    }
    return orElse();
  }
}

abstract class MarkAsRead implements NotificationPageEvent {
  const factory MarkAsRead(final String id) = _$MarkAsReadImpl;

  String get id;

  /// Create a copy of NotificationPageEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
