import 'dart:convert';

McareTermsPrivacy mcareTermsPrivacyFromJson(String str) => McareTermsPrivacy.fromJson(json.decode(str));

String mcareTermsPrivacyToJson(McareTermsPrivacy data) => json.encode(data.toJson());

class McareTermsPrivacy {
  McareTermsPrivacy({
    this.terms,
    this.permissions,
  });

  Terms terms;
  Permissions permissions;

  factory McareTermsPrivacy.fromJson(Map<String, dynamic> json) => McareTermsPrivacy(
    terms: Terms.fromJson(json["terms"]),
    permissions: Permissions.fromJson(json["permissions"]),
  );

  Map<String, dynamic> toJson() => {
    "terms": terms.toJson(),
    "permissions": permissions.toJson(),
  };
}

class Permissions {
  Permissions({
    this.intro,
    this.items,
    this.termination,
  });

  String intro;
  List<Item> items;
  String termination;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    intro: json["intro"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    termination: json["termination"],
  );

  Map<String, dynamic> toJson() => {
    "intro": intro,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "termination": termination,
  };
}

class Item {
  Item({
    this.title,
    this.content,
    this.icon,
  });

  String title;
  String content;
  String icon;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    title: json["title"],
    content: json["content"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "icon": icon,
  };
}

class Terms {
  Terms({
    this.content,
  });

  List<Content> content;

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class Content {
  Content({
    this.type,
    this.content,
  });

  Type type;
  String content;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    type: typeValues.map[json["type"]],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "type": typeValues.reverse[type],
    "content": content,
  };
}

enum Type { HEADING, PARAGRAPH }

final typeValues = EnumValues({
  "heading": Type.HEADING,
  "paragraph": Type.PARAGRAPH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
