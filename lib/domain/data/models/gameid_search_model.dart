import 'dart:convert';

GameInfoModel searchGameModelFromJson(String str) =>
    GameInfoModel.fromJson(json.decode(str));

String searchGameModelToJson(GameInfoModel data) => json.encode(data.toJson());

class GameInfoModel {
  bool? success;
  Data? data;

  GameInfoModel({this.success, this.data});

  factory GameInfoModel.fromJson(Map<String, dynamic> json) => GameInfoModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"success": success, "data": data?.toJson()};
}

class Data {
  String? type;
  String? name;
  int? steamAppid;
  String? requiredAge;
  bool? isFree;
  String? controllerSupport;
  List<int>? dlc;
  String? detailedDescription;
  String? aboutTheGame;
  String? shortDescription;
  String? supportedLanguages;
  String? headerImage;
  String? capsuleImage;
  String? capsuleImagev5;
  String? website;
  Requirements? pcRequirements;
  Requirements? macRequirements;
  Requirements? linuxRequirements;
  String? legalNotice;
  String? drmNotice;
  List<String>? developers;
  List<String>? publishers;
  List<Demo>? demos;
  PriceOverview? priceOverview;
  List<int>? packages;
  List<PackageGroup>? packageGroups;
  Platforms? platforms;
  Metacritic? metacritic;
  List<Category>? categories;
  List<Genre>? genres;
  List<Screenshot>? screenshots;
  Recommendations? recommendations;
  Achievements? achievements;
  ReleaseDate? releaseDate;
  SupportInfo? supportInfo;
  String? background;
  String? backgroundRaw;
  ContentDescriptors? contentDescriptors;
  Ratings? ratings;

  Data({
    this.type,
    this.name,
    this.steamAppid,
    this.requiredAge,
    this.isFree,
    this.controllerSupport,
    this.dlc,
    this.detailedDescription,
    this.aboutTheGame,
    this.shortDescription,
    this.supportedLanguages,
    this.headerImage,
    this.capsuleImage,
    this.capsuleImagev5,
    this.website,
    this.pcRequirements,
    this.macRequirements,
    this.linuxRequirements,
    this.legalNotice,
    this.drmNotice,
    this.developers,
    this.publishers,
    this.demos,
    this.priceOverview,
    this.packages,
    this.packageGroups,
    this.platforms,
    this.metacritic,
    this.categories,
    this.genres,
    this.screenshots,
    this.recommendations,
    this.achievements,
    this.releaseDate,
    this.supportInfo,
    this.background,
    this.backgroundRaw,
    this.contentDescriptors,
    this.ratings,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    type: json["type"],
    name: json["name"],
    steamAppid: json["steam_appid"],
    requiredAge: json["required_age"],
    isFree: json["is_free"],
    controllerSupport: json["controller_support"],
    dlc: json["dlc"] == null ? [] : List<int>.from(json["dlc"]!.map((x) => x)),
    detailedDescription: json["detailed_description"],
    aboutTheGame: json["about_the_game"],
    shortDescription: json["short_description"],
    supportedLanguages: json["supported_languages"],
    headerImage: json["header_image"],
    capsuleImage: json["capsule_image"],
    capsuleImagev5: json["capsule_imagev5"],
    website: json["website"],
    pcRequirements:
        json["pc_requirements"] == null
            ? null
            : Requirements.fromJson(json["pc_requirements"]),
    macRequirements:
        json["mac_requirements"] == null
            ? null
            : Requirements.fromJson(json["mac_requirements"]),
    linuxRequirements:
        json["linux_requirements"] == null
            ? null
            : Requirements.fromJson(json["linux_requirements"]),
    legalNotice: json["legal_notice"],
    drmNotice: json["drm_notice"],
    developers:
        json["developers"] == null
            ? []
            : List<String>.from(json["developers"]!.map((x) => x)),
    publishers:
        json["publishers"] == null
            ? []
            : List<String>.from(json["publishers"]!.map((x) => x)),
    demos:
        json["demos"] == null
            ? []
            : List<Demo>.from(json["demos"]!.map((x) => Demo.fromJson(x))),
    priceOverview:
        json["price_overview"] == null
            ? null
            : PriceOverview.fromJson(json["price_overview"]),
    packages:
        json["packages"] == null
            ? []
            : List<int>.from(json["packages"]!.map((x) => x)),
    packageGroups:
        json["package_groups"] == null
            ? []
            : List<PackageGroup>.from(
              json["package_groups"]!.map((x) => PackageGroup.fromJson(x)),
            ),
    platforms:
        json["platforms"] == null
            ? null
            : Platforms.fromJson(json["platforms"]),
    metacritic:
        json["metacritic"] == null
            ? null
            : Metacritic.fromJson(json["metacritic"]),
    categories:
        json["categories"] == null
            ? []
            : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x)),
            ),
    genres:
        json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    screenshots:
        json["screenshots"] == null
            ? []
            : List<Screenshot>.from(
              json["screenshots"]!.map((x) => Screenshot.fromJson(x)),
            ),
    recommendations:
        json["recommendations"] == null
            ? null
            : Recommendations.fromJson(json["recommendations"]),
    achievements:
        json["achievements"] == null
            ? null
            : Achievements.fromJson(json["achievements"]),
    releaseDate:
        json["release_date"] == null
            ? null
            : ReleaseDate.fromJson(json["release_date"]),
    supportInfo:
        json["support_info"] == null
            ? null
            : SupportInfo.fromJson(json["support_info"]),
    background: json["background"],
    backgroundRaw: json["background_raw"],
    contentDescriptors:
        json["content_descriptors"] == null
            ? null
            : ContentDescriptors.fromJson(json["content_descriptors"]),
    ratings: json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "name": name,
    "steam_appid": steamAppid,
    "required_age": requiredAge,
    "is_free": isFree,
    "controller_support": controllerSupport,
    "dlc": dlc == null ? [] : List<dynamic>.from(dlc!.map((x) => x)),
    "detailed_description": detailedDescription,
    "about_the_game": aboutTheGame,
    "short_description": shortDescription,
    "supported_languages": supportedLanguages,
    "header_image": headerImage,
    "capsule_image": capsuleImage,
    "capsule_imagev5": capsuleImagev5,
    "website": website,
    "pc_requirements": pcRequirements?.toJson(),
    "mac_requirements": macRequirements?.toJson(),
    "linux_requirements": linuxRequirements?.toJson(),
    "legal_notice": legalNotice,
    "drm_notice": drmNotice,
    "developers":
        developers == null ? [] : List<dynamic>.from(developers!.map((x) => x)),
    "publishers":
        publishers == null ? [] : List<dynamic>.from(publishers!.map((x) => x)),
    "demos":
        demos == null ? [] : List<dynamic>.from(demos!.map((x) => x.toJson())),
    "price_overview": priceOverview?.toJson(),
    "packages":
        packages == null ? [] : List<dynamic>.from(packages!.map((x) => x)),
    "package_groups":
        packageGroups == null
            ? []
            : List<dynamic>.from(packageGroups!.map((x) => x.toJson())),
    "platforms": platforms?.toJson(),
    "metacritic": metacritic?.toJson(),
    "categories":
        categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "genres":
        genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "screenshots":
        screenshots == null
            ? []
            : List<dynamic>.from(screenshots!.map((x) => x.toJson())),
    "recommendations": recommendations?.toJson(),
    "achievements": achievements?.toJson(),
    "release_date": releaseDate?.toJson(),
    "support_info": supportInfo?.toJson(),
    "background": background,
    "background_raw": backgroundRaw,
    "content_descriptors": contentDescriptors?.toJson(),
    "ratings": ratings?.toJson(),
  };
}

