// To parse this JSON data, do
//
//     final autoCompletionModel = autoCompletionModelFromJson(jsonString);

import 'dart:convert';

AutoCompletionModel autoCompletionModelFromJson(String str) =>
    AutoCompletionModel.fromJson(json.decode(str));

String autoCompletionModelToJson(AutoCompletionModel data) =>
    json.encode(data.toJson());

class AutoCompletionModel {
  List<Result>? results;
  Query? query;

  AutoCompletionModel({
    this.results,
    this.query,
  });

  factory AutoCompletionModel.fromJson(Map<String, dynamic> json) =>
      AutoCompletionModel(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "query": query?.toJson(),
      };
}

class Query {
  String? text;
  Parsed? parsed;

  Query({
    this.text,
    this.parsed,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        text: json["text"],
        parsed: json["parsed"] == null ? null : Parsed.fromJson(json["parsed"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "parsed": parsed?.toJson(),
      };
}

class Parsed {
  String? housenumber;
  String? street;
  String? city;
  String? expectedType;

  Parsed({
    this.housenumber,
    this.street,
    this.city,
    this.expectedType,
  });

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
        housenumber: json["housenumber"],
        street: json["street"],
        city: json["city"],
        expectedType: json["expected_type"],
      );

  Map<String, dynamic> toJson() => {
        "housenumber": housenumber,
        "street": street,
        "city": city,
        "expected_type": expectedType,
      };
}

class Result {
  Datasource? datasource;
  String? name;
  String? country;
  String? countryCode;
  String? state;
  String? city;
  String? village;
  String? postcode;
  String? district;
  String? suburb;
  String? street;
  String? housenumber;
  double? lon;
  double? lat;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  Timezone? timezone;
  String? plusCode;
  String? plusCodeShort;
  String? resultType;
  Rank? rank;
  String? placeId;
  Bbox? bbox;

  Result({
    this.datasource,
    this.name,
    this.country,
    this.countryCode,
    this.state,
    this.city,
    this.village,
    this.postcode,
    this.district,
    this.suburb,
    this.street,
    this.housenumber,
    this.lon,
    this.lat,
    this.formatted,
    this.addressLine1,
    this.addressLine2,
    this.timezone,
    this.plusCode,
    this.plusCodeShort,
    this.resultType,
    this.rank,
    this.placeId,
    this.bbox,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        datasource: json["datasource"] == null
            ? null
            : Datasource.fromJson(json["datasource"]),
        name: json["name"],
        country: json["country"],
        countryCode: json["country_code"],
        state: json["state"],
        city: json["city"],
        village: json["village"],
        postcode: json["postcode"],
        district: json["district"],
        suburb: json["suburb"],
        street: json["street"],
        housenumber: json["housenumber"],
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
        plusCode: json["plus_code"],
        plusCodeShort: json["plus_code_short"],
        resultType: json["result_type"],
        rank: json["rank"] == null ? null : Rank.fromJson(json["rank"]),
        placeId: json["place_id"],
        bbox: json["bbox"] == null ? null : Bbox.fromJson(json["bbox"]),
      );

  Map<String, dynamic> toJson() => {
        "datasource": datasource?.toJson(),
        "name": name,
        "country": country,
        "country_code": countryCode,
        "state": state,
        "city": city,
        "village": village,
        "postcode": postcode,
        "district": district,
        "suburb": suburb,
        "street": street,
        "housenumber": housenumber,
        "lon": lon,
        "lat": lat,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "timezone": timezone?.toJson(),
        "plus_code": plusCode,
        "plus_code_short": plusCodeShort,
        "result_type": resultType,
        "rank": rank?.toJson(),
        "place_id": placeId,
        "bbox": bbox?.toJson(),
      };
}

class Bbox {
  double? lon1;
  double? lat1;
  double? lon2;
  double? lat2;

  Bbox({
    this.lon1,
    this.lat1,
    this.lon2,
    this.lat2,
  });

  factory Bbox.fromJson(Map<String, dynamic> json) => Bbox(
        lon1: json["lon1"]?.toDouble(),
        lat1: json["lat1"]?.toDouble(),
        lon2: json["lon2"]?.toDouble(),
        lat2: json["lat2"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon1": lon1,
        "lat1": lat1,
        "lon2": lon2,
        "lat2": lat2,
      };
}

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;

  Datasource({
    this.sourcename,
    this.attribution,
    this.license,
    this.url,
  });

  factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: json["sourcename"],
        attribution: json["attribution"],
        license: json["license"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sourcename": sourcename,
        "attribution": attribution,
        "license": license,
        "url": url,
      };
}

class Rank {
  double? importance;
  int? confidence;
  int? confidenceCityLevel;
  int? confidenceStreetLevel;
  String? matchType;

  Rank({
    this.importance,
    this.confidence,
    this.confidenceCityLevel,
    this.confidenceStreetLevel,
    this.matchType,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
        importance: json["importance"]?.toDouble(),
        confidence: json["confidence"],
        confidenceCityLevel: json["confidence_city_level"],
        confidenceStreetLevel: json["confidence_street_level"],
        matchType: json["match_type"],
      );

  Map<String, dynamic> toJson() => {
        "importance": importance,
        "confidence": confidence,
        "confidence_city_level": confidenceCityLevel,
        "confidence_street_level": confidenceStreetLevel,
        "match_type": matchType,
      };
}

class Timezone {
  String? name;
  String? offsetStd;
  int? offsetStdSeconds;
  String? offsetDst;
  int? offsetDstSeconds;
  String? abbreviationStd;
  String? abbreviationDst;

  Timezone({
    this.name,
    this.offsetStd,
    this.offsetStdSeconds,
    this.offsetDst,
    this.offsetDstSeconds,
    this.abbreviationStd,
    this.abbreviationDst,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        name: json["name"],
        offsetStd: json["offset_STD"],
        offsetStdSeconds: json["offset_STD_seconds"],
        offsetDst: json["offset_DST"],
        offsetDstSeconds: json["offset_DST_seconds"],
        abbreviationStd: json["abbreviation_STD"],
        abbreviationDst: json["abbreviation_DST"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "offset_STD": offsetStd,
        "offset_STD_seconds": offsetStdSeconds,
        "offset_DST": offsetDst,
        "offset_DST_seconds": offsetDstSeconds,
        "abbreviation_STD": abbreviationStd,
        "abbreviation_DST": abbreviationDst,
      };
}
