// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player_service_play_back_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PlayerServicePlayBackState _$PlayerServicePlayBackStateFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'order':
      return Order.fromJson(json);
    case 'repeatAll':
      return RepeatAll.fromJson(json);
    case 'repeatOne':
      return RepeatOne.fromJson(json);
    case 'shuffle':
      return Shuffle.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$PlayerServicePlayBackStateTearOff {
  const _$PlayerServicePlayBackStateTearOff();

  Order order() {
    return const Order();
  }

  RepeatAll repeatAll() {
    return const RepeatAll();
  }

  RepeatOne repeatOne() {
    return const RepeatOne();
  }

  Shuffle shuffle() {
    return const Shuffle();
  }
}

// ignore: unused_element
const $PlayerServicePlayBackState = _$PlayerServicePlayBackStateTearOff();

mixin _$PlayerServicePlayBackState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result order(),
    @required Result repeatAll(),
    @required Result repeatOne(),
    @required Result shuffle(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result order(),
    Result repeatAll(),
    Result repeatOne(),
    Result shuffle(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result order(Order value),
    @required Result repeatAll(RepeatAll value),
    @required Result repeatOne(RepeatOne value),
    @required Result shuffle(Shuffle value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result order(Order value),
    Result repeatAll(RepeatAll value),
    Result repeatOne(RepeatOne value),
    Result shuffle(Shuffle value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

abstract class $PlayerServicePlayBackStateCopyWith<$Res> {
  factory $PlayerServicePlayBackStateCopyWith(PlayerServicePlayBackState value,
          $Res Function(PlayerServicePlayBackState) then) =
      _$PlayerServicePlayBackStateCopyWithImpl<$Res>;
}

class _$PlayerServicePlayBackStateCopyWithImpl<$Res>
    implements $PlayerServicePlayBackStateCopyWith<$Res> {
  _$PlayerServicePlayBackStateCopyWithImpl(this._value, this._then);

  final PlayerServicePlayBackState _value;
  // ignore: unused_field
  final $Res Function(PlayerServicePlayBackState) _then;
}

abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
}

class _$OrderCopyWithImpl<$Res>
    extends _$PlayerServicePlayBackStateCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(Order _value, $Res Function(Order) _then)
      : super(_value, (v) => _then(v as Order));

  @override
  Order get _value => super._value as Order;
}

@JsonSerializable()
class _$Order implements Order {
  const _$Order();

  factory _$Order.fromJson(Map<String, dynamic> json) =>
      _$_$OrderFromJson(json);

  @override
  String toString() {
    return 'PlayerServicePlayBackState.order()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Order);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result order(),
    @required Result repeatAll(),
    @required Result repeatOne(),
    @required Result shuffle(),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return order();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result order(),
    Result repeatAll(),
    Result repeatOne(),
    Result shuffle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (order != null) {
      return order();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result order(Order value),
    @required Result repeatAll(RepeatAll value),
    @required Result repeatOne(RepeatOne value),
    @required Result shuffle(Shuffle value),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return order(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result order(Order value),
    Result repeatAll(RepeatAll value),
    Result repeatOne(RepeatOne value),
    Result shuffle(Shuffle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (order != null) {
      return order(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$OrderToJson(this)..['runtimeType'] = 'order';
  }
}

abstract class Order implements PlayerServicePlayBackState {
  const factory Order() = _$Order;

  factory Order.fromJson(Map<String, dynamic> json) = _$Order.fromJson;
}

abstract class $RepeatAllCopyWith<$Res> {
  factory $RepeatAllCopyWith(RepeatAll value, $Res Function(RepeatAll) then) =
      _$RepeatAllCopyWithImpl<$Res>;
}

class _$RepeatAllCopyWithImpl<$Res>
    extends _$PlayerServicePlayBackStateCopyWithImpl<$Res>
    implements $RepeatAllCopyWith<$Res> {
  _$RepeatAllCopyWithImpl(RepeatAll _value, $Res Function(RepeatAll) _then)
      : super(_value, (v) => _then(v as RepeatAll));

  @override
  RepeatAll get _value => super._value as RepeatAll;
}

@JsonSerializable()
class _$RepeatAll implements RepeatAll {
  const _$RepeatAll();

  factory _$RepeatAll.fromJson(Map<String, dynamic> json) =>
      _$_$RepeatAllFromJson(json);

  @override
  String toString() {
    return 'PlayerServicePlayBackState.repeatAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RepeatAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result order(),
    @required Result repeatAll(),
    @required Result repeatOne(),
    @required Result shuffle(),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return repeatAll();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result order(),
    Result repeatAll(),
    Result repeatOne(),
    Result shuffle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatAll != null) {
      return repeatAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result order(Order value),
    @required Result repeatAll(RepeatAll value),
    @required Result repeatOne(RepeatOne value),
    @required Result shuffle(Shuffle value),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return repeatAll(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result order(Order value),
    Result repeatAll(RepeatAll value),
    Result repeatOne(RepeatOne value),
    Result shuffle(Shuffle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatAll != null) {
      return repeatAll(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RepeatAllToJson(this)..['runtimeType'] = 'repeatAll';
  }
}

abstract class RepeatAll implements PlayerServicePlayBackState {
  const factory RepeatAll() = _$RepeatAll;

  factory RepeatAll.fromJson(Map<String, dynamic> json) = _$RepeatAll.fromJson;
}

abstract class $RepeatOneCopyWith<$Res> {
  factory $RepeatOneCopyWith(RepeatOne value, $Res Function(RepeatOne) then) =
      _$RepeatOneCopyWithImpl<$Res>;
}

class _$RepeatOneCopyWithImpl<$Res>
    extends _$PlayerServicePlayBackStateCopyWithImpl<$Res>
    implements $RepeatOneCopyWith<$Res> {
  _$RepeatOneCopyWithImpl(RepeatOne _value, $Res Function(RepeatOne) _then)
      : super(_value, (v) => _then(v as RepeatOne));

  @override
  RepeatOne get _value => super._value as RepeatOne;
}

@JsonSerializable()
class _$RepeatOne implements RepeatOne {
  const _$RepeatOne();

  factory _$RepeatOne.fromJson(Map<String, dynamic> json) =>
      _$_$RepeatOneFromJson(json);

  @override
  String toString() {
    return 'PlayerServicePlayBackState.repeatOne()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RepeatOne);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result order(),
    @required Result repeatAll(),
    @required Result repeatOne(),
    @required Result shuffle(),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return repeatOne();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result order(),
    Result repeatAll(),
    Result repeatOne(),
    Result shuffle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatOne != null) {
      return repeatOne();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result order(Order value),
    @required Result repeatAll(RepeatAll value),
    @required Result repeatOne(RepeatOne value),
    @required Result shuffle(Shuffle value),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return repeatOne(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result order(Order value),
    Result repeatAll(RepeatAll value),
    Result repeatOne(RepeatOne value),
    Result shuffle(Shuffle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (repeatOne != null) {
      return repeatOne(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$RepeatOneToJson(this)..['runtimeType'] = 'repeatOne';
  }
}

abstract class RepeatOne implements PlayerServicePlayBackState {
  const factory RepeatOne() = _$RepeatOne;

  factory RepeatOne.fromJson(Map<String, dynamic> json) = _$RepeatOne.fromJson;
}

abstract class $ShuffleCopyWith<$Res> {
  factory $ShuffleCopyWith(Shuffle value, $Res Function(Shuffle) then) =
      _$ShuffleCopyWithImpl<$Res>;
}

class _$ShuffleCopyWithImpl<$Res>
    extends _$PlayerServicePlayBackStateCopyWithImpl<$Res>
    implements $ShuffleCopyWith<$Res> {
  _$ShuffleCopyWithImpl(Shuffle _value, $Res Function(Shuffle) _then)
      : super(_value, (v) => _then(v as Shuffle));

  @override
  Shuffle get _value => super._value as Shuffle;
}

@JsonSerializable()
class _$Shuffle implements Shuffle {
  const _$Shuffle();

  factory _$Shuffle.fromJson(Map<String, dynamic> json) =>
      _$_$ShuffleFromJson(json);

  @override
  String toString() {
    return 'PlayerServicePlayBackState.shuffle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Shuffle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result order(),
    @required Result repeatAll(),
    @required Result repeatOne(),
    @required Result shuffle(),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return shuffle();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result order(),
    Result repeatAll(),
    Result repeatOne(),
    Result shuffle(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shuffle != null) {
      return shuffle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result order(Order value),
    @required Result repeatAll(RepeatAll value),
    @required Result repeatOne(RepeatOne value),
    @required Result shuffle(Shuffle value),
  }) {
    assert(order != null);
    assert(repeatAll != null);
    assert(repeatOne != null);
    assert(shuffle != null);
    return shuffle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result order(Order value),
    Result repeatAll(RepeatAll value),
    Result repeatOne(RepeatOne value),
    Result shuffle(Shuffle value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shuffle != null) {
      return shuffle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$ShuffleToJson(this)..['runtimeType'] = 'shuffle';
  }
}

abstract class Shuffle implements PlayerServicePlayBackState {
  const factory Shuffle() = _$Shuffle;

  factory Shuffle.fromJson(Map<String, dynamic> json) = _$Shuffle.fromJson;
}