class Achievements {
  int? total;
  List<Highlighted>? highlighted;

  Achievements({this.total, this.highlighted});

  factory Achievements.fromJson(Map<String, dynamic> json) => Achievements(
    total: json["total"],
    highlighted:
        json["highlighted"] == null
            ? []
            : List<Highlighted>.from(
              json["highlighted"]!.map((x) => Highlighted.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "highlighted":
        highlighted == null
            ? []
            : List<dynamic>.from(highlighted!.map((x) => x.toJson())),
  };
}

class Highlighted {
  String? name;
  String? path;

  Highlighted({this.name, this.path});

  factory Highlighted.fromJson(Map<String, dynamic> json) =>
      Highlighted(name: json["name"], path: json["path"]);

  Map<String, dynamic> toJson() => {"name": name, "path": path};
}

class Category {
  int? id;
  String? description;

  Category({this.id, this.description});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], description: json["description"]);

  Map<String, dynamic> toJson() => {"id": id, "description": description};
}

class ContentDescriptors {
  List<int>? ids;
  String? notes;

  ContentDescriptors({this.ids, this.notes});

  factory ContentDescriptors.fromJson(
    Map<String, dynamic> json,
  ) => ContentDescriptors(
    ids: json["ids"] == null ? [] : List<int>.from(json["ids"]!.map((x) => x)),
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "ids": ids == null ? [] : List<dynamic>.from(ids!.map((x) => x)),
    "notes": notes,
  };
}

class Demo {
  int? appid;
  String? description;

  Demo({this.appid, this.description});

  factory Demo.fromJson(Map<String, dynamic> json) =>
      Demo(appid: json["appid"], description: json["description"]);

  Map<String, dynamic> toJson() => {"appid": appid, "description": description};
}

class Genre {
  String? id;
  String? description;

  Genre({this.id, this.description});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(id: json["id"], description: json["description"]);

