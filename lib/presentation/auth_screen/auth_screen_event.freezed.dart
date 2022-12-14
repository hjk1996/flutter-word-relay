// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenEventCopyWith<$Res> {
  factory $AuthScreenEventCopyWith(
          AuthScreenEvent value, $Res Function(AuthScreenEvent) then) =
      _$AuthScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthScreenEventCopyWithImpl<$Res>
    implements $AuthScreenEventCopyWith<$Res> {
  _$AuthScreenEventCopyWithImpl(this._value, this._then);

  final AuthScreenEvent _value;
  // ignore: unused_field
  final $Res Function(AuthScreenEvent) _then;
}

/// @nodoc
abstract class _$$OnAuthErrorCopyWith<$Res> {
  factory _$$OnAuthErrorCopyWith(
          _$OnAuthError value, $Res Function(_$OnAuthError) then) =
      __$$OnAuthErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$OnAuthErrorCopyWithImpl<$Res>
    extends _$AuthScreenEventCopyWithImpl<$Res>
    implements _$$OnAuthErrorCopyWith<$Res> {
  __$$OnAuthErrorCopyWithImpl(
      _$OnAuthError _value, $Res Function(_$OnAuthError) _then)
      : super(_value, (v) => _then(v as _$OnAuthError));

  @override
  _$OnAuthError get _value => super._value as _$OnAuthError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$OnAuthError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnAuthError implements OnAuthError {
  const _$OnAuthError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthScreenEvent.onAuthError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAuthError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$OnAuthErrorCopyWith<_$OnAuthError> get copyWith =>
      __$$OnAuthErrorCopyWithImpl<_$OnAuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) {
    return onAuthError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) {
    return onAuthError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onAuthError != null) {
      return onAuthError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) {
    return onAuthError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) {
    return onAuthError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onAuthError != null) {
      return onAuthError(this);
    }
    return orElse();
  }
}

abstract class OnAuthError implements AuthScreenEvent {
  const factory OnAuthError(final String message) = _$OnAuthError;

  String get message;
  @JsonKey(ignore: true)
  _$$OnAuthErrorCopyWith<_$OnAuthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSignInSuccessCopyWith<$Res> {
  factory _$$OnSignInSuccessCopyWith(
          _$OnSignInSuccess value, $Res Function(_$OnSignInSuccess) then) =
      __$$OnSignInSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSignInSuccessCopyWithImpl<$Res>
    extends _$AuthScreenEventCopyWithImpl<$Res>
    implements _$$OnSignInSuccessCopyWith<$Res> {
  __$$OnSignInSuccessCopyWithImpl(
      _$OnSignInSuccess _value, $Res Function(_$OnSignInSuccess) _then)
      : super(_value, (v) => _then(v as _$OnSignInSuccess));

  @override
  _$OnSignInSuccess get _value => super._value as _$OnSignInSuccess;
}

/// @nodoc

class _$OnSignInSuccess implements OnSignInSuccess {
  const _$OnSignInSuccess();

  @override
  String toString() {
    return 'AuthScreenEvent.onSignInSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSignInSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) {
    return onSignInSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) {
    return onSignInSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onSignInSuccess != null) {
      return onSignInSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) {
    return onSignInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) {
    return onSignInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onSignInSuccess != null) {
      return onSignInSuccess(this);
    }
    return orElse();
  }
}

abstract class OnSignInSuccess implements AuthScreenEvent {
  const factory OnSignInSuccess() = _$OnSignInSuccess;
}

/// @nodoc
abstract class _$$OnSignUpSuccessCopyWith<$Res> {
  factory _$$OnSignUpSuccessCopyWith(
          _$OnSignUpSuccess value, $Res Function(_$OnSignUpSuccess) then) =
      __$$OnSignUpSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSignUpSuccessCopyWithImpl<$Res>
    extends _$AuthScreenEventCopyWithImpl<$Res>
    implements _$$OnSignUpSuccessCopyWith<$Res> {
  __$$OnSignUpSuccessCopyWithImpl(
      _$OnSignUpSuccess _value, $Res Function(_$OnSignUpSuccess) _then)
      : super(_value, (v) => _then(v as _$OnSignUpSuccess));

  @override
  _$OnSignUpSuccess get _value => super._value as _$OnSignUpSuccess;
}

/// @nodoc

class _$OnSignUpSuccess implements OnSignUpSuccess {
  const _$OnSignUpSuccess();

