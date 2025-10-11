// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'yoga_pose_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

YogaPoseItem _$YogaPoseItemFromJson(Map<String, dynamic> json) {
  return _YogaPoseItem.fromJson(json);
}

/// @nodoc
mixin _$YogaPoseItem {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'minutes')
  int get minutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'calos')
  int get calos => throw _privateConstructorUsedError;

  /// Serializes this YogaPoseItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of YogaPoseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YogaPoseItemCopyWith<YogaPoseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YogaPoseItemCopyWith<$Res> {
  factory $YogaPoseItemCopyWith(
          YogaPoseItem value, $Res Function(YogaPoseItem) then) =
      _$YogaPoseItemCopyWithImpl<$Res, YogaPoseItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'minutes') int minutes,
      @JsonKey(name: 'calos') int calos});
}

/// @nodoc
class _$YogaPoseItemCopyWithImpl<$Res, $Val extends YogaPoseItem>
    implements $YogaPoseItemCopyWith<$Res> {
  _$YogaPoseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YogaPoseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? minutes = null,
    Object? calos = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      calos: null == calos
          ? _value.calos
          : calos // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YogaPoseItemImplCopyWith<$Res>
    implements $YogaPoseItemCopyWith<$Res> {
  factory _$$YogaPoseItemImplCopyWith(
          _$YogaPoseItemImpl value, $Res Function(_$YogaPoseItemImpl) then) =
      __$$YogaPoseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'minutes') int minutes,
      @JsonKey(name: 'calos') int calos});
}

/// @nodoc
class __$$YogaPoseItemImplCopyWithImpl<$Res>
    extends _$YogaPoseItemCopyWithImpl<$Res, _$YogaPoseItemImpl>
    implements _$$YogaPoseItemImplCopyWith<$Res> {
  __$$YogaPoseItemImplCopyWithImpl(
      _$YogaPoseItemImpl _value, $Res Function(_$YogaPoseItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of YogaPoseItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = freezed,
    Object? minutes = null,
    Object? calos = null,
  }) {
    return _then(_$YogaPoseItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      calos: null == calos
          ? _value.calos
          : calos // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YogaPoseItemImpl implements _YogaPoseItem {
  const _$YogaPoseItemImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'minutes') required this.minutes,
      @JsonKey(name: 'calos') required this.calos});

  factory _$YogaPoseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$YogaPoseItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'minutes')
  final int minutes;
  @override
  @JsonKey(name: 'calos')
  final int calos;

  @override
  String toString() {
    return 'YogaPoseItem(id: $id, name: $name, imageUrl: $imageUrl, minutes: $minutes, calos: $calos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YogaPoseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.calos, calos) || other.calos == calos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, imageUrl, minutes, calos);

  /// Create a copy of YogaPoseItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YogaPoseItemImplCopyWith<_$YogaPoseItemImpl> get copyWith =>
      __$$YogaPoseItemImplCopyWithImpl<_$YogaPoseItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YogaPoseItemImplToJson(
      this,
    );
  }
}

abstract class _YogaPoseItem implements YogaPoseItem {
  const factory _YogaPoseItem(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'imageUrl') final String? imageUrl,
      @JsonKey(name: 'minutes') required final int minutes,
      @JsonKey(name: 'calos') required final int calos}) = _$YogaPoseItemImpl;

  factory _YogaPoseItem.fromJson(Map<String, dynamic> json) =
      _$YogaPoseItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'minutes')
  int get minutes;
  @override
  @JsonKey(name: 'calos')
  int get calos;

  /// Create a copy of YogaPoseItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YogaPoseItemImplCopyWith<_$YogaPoseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
