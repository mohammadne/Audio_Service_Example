// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player_service_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PlayerServiceItem _$PlayerServiceItemFromJson(Map<String, dynamic> json) {
  return _PlayerServiceItem.fromJson(json);
}

class _$PlayerServiceItemTearOff {
  const _$PlayerServiceItemTearOff();

  _PlayerServiceItem call(
      {@required String id,
      @required String album,
      @required String artist,
      @required String title,
      @required String artUri,
      @required Duration duration,
      String genre}) {
    return _PlayerServiceItem(
      id: id,
      album: album,
      artist: artist,
      title: title,
      artUri: artUri,
      duration: duration,
      genre: genre,
    );
  }
}

// ignore: unused_element
const $PlayerServiceItem = _$PlayerServiceItemTearOff();

mixin _$PlayerServiceItem {
  String get id;
  String get album;
  String get artist;
  String get title;
  String get artUri;
  Duration get duration;
  String get genre;

  Map<String, dynamic> toJson();
  $PlayerServiceItemCopyWith<PlayerServiceItem> get copyWith;
}

abstract class $PlayerServiceItemCopyWith<$Res> {
  factory $PlayerServiceItemCopyWith(
          PlayerServiceItem value, $Res Function(PlayerServiceItem) then) =
      _$PlayerServiceItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String album,
      String artist,
      String title,
      String artUri,
      Duration duration,
      String genre});
}

class _$PlayerServiceItemCopyWithImpl<$Res>
    implements $PlayerServiceItemCopyWith<$Res> {
  _$PlayerServiceItemCopyWithImpl(this._value, this._then);

  final PlayerServiceItem _value;
  // ignore: unused_field
  final $Res Function(PlayerServiceItem) _then;

  @override
  $Res call({
    Object id = freezed,
    Object album = freezed,
    Object artist = freezed,
    Object title = freezed,
    Object artUri = freezed,
    Object duration = freezed,
    Object genre = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      album: album == freezed ? _value.album : album as String,
      artist: artist == freezed ? _value.artist : artist as String,
      title: title == freezed ? _value.title : title as String,
      artUri: artUri == freezed ? _value.artUri : artUri as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
      genre: genre == freezed ? _value.genre : genre as String,
    ));
  }
}

abstract class _$PlayerServiceItemCopyWith<$Res>
    implements $PlayerServiceItemCopyWith<$Res> {
  factory _$PlayerServiceItemCopyWith(
          _PlayerServiceItem value, $Res Function(_PlayerServiceItem) then) =
      __$PlayerServiceItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String album,
      String artist,
      String title,
      String artUri,
      Duration duration,
      String genre});
}

class __$PlayerServiceItemCopyWithImpl<$Res>
    extends _$PlayerServiceItemCopyWithImpl<$Res>
    implements _$PlayerServiceItemCopyWith<$Res> {
  __$PlayerServiceItemCopyWithImpl(
      _PlayerServiceItem _value, $Res Function(_PlayerServiceItem) _then)
      : super(_value, (v) => _then(v as _PlayerServiceItem));

  @override
  _PlayerServiceItem get _value => super._value as _PlayerServiceItem;

  @override
  $Res call({
    Object id = freezed,
    Object album = freezed,
    Object artist = freezed,
    Object title = freezed,
    Object artUri = freezed,
    Object duration = freezed,
    Object genre = freezed,
  }) {
    return _then(_PlayerServiceItem(
      id: id == freezed ? _value.id : id as String,
      album: album == freezed ? _value.album : album as String,
      artist: artist == freezed ? _value.artist : artist as String,
      title: title == freezed ? _value.title : title as String,
      artUri: artUri == freezed ? _value.artUri : artUri as String,
      duration: duration == freezed ? _value.duration : duration as Duration,
      genre: genre == freezed ? _value.genre : genre as String,
    ));
  }
}

@JsonSerializable()
class _$_PlayerServiceItem implements _PlayerServiceItem {
  const _$_PlayerServiceItem(
      {@required this.id,
      @required this.album,
      @required this.artist,
      @required this.title,
      @required this.artUri,
      @required this.duration,
      this.genre})
      : assert(id != null),
        assert(album != null),
        assert(artist != null),
        assert(title != null),
        assert(artUri != null),
        assert(duration != null);

  factory _$_PlayerServiceItem.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerServiceItemFromJson(json);

  @override
  final String id;
  @override
  final String album;
  @override
  final String artist;
  @override
  final String title;
  @override
  final String artUri;
  @override
  final Duration duration;
  @override
  final String genre;

  @override
  String toString() {
    return 'PlayerServiceItem(id: $id, album: $album, artist: $artist, title: $title, artUri: $artUri, duration: $duration, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerServiceItem &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.album, album) ||
                const DeepCollectionEquality().equals(other.album, album)) &&
            (identical(other.artist, artist) ||
                const DeepCollectionEquality().equals(other.artist, artist)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.artUri, artUri) ||
                const DeepCollectionEquality().equals(other.artUri, artUri)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.genre, genre) ||
                const DeepCollectionEquality().equals(other.genre, genre)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(album) ^
      const DeepCollectionEquality().hash(artist) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(artUri) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(genre);

  @override
  _$PlayerServiceItemCopyWith<_PlayerServiceItem> get copyWith =>
      __$PlayerServiceItemCopyWithImpl<_PlayerServiceItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerServiceItemToJson(this);
  }
}

abstract class _PlayerServiceItem implements PlayerServiceItem {
  const factory _PlayerServiceItem(
      {@required String id,
      @required String album,
      @required String artist,
      @required String title,
      @required String artUri,
      @required Duration duration,
      String genre}) = _$_PlayerServiceItem;

  factory _PlayerServiceItem.fromJson(Map<String, dynamic> json) =
      _$_PlayerServiceItem.fromJson;

  @override
  String get id;
  @override
  String get album;
  @override
  String get artist;
  @override
  String get title;
  @override
  String get artUri;
  @override
  Duration get duration;
  @override
  String get genre;
  @override
  _$PlayerServiceItemCopyWith<_PlayerServiceItem> get copyWith;
}
