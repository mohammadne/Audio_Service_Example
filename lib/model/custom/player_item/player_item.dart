import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'player_item.g.dart';

@HiveType(typeId: 1)
class PlayerItem {
  PlayerItem({
    @required this.id,
    @required this.album,
    @required this.artist,
    @required this.title,
    @required this.artUri,
    @required this.duration,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String album;
  @HiveField(2)
  final String artist;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String artUri;
  @HiveField(5)
  final Duration duration;
}
