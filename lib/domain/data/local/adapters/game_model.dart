import 'package:hive/hive.dart';

part 'game_model.g.dart';

@HiveType(typeId: 0)
class Game extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? price;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final List<String> files;

  Game({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.files,
  });
}
