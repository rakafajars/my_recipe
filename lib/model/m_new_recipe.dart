import 'dart:convert';

ModelNewRecipe modelNewRecipeFromJson(String str) =>
    ModelNewRecipe.fromJson(json.decode(str));

String modelNewRecipeToJson(ModelNewRecipe data) => json.encode(data.toJson());

class ModelNewRecipe {
  ModelNewRecipe({
    this.method,
    this.status,
    this.results,
  });

  String method;
  bool status;
  List<ResultRecipe> results;

  factory ModelNewRecipe.fromJson(Map<String, dynamic> json) => ModelNewRecipe(
        method: json["method"],
        status: json["status"],
        results: List<ResultRecipe>.from(
          json["results"].map(
            (x) => ResultRecipe.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ResultRecipe {
  ResultRecipe({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.portion,
    this.dificulty,
  });

  String title;
  String thumb;
  String key;
  String times;
  String portion;
  String dificulty;

  factory ResultRecipe.fromJson(Map<String, dynamic> json) => ResultRecipe(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        portion: json["portion"],
        dificulty: json["dificulty"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "key": key,
        "times": times,
        "portion": portion,
        "dificulty": dificulty,
      };
}
