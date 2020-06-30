// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'player_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PlayerServiceState _$PlayerServiceStateFromJson(Map<String, dynamic> json) {
  return _PlayerServiceState.fromJson(json);
}

class _$PlayerServiceStateTearOff {
  const _$PlayerServiceStateTearOff();

  _PlayerServiceState call(
      {@required String id,
      @required String album,
      @required String artist,
      @required String title,
      @required String artUri,
      @required Duration duration,
      String genre}) {
    return _PlayerServiceState(
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
const $PlayerServiceState = _$PlayerServiceStateTearOff();

mixin _$PlayerServiceState {
  String get id;
  String get album;
  String get artist;
  String get title;
  String get artUri;
  Duration get duration;
  String get genre;

  Map<String, dynamic> toJson();
  $PlayerServiceStateCopyWith<PlayerServiceState> get copyWith;
}

abstract class $PlayerServiceStateCopyWith<$Res> {
  factory $PlayerServiceStateCopyWith(
          PlayerServiceState value, $Res Function(PlayerServiceState) then) =
      _$PlayerServiceStateCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String album,
      String artist,
      String title,
      String artUri,
      Duration duration,
      String genre});
}

class _$PlayerServiceStateCopyWithImpl<$Res>
    implements $PlayerServiceStateCopyWith<$Res> {
  _$PlayerServiceStateCopyWithImpl(this._value, this._then);

  final PlayerServiceState _value;
  // ignore: unused_field
  final $Res Function(PlayerServiceState) _then;

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

abstract class _$PlayerServiceStateCopyWith<$Res>
    implements $PlayerServiceStateCopyWith<$Res> {
  factory _$PlayerServiceStateCopyWith(
          _PlayerServiceState value, $Res Function(_PlayerServiceState) then) =
      __$PlayerServiceStateCopyWithImpl<$Res>;
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

class __$PlayerServiceStateCopyWithImpl<$Res>
    extends _$PlayerServiceStateCopyWithImpl<$Res>
    implements _$PlayerServiceStateCopyWith<$Res> {
  __$PlayerServiceStateCopyWithImpl(
      _PlayerServiceState _value, $Res Function(_PlayerServiceState) _then)
      : super(_value, (v) => _then(v as _PlayerServiceState));

  @override
  _PlayerServiceState get _value => super._value as _PlayerServiceState;

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
    return _then(_PlayerServiceState(
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
class _$_PlayerServiceState implements _PlayerServiceState {
  const _$_PlayerServiceState(
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

  factory _$_PlayerServiceState.fromJson(Map<String, dynamic> json) =>
      _$_$_PlayerServiceStateFromJson(json);

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
    return 'PlayerServiceState(id: $id, album: $album, artist: $artist, title: $title, artUri: $artUri, duration: $duration, genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlayerServiceState &&
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
  _$PlayerServiceStateCopyWith<_PlayerServiceState> get copyWith =>
      __$PlayerServiceStateCopyWithImpl<_PlayerServiceState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlayerServiceStateToJson(this);
  }
}

abstract class _PlayerServiceState implements PlayerServiceState {
  const factory _PlayerServiceState(
      {@required String id,
      @required String album,
      @required String artist,
      @required String title,
      @required String artUri,
      @required Duration duration,
      String genre}) = _$_PlayerServiceState;

  factory _PlayerServiceState.fromJson(Map<String, dynamic> json) =
      _$_PlayerServiceState.fromJson;

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
  _$PlayerServiceStateCopyWith<_PlayerServiceState> get copyWith;
}
