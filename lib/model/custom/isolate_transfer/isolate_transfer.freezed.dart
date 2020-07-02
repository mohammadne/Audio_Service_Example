// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'isolate_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
IsolateTransfer _$IsolateTransferFromJson(Map<String, dynamic> json) {
  return _IsolateTransfer.fromJson(json);
}

class _$IsolateTransferTearOff {
  const _$IsolateTransferTearOff();

  _IsolateTransfer call(
      {@required PlayBackOrderState processingState,
      @required ItemsState itemsState}) {
    return _IsolateTransfer(
      processingState: processingState,
      itemsState: itemsState,
    );
  }
}

// ignore: unused_element
const $IsolateTransfer = _$IsolateTransferTearOff();

mixin _$IsolateTransfer {
  PlayBackOrderState get processingState;
  ItemsState get itemsState;

  Map<String, dynamic> toJson();
  $IsolateTransferCopyWith<IsolateTransfer> get copyWith;
}

abstract class $IsolateTransferCopyWith<$Res> {
  factory $IsolateTransferCopyWith(
          IsolateTransfer value, $Res Function(IsolateTransfer) then) =
      _$IsolateTransferCopyWithImpl<$Res>;
  $Res call({PlayBackOrderState processingState, ItemsState itemsState});
}

class _$IsolateTransferCopyWithImpl<$Res>
    implements $IsolateTransferCopyWith<$Res> {
  _$IsolateTransferCopyWithImpl(this._value, this._then);

  final IsolateTransfer _value;
  // ignore: unused_field
  final $Res Function(IsolateTransfer) _then;

  @override
  $Res call({
    Object processingState = freezed,
    Object itemsState = freezed,
  }) {
    return _then(_value.copyWith(
      processingState: processingState == freezed
          ? _value.processingState
          : processingState as PlayBackOrderState,
      itemsState:
          itemsState == freezed ? _value.itemsState : itemsState as ItemsState,
    ));
  }
}

abstract class _$IsolateTransferCopyWith<$Res>
    implements $IsolateTransferCopyWith<$Res> {
  factory _$IsolateTransferCopyWith(
          _IsolateTransfer value, $Res Function(_IsolateTransfer) then) =
      __$IsolateTransferCopyWithImpl<$Res>;
  @override
  $Res call({PlayBackOrderState processingState, ItemsState itemsState});
}

class __$IsolateTransferCopyWithImpl<$Res>
    extends _$IsolateTransferCopyWithImpl<$Res>
    implements _$IsolateTransferCopyWith<$Res> {
  __$IsolateTransferCopyWithImpl(
      _IsolateTransfer _value, $Res Function(_IsolateTransfer) _then)
      : super(_value, (v) => _then(v as _IsolateTransfer));

  @override
  _IsolateTransfer get _value => super._value as _IsolateTransfer;

  @override
  $Res call({
    Object processingState = freezed,
    Object itemsState = freezed,
  }) {
    return _then(_IsolateTransfer(
      processingState: processingState == freezed
          ? _value.processingState
          : processingState as PlayBackOrderState,
      itemsState:
          itemsState == freezed ? _value.itemsState : itemsState as ItemsState,
    ));
  }
}

@JsonSerializable()
class _$_IsolateTransfer
    with DiagnosticableTreeMixin
    implements _IsolateTransfer {
  const _$_IsolateTransfer(
      {@required this.processingState, @required this.itemsState})
      : assert(processingState != null),
        assert(itemsState != null);

  factory _$_IsolateTransfer.fromJson(Map<String, dynamic> json) =>
      _$_$_IsolateTransferFromJson(json);

  @override
  final PlayBackOrderState processingState;
  @override
  final ItemsState itemsState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IsolateTransfer(processingState: $processingState, itemsState: $itemsState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IsolateTransfer'))
      ..add(DiagnosticsProperty('processingState', processingState))
      ..add(DiagnosticsProperty('itemsState', itemsState));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _IsolateTransfer &&
            (identical(other.processingState, processingState) ||
                const DeepCollectionEquality()
                    .equals(other.processingState, processingState)) &&
            (identical(other.itemsState, itemsState) ||
                const DeepCollectionEquality()
                    .equals(other.itemsState, itemsState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(processingState) ^
      const DeepCollectionEquality().hash(itemsState);

  @override
  _$IsolateTransferCopyWith<_IsolateTransfer> get copyWith =>
      __$IsolateTransferCopyWithImpl<_IsolateTransfer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_IsolateTransferToJson(this);
  }
}

abstract class _IsolateTransfer implements IsolateTransfer {
  const factory _IsolateTransfer(
      {@required PlayBackOrderState processingState,
      @required ItemsState itemsState}) = _$_IsolateTransfer;

  factory _IsolateTransfer.fromJson(Map<String, dynamic> json) =
      _$_IsolateTransfer.fromJson;

  @override
  PlayBackOrderState get processingState;
  @override
  ItemsState get itemsState;
  @override
  _$IsolateTransferCopyWith<_IsolateTransfer> get copyWith;
}