  Map<String, dynamic> toJson() => {"id": id, "description": description};
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({this.minimum, this.recommended});

  factory Requirements.fromJson(Map<String, dynamic> json) =>
      Requirements(minimum: json["minimum"], recommended: json["recommended"]);

  Map<String, dynamic> toJson() => {
    "minimum": minimum,
    "recommended": recommended,
  };
}

class Metacritic {
  int? score;
  String? url;

  Metacritic({this.score, this.url});

  factory Metacritic.fromJson(Map<String, dynamic> json) =>
      Metacritic(score: json["score"], url: json["url"]);

  Map<String, dynamic> toJson() => {"score": score, "url": url};
}

class PackageGroup {
  String? name;
  String? title;
  String? description;
  String? selectionText;
  String? saveText;
  int? displayType;
  String? isRecurringSubscription;
  List<Sub>? subs;

  PackageGroup({
    this.name,
    this.title,
    this.description,
    this.selectionText,
    this.saveText,
    this.displayType,
    this.isRecurringSubscription,
    this.subs,
  });

  factory PackageGroup.fromJson(Map<String, dynamic> json) => PackageGroup(
    name: json["name"],
    title: json["title"],
    description: json["description"],
    selectionText: json["selection_text"],
    saveText: json["save_text"],
    displayType: json["display_type"],
    isRecurringSubscription: json["is_recurring_subscription"],
    subs:
        json["subs"] == null
            ? []
            : List<Sub>.from(json["subs"]!.map((x) => Sub.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "description": description,
    "selection_text": selectionText,
    "save_text": saveText,
    "display_type": displayType,
    "is_recurring_subscription": isRecurringSubscription,
    "subs":
        subs == null ? [] : List<dynamic>.from(subs!.map((x) => x.toJson())),
  };
}

class Sub {
  int? packageid;
  String? percentSavingsText;
  int? percentSavings;
  String? optionText;
  String? optionDescription;
  String? canGetFreeLicense;
  bool? isFreeLicense;
  int? priceInCentsWithDiscount;

  Sub({
    this.packageid,
    this.percentSavingsText,
    this.percentSavings,
    this.optionText,
    this.optionDescription,
    this.canGetFreeLicense,
    this.isFreeLicense,
    this.priceInCentsWithDiscount,
  });

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
    packageid: json["packageid"],
    percentSavingsText: json["percent_savings_text"],
    percentSavings: json["percent_savings"],
    optionText: json["option_text"],
    optionDescription: json["option_description"],
    canGetFreeLicense: json["can_get_free_license"],
    isFreeLicense: json["is_free_license"],
    priceInCentsWithDiscount: json["price_in_cents_with_discount"],
  );

  Map<String, dynamic> toJson() => {
    "packageid": packageid,
    "percent_savings_text": percentSavingsText,
    "percent_savings": percentSavings,
    "option_text": optionText,
    "option_description": optionDescription,
    "can_get_free_license": canGetFreeLicense,
    "is_free_license": isFreeLicense,
    "price_in_cents_with_discount": priceInCentsWithDiscount,
  };
}

class Platforms {
  bool? windows;
  bool? mac;
  bool? linux;

  Platforms({this.windows, this.mac, this.linux});

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
    windows: json["windows"],
    mac: json["mac"],
    linux: json["linux"],
  );

  Map<String, dynamic> toJson() => {
    "windows": windows,
    "mac": mac,
    "linux": linux,
  };
}

class PriceOverview {
  String? currency;
  int? initial;
  int? priceOverviewFinal;
  int? discountPercent;
  String? initialFormatted;
  String? finalFormatted;

  PriceOverview({
    this.currency,
    this.initial,
    this.priceOverviewFinal,
    this.discountPercent,
    this.initialFormatted,
    this.finalFormatted,
  });

  factory PriceOverview.fromJson(Map<String, dynamic> json) => PriceOverview(
    currency: json["currency"],
    initial: json["initial"],
    priceOverviewFinal: json["final"],
    discountPercent: json["discount_percent"],
    initialFormatted: json["initial_formatted"],
    finalFormatted: json["final_formatted"],
  );

  Map<String, dynamic> toJson() => {
    "currency": currency,
    "initial": initial,
    "final": priceOverviewFinal,
    "discount_percent": discountPercent,
    "initial_formatted": initialFormatted,
    "final_formatted": finalFormatted,
  };
}

class Ratings {
  Esrb? esrb;
  Cero? pegi;
  Cero? usk;
  Cero? oflc;
  Cero? cero;
  Cero? kgrb;
  Cero? dejus;
  Cero? csrr;
  Cero? crl;
  Cero? nzoflc;
  SteamGermany? steamGermany;

