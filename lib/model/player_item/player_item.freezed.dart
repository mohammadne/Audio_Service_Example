// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PlayerItem _$PlayerItemFromJson(Map<String, dynamic> json) {
  return _PlayerItem.fromJson(json);
}

class _$PlayerItemTearOff {
  const _$PlayerItemTearOff();

  _PlayerItem call(
      {@required String id,
      @required String album,
      @required String title,
      String artUri,
      String genre,
      Duration duration}) {
    return _PlayerItem(
      id: id,
      album: album,
      title: title,
      artUri: artUri,
      genre: genre,
      duration: duration,
    );
  }
}

// ignore: unused_element
const $PlayerItem = _$PlayerItemTearOff();

mixin _$PlayerItem {
  String get id;
  String get album;
  String get title;
  String get artUri;
  String get genre;
  Duration get duration;

  Map<String, dynamic> toJson();
  $PlayerItemCopyWith<PlayerItem> get copyWith;
}

abstract class $PlayerItemCopyWith<$Res> {
  factory $PlayerItemCopyWith(
          PlayerItem value, $Res Function(PlayerItem) then) =
      _$PlayerItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String album,
      String title,
      String artUri,
      String genre,
      Duration duration});
}

class _$PlayerItemCopyWithImpl<$Res> implements $PlayerItemCopyWith<$Res> {
  _$PlayerItemCopyWithImpl(this._value, this._then);

  final PlayerItem _value;
  // ignore: unused_field
  final $Res Function(PlayerItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object album = freezed,
    Object title = freezed,
    Object artUri = freezed,
    Object genre = freezed,
    Object duration = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      album: album == freezed ? _value.album : album as String,
      title: title == freezed ? _value.title : title as String,
      artUri: artUri == freezed ? _value.artUri : artUri as String,
      genre: genre == freezed ? _value.genre : genre as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
    ));
  }
}

abstract class _$PlayerItemCopyWith<$Res> implements $PlayerItemCopyWith<$Res> {
  factory _$PlayerItemCopyWith(
          _PlayerItem value, $Res Function(_PlayerItem) then) =
      __$PlayerItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String album,
      String title,
      String artUri,
      String genre,
      Duration duration});
}

class __$PlayerItemCopyWithImpl<$Res> extends _$PlayerItemCopyWithImpl<$Res>
    implements _$PlayerItemCopyWith<$Res> {
  __$PlayerItemCopyWithImpl(
      _PlayerItem _value, $Res Function(_PlayerItem) _then)
      : super(_value, (v) => _then(v as _PlayerItem));

  @override
  _PlayerItem get _value => super._value as _PlayerItem;

  @override
  $Res call({
    Object id = freezed,
    Object album = freezed,
    Object title = freezed,
    Object artUri = freezed,
    Object genre = freezed,
    Object duration = freezed,
  }) {
    return _then(_PlayerItem(
      id: id == freezed ? _value.id : id as String,
      album: album == freezed ? _value.album : album as String,
      title: title == freezed ? _value.title : title as String,
      artUri: artUri == freezed ? _value.artUri : artUri as String,
      genre: genre == freezed ? _value.genre : genre as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
    ));
  }
}

@JsonSerializable()
class _$_PlayerItem implements _PlayerItem {
  const _$_PlayerItem(
      {@required this.id,
      @required this.album,
      @required this.title,
      this.artUri,
      this.genre,
      this.duration})
      : assert(id != null),
        assert(album != null),
        assert(title != null);

  factory _$_PlayerItem.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerItemFromJson(json);

  @override
  final String id;
  @override
  final String album;
  @override
  final String title;
  @override
  final String artUri;
  @override
  final String genre;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'PlayerItem(id: $id, album: $album, title: $title, artUri: $artUri, genre: $genre, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.album, album) ||
                const DeepCollectionEquality().equals(other.album, album)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.artUri, artUri) ||
                const DeepCollectionEquality().equals(other.artUri, artUri)) &&
            (identical(other.genre, genre) ||
                const DeepCollectionEquality().equals(other.genre, genre)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(album) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(artUri) ^
      const DeepCollectionEquality().hash(genre) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$PlayerItemCopyWith<_PlayerItem> get copyWith =>
      __$PlayerItemCopyWithImpl<_PlayerItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerItemToJson(this);
  }
}

abstract class _PlayerItem implements PlayerItem {
  const factory _PlayerItem(
      {@required String id,
      @required String album,
      @required String title,
      String artUri,
      String genre,
      Duration duration}) = _$_PlayerItem;

  factory _PlayerItem.fromJson(Map<String, dynamic> json) =
      _$_PlayerItem.fromJson;

  @override
  String get id;
  @override
  String get album;
  @override
  String get title;
  @override
  String get artUri;
  @override
  String get genre;
  @override
  Duration get duration;
  @override
  _$PlayerItemCopyWith<_PlayerItem> get copyWith;
}