  @override
  String toString() {
    return 'AuthScreenEvent.onSignUpSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSignUpSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) {
    return onSignUpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) {
    return onSignUpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onSignUpSuccess != null) {
      return onSignUpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) {
    return onSignUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) {
    return onSignUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onSignUpSuccess != null) {
      return onSignUpSuccess(this);
    }
    return orElse();
  }
}

abstract class OnSignUpSuccess implements AuthScreenEvent {
  const factory OnSignUpSuccess() = _$OnSignUpSuccess;
}

/// @nodoc
abstract class _$$OnProfileTapCopyWith<$Res> {
  factory _$$OnProfileTapCopyWith(
          _$OnProfileTap value, $Res Function(_$OnProfileTap) then) =
      __$$OnProfileTapCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnProfileTapCopyWithImpl<$Res>
    extends _$AuthScreenEventCopyWithImpl<$Res>
    implements _$$OnProfileTapCopyWith<$Res> {
  __$$OnProfileTapCopyWithImpl(
      _$OnProfileTap _value, $Res Function(_$OnProfileTap) _then)
      : super(_value, (v) => _then(v as _$OnProfileTap));

  @override
  _$OnProfileTap get _value => super._value as _$OnProfileTap;
}

/// @nodoc

class _$OnProfileTap implements OnProfileTap {
  const _$OnProfileTap();

  @override
  String toString() {
    return 'AuthScreenEvent.onProfileTap()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnProfileTap);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) {
    return onProfileTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) {
    return onProfileTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onProfileTap != null) {
      return onProfileTap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) {
    return onProfileTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) {
    return onProfileTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onProfileTap != null) {
      return onProfileTap(this);
    }
    return orElse();
  }
}

abstract class OnProfileTap implements AuthScreenEvent {
  const factory OnProfileTap() = _$OnProfileTap;
}

/// @nodoc
abstract class _$$OnProfileSettingDoneCopyWith<$Res> {
  factory _$$OnProfileSettingDoneCopyWith(_$OnProfileSettingDone value,
          $Res Function(_$OnProfileSettingDone) then) =
      __$$OnProfileSettingDoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnProfileSettingDoneCopyWithImpl<$Res>
    extends _$AuthScreenEventCopyWithImpl<$Res>
    implements _$$OnProfileSettingDoneCopyWith<$Res> {
  __$$OnProfileSettingDoneCopyWithImpl(_$OnProfileSettingDone _value,
      $Res Function(_$OnProfileSettingDone) _then)
      : super(_value, (v) => _then(v as _$OnProfileSettingDone));

  @override
  _$OnProfileSettingDone get _value => super._value as _$OnProfileSettingDone;
}

/// @nodoc

class _$OnProfileSettingDone implements OnProfileSettingDone {
  const _$OnProfileSettingDone();

  @override
  String toString() {
    return 'AuthScreenEvent.onProfileSettingDone()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnProfileSettingDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) onAuthError,
    required TResult Function() onSignInSuccess,
    required TResult Function() onSignUpSuccess,
    required TResult Function() onProfileTap,
    required TResult Function() onProfileSettingDone,
  }) {
    return onProfileSettingDone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
  }) {
    return onProfileSettingDone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? onAuthError,
    TResult Function()? onSignInSuccess,
    TResult Function()? onSignUpSuccess,
    TResult Function()? onProfileTap,
    TResult Function()? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onProfileSettingDone != null) {
      return onProfileSettingDone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnAuthError value) onAuthError,
    required TResult Function(OnSignInSuccess value) onSignInSuccess,
    required TResult Function(OnSignUpSuccess value) onSignUpSuccess,
    required TResult Function(OnProfileTap value) onProfileTap,
    required TResult Function(OnProfileSettingDone value) onProfileSettingDone,
  }) {
    return onProfileSettingDone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
  }) {
    return onProfileSettingDone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnAuthError value)? onAuthError,
    TResult Function(OnSignInSuccess value)? onSignInSuccess,
    TResult Function(OnSignUpSuccess value)? onSignUpSuccess,
    TResult Function(OnProfileTap value)? onProfileTap,
    TResult Function(OnProfileSettingDone value)? onProfileSettingDone,
    required TResult orElse(),
  }) {
    if (onProfileSettingDone != null) {
      return onProfileSettingDone(this);
    }
    return orElse();
  }
}

abstract class OnProfileSettingDone implements AuthScreenEvent {
  const factory OnProfileSettingDone() = _$OnProfileSettingDone;
}
