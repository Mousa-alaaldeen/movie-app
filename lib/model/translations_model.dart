class TranslationsModel {
  int? _id;
  List<Translations>? _translations;

  TranslationsModel({int? id, List<Translations>? translations}) {
    if (id != null) {
      this._id = id;
    }
    if (translations != null) {
      this._translations = translations;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  List<Translations>? get translations => _translations;
  set translations(List<Translations>? translations) =>
      _translations = translations;

  TranslationsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['translations'] != null) {
      _translations = <Translations>[];
      json['translations'].forEach((v) {
        _translations!.add(new Translations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._translations != null) {
      data['translations'] =
          this._translations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  String? _iso31661;
  String? _iso6391;
  String? _name;
  String? _englishName;
  Data? _data;

  Translations(
      {String? iso31661,
      String? iso6391,
      String? name,
      String? englishName,
      Data? data}) {
    if (iso31661 != null) {
      this._iso31661 = iso31661;
    }
    if (iso6391 != null) {
      this._iso6391 = iso6391;
    }
    if (name != null) {
      this._name = name;
    }
    if (englishName != null) {
      this._englishName = englishName;
    }
    if (data != null) {
      this._data = data;
    }
  }

  String? get iso31661 => _iso31661;
  set iso31661(String? iso31661) => _iso31661 = iso31661;
  String? get iso6391 => _iso6391;
  set iso6391(String? iso6391) => _iso6391 = iso6391;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get englishName => _englishName;
  set englishName(String? englishName) => _englishName = englishName;
  Data? get data => _data;
  set data(Data? data) => _data = data;

  Translations.fromJson(Map<String, dynamic> json) {
    _iso31661 = json['iso_3166_1'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
    _englishName = json['english_name'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_3166_1'] = this._iso31661;
    data['iso_639_1'] = this._iso6391;
    data['name'] = this._name;
    data['english_name'] = this._englishName;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    return data;
  }
}

class Data {
  String? _homepage;
  String? _overview;
  int? _runtime;
  String? _tagline;
  String? _title;

  Data(
      {String? homepage,
      String? overview,
      int? runtime,
      String? tagline,
      String? title}) {
    if (homepage != null) {
      this._homepage = homepage;
    }
    if (overview != null) {
      this._overview = overview;
    }
    if (runtime != null) {
      this._runtime = runtime;
    }
    if (tagline != null) {
      this._tagline = tagline;
    }
    if (title != null) {
      this._title = title;
    }
  }

  String? get homepage => _homepage;
  set homepage(String? homepage) => _homepage = homepage;
  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;
  int? get runtime => _runtime;
  set runtime(int? runtime) => _runtime = runtime;
  String? get tagline => _tagline;
  set tagline(String? tagline) => _tagline = tagline;
  String? get title => _title;
  set title(String? title) => _title = title;

  Data.fromJson(Map<String, dynamic> json) {
    _homepage = json['homepage'];
    _overview = json['overview'];
    _runtime = json['runtime'];
    _tagline = json['tagline'];
    _title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homepage'] = this._homepage;
    data['overview'] = this._overview;
    data['runtime'] = this._runtime;
    data['tagline'] = this._tagline;
    data['title'] = this._title;
    return data;
  }
}
