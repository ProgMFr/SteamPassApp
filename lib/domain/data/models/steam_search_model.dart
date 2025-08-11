import 'dart:convert';

SteamSearchModel basicSearchModelFromJson(String str) =>
    SteamSearchModel.fromJson(json.decode(str));

class SteamSearchModel {
  int? total;
  List<GameItem>? items;

  SteamSearchModel({this.total, this.items});

  factory SteamSearchModel.fromJson(Map<String, dynamic> json) =>
      SteamSearchModel(
        total: _toInt(json["total"]),
        items:
            json["items"] == null
                ? []
                : List<GameItem>.from(
                  json["items"]!.map((x) => GameItem.fromJson(x)),
                ),
      );
}

class GameItem {
  String? type;
  String? name;
  int? id;
  Price? price;
  String? tinyImage;
  String? metascore;
  Platforms? platforms;
  bool? streamingvideo;
  String? controllerSupport;

  GameItem({
    this.type,
    this.name,
    this.id,
    this.price,
    this.tinyImage,
    this.metascore,
    this.platforms,
    this.streamingvideo,
    this.controllerSupport,
  });

  factory GameItem.fromJson(Map<String, dynamic> json) => GameItem(
    type: json["type"]?.toString(),
    name: json["name"]?.toString(),
    id: _toInt(json["id"]),
    price: json["price"] == null ? null : Price.fromJson(json["price"]),
    tinyImage: json["tiny_image"]?.toString(),
    metascore: json["metascore"]?.toString(),
    platforms:
        json["platforms"] == null
            ? null
            : Platforms.fromJson(json["platforms"]),
    streamingvideo: json["streamingvideo"] as bool?,
    controllerSupport: json["controller_support"]?.toString(),
  );
}

class Platforms {
  bool? windows;
  bool? mac;
  bool? linux;

  Platforms({this.windows, this.mac, this.linux});

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
    windows: json["windows"] as bool?,
    mac: json["mac"] as bool?,
    linux: json["linux"] as bool?,
  );
}

class Price {
  String? currency;
  int? initial;
  int? priceFinal;

  Price({this.currency, this.initial, this.priceFinal});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    currency: json["currency"]?.toString(),
    initial: _toInt(json["initial"]),
    priceFinal: _toInt(json["final"]),
  );
}

int? _toInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}