  Ratings({
    this.esrb,
    this.pegi,
    this.usk,
    this.oflc,
    this.cero,
    this.kgrb,
    this.dejus,
    this.csrr,
    this.crl,
    this.nzoflc,
    this.steamGermany,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
    esrb: json["esrb"] == null ? null : Esrb.fromJson(json["esrb"]),
    pegi: json["pegi"] == null ? null : Cero.fromJson(json["pegi"]),
    usk: json["usk"] == null ? null : Cero.fromJson(json["usk"]),
    oflc: json["oflc"] == null ? null : Cero.fromJson(json["oflc"]),
    cero: json["cero"] == null ? null : Cero.fromJson(json["cero"]),
    kgrb: json["kgrb"] == null ? null : Cero.fromJson(json["kgrb"]),
    dejus: json["dejus"] == null ? null : Cero.fromJson(json["dejus"]),
    csrr: json["csrr"] == null ? null : Cero.fromJson(json["csrr"]),
    crl: json["crl"] == null ? null : Cero.fromJson(json["crl"]),
    nzoflc: json["nzoflc"] == null ? null : Cero.fromJson(json["nzoflc"]),
    steamGermany:
        json["steam_germany"] == null
            ? null
            : SteamGermany.fromJson(json["steam_germany"]),
  );

  Map<String, dynamic> toJson() => {
    "esrb": esrb?.toJson(),
    "pegi": pegi?.toJson(),
    "usk": usk?.toJson(),
    "oflc": oflc?.toJson(),
    "cero": cero?.toJson(),
    "kgrb": kgrb?.toJson(),
    "dejus": dejus?.toJson(),
    "csrr": csrr?.toJson(),
    "crl": crl?.toJson(),
    "nzoflc": nzoflc?.toJson(),
    "steam_germany": steamGermany?.toJson(),
  };
}

class Cero {
  String? rating;
  String? descriptors;
  String? useAgeGate;
  String? requiredAge;

  Cero({this.rating, this.descriptors, this.useAgeGate, this.requiredAge});

  factory Cero.fromJson(Map<String, dynamic> json) => Cero(
    rating: json["rating"],
    descriptors: json["descriptors"],
    useAgeGate: json["use_age_gate"],
    requiredAge: json["required_age"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "descriptors": descriptors,
    "use_age_gate": useAgeGate,
    "required_age": requiredAge,
  };
}

class Esrb {
  String? useAgeGate;
  String? requiredAge;

  Esrb({this.useAgeGate, this.requiredAge});

  factory Esrb.fromJson(Map<String, dynamic> json) =>
      Esrb(useAgeGate: json["use_age_gate"], requiredAge: json["required_age"]);

  Map<String, dynamic> toJson() => {
    "use_age_gate": useAgeGate,
    "required_age": requiredAge,
  };
}

class SteamGermany {
  String? ratingGenerated;
  String? rating;
  String? requiredAge;
  String? banned;
  String? useAgeGate;
  String? descriptors;

  SteamGermany({
    this.ratingGenerated,
    this.rating,
    this.requiredAge,
    this.banned,
    this.useAgeGate,
    this.descriptors,
  });

  factory SteamGermany.fromJson(Map<String, dynamic> json) => SteamGermany(
    ratingGenerated: json["rating_generated"],
    rating: json["rating"],
    requiredAge: json["required_age"],
    banned: json["banned"],
    useAgeGate: json["use_age_gate"],
    descriptors: json["descriptors"],
  );

  Map<String, dynamic> toJson() => {
    "rating_generated": ratingGenerated,
    "rating": rating,
    "required_age": requiredAge,
    "banned": banned,
    "use_age_gate": useAgeGate,
    "descriptors": descriptors,
  };
}

class Recommendations {
  int? total;

  Recommendations({this.total});

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      Recommendations(total: json["total"]);

  Map<String, dynamic> toJson() => {"total": total};
}

class ReleaseDate {
  bool? comingSoon;
  String? date;

  ReleaseDate({this.comingSoon, this.date});

  factory ReleaseDate.fromJson(Map<String, dynamic> json) =>
      ReleaseDate(comingSoon: json["coming_soon"], date: json["date"]);

  Map<String, dynamic> toJson() => {"coming_soon": comingSoon, "date": date};
}

class Screenshot {
  int? id;
  String? pathThumbnail;
  String? pathFull;

  Screenshot({this.id, this.pathThumbnail, this.pathFull});

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
    id: json["id"],
    pathThumbnail: json["path_thumbnail"],
    pathFull: json["path_full"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path_thumbnail": pathThumbnail,
    "path_full": pathFull,
  };
}

class SupportInfo {
  String? url;
  String? email;

  SupportInfo({this.url, this.email});

  factory SupportInfo.fromJson(Map<String, dynamic> json) =>
      SupportInfo(url: json["url"], email: json["email"]);

  Map<String, dynamic> toJson() => {"url": url, "email": email};
}
