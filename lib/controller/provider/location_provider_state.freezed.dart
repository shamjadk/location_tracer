// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationProviderState {
  List<LocationModel> get locations => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationProviderStateCopyWith<LocationProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationProviderStateCopyWith<$Res> {
  factory $LocationProviderStateCopyWith(LocationProviderState value,
          $Res Function(LocationProviderState) then) =
      _$LocationProviderStateCopyWithImpl<$Res, LocationProviderState>;
  @useResult
  $Res call({List<LocationModel> locations, Timer? timer});
}

/// @nodoc
class _$LocationProviderStateCopyWithImpl<$Res,
        $Val extends LocationProviderState>
    implements $LocationProviderStateCopyWith<$Res> {
  _$LocationProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationProviderStateImplCopyWith<$Res>
    implements $LocationProviderStateCopyWith<$Res> {
  factory _$$LocationProviderStateImplCopyWith(
          _$LocationProviderStateImpl value,
          $Res Function(_$LocationProviderStateImpl) then) =
      __$$LocationProviderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocationModel> locations, Timer? timer});
}

/// @nodoc
class __$$LocationProviderStateImplCopyWithImpl<$Res>
    extends _$LocationProviderStateCopyWithImpl<$Res,
        _$LocationProviderStateImpl>
    implements _$$LocationProviderStateImplCopyWith<$Res> {
  __$$LocationProviderStateImplCopyWithImpl(_$LocationProviderStateImpl _value,
      $Res Function(_$LocationProviderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? timer = freezed,
  }) {
    return _then(_$LocationProviderStateImpl(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$LocationProviderStateImpl implements _LocationProviderState {
  _$LocationProviderStateImpl(
      {required final List<LocationModel> locations, required this.timer})
      : _locations = locations;

  final List<LocationModel> _locations;
  @override
  List<LocationModel> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  final Timer? timer;

  @override
  String toString() {
    return 'LocationProviderState(locations: $locations, timer: $timer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationProviderStateImpl &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_locations), timer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationProviderStateImplCopyWith<_$LocationProviderStateImpl>
      get copyWith => __$$LocationProviderStateImplCopyWithImpl<
          _$LocationProviderStateImpl>(this, _$identity);
}

abstract class _LocationProviderState implements LocationProviderState {
  factory _LocationProviderState(
      {required final List<LocationModel> locations,
      required final Timer? timer}) = _$LocationProviderStateImpl;

  @override
  List<LocationModel> get locations;
  @override
  Timer? get timer;
  @override
  @JsonKey(ignore: true)
  _$$LocationProviderStateImplCopyWith<_$LocationProviderStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
