// To parse this JSON data, do
//
//     final placeResultModel = placeResultModelFromJson(jsonString);

import 'dart:convert';

PlaceResultModel placeResultModelFromJson(String str) =>
    PlaceResultModel.fromJson(json.decode(str));

String placeResultModelToJson(PlaceResultModel data) =>
    json.encode(data.toJson());

class PlaceResultModel {
  SearchMetadata? searchMetadata;
  SearchParameters? searchParameters;
  SearchInformation? searchInformation;
  PlaceResults? placeResults;

  PlaceResultModel({
    this.searchMetadata,
    this.searchParameters,
    this.searchInformation,
    this.placeResults,
  });

  factory PlaceResultModel.fromJson(Map<String, dynamic> json) =>
      PlaceResultModel(
        searchMetadata: json["search_metadata"] == null
            ? null
            : SearchMetadata.fromJson(json["search_metadata"]),
        searchParameters: json["search_parameters"] == null
            ? null
            : SearchParameters.fromJson(json["search_parameters"]),
        searchInformation: json["search_information"] == null
            ? null
            : SearchInformation.fromJson(json["search_information"]),
        placeResults: json["place_results"] == null
            ? null
            : PlaceResults.fromJson(json["place_results"]),
      );

  Map<String, dynamic> toJson() => {
        "search_metadata": searchMetadata?.toJson(),
        "search_parameters": searchParameters?.toJson(),
        "search_information": searchInformation?.toJson(),
        "place_results": placeResults?.toJson(),
      };
}

class PlaceResults {
  String? title;
  String? placeId;
  String? dataId;
  String? dataCid;
  String? reviewsLink;
  String? photosLink;
  GpsCoordinates? gpsCoordinates;
  String? placeIdSearch;
  String? providerId;
  String? thumbnail;
  Description? description;
  String? address;
  Weather? weather;
  String? website;
  List<AtThisLocation>? atThisLocation;

  PlaceResults({
    this.title,
    this.placeId,
    this.dataId,
    this.dataCid,
    this.reviewsLink,
    this.photosLink,
    this.gpsCoordinates,
    this.placeIdSearch,
    this.providerId,
    this.thumbnail,
    this.description,
    this.address,
    this.weather,
    this.website,
    this.atThisLocation,
  });

  factory PlaceResults.fromJson(Map<String, dynamic> json) => PlaceResults(
        title: json["title"],
        placeId: json["place_id"],
        dataId: json["data_id"],
        dataCid: json["data_cid"],
        reviewsLink: json["reviews_link"],
        photosLink: json["photos_link"],
        gpsCoordinates: json["gps_coordinates"] == null
            ? null
            : GpsCoordinates.fromJson(json["gps_coordinates"]),
        placeIdSearch: json["place_id_search"],
        providerId: json["provider_id"],
        thumbnail: json["thumbnail"],
        description: json["description"] == null
            ? null
            : Description.fromJson(json["description"]),
        address: json["address"],
        weather:
            json["weather"] == null ? null : Weather.fromJson(json["weather"]),
        website: json["website"],
        atThisLocation: json["at_this_location"] == null
            ? []
            : List<AtThisLocation>.from(json["at_this_location"]!
                .map((x) => AtThisLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "place_id": placeId,
        "data_id": dataId,
        "data_cid": dataCid,
        "reviews_link": reviewsLink,
        "photos_link": photosLink,
        "gps_coordinates": gpsCoordinates?.toJson(),
        "place_id_search": placeIdSearch,
        "provider_id": providerId,
        "thumbnail": thumbnail,
        "description": description?.toJson(),
        "address": address,
        "weather": weather?.toJson(),
        "website": website,
        "at_this_location": atThisLocation == null
            ? []
            : List<dynamic>.from(atThisLocation!.map((x) => x.toJson())),
      };
}

class AtThisLocation {
  int? position;
  String? title;
  String? dataId;
  String? dataCid;
  String? reviewsLink;
  String? photosLink;
  GpsCoordinates? gpsCoordinates;
  String? placeIdSearch;
  double? rating;
  String? type;
  String? price;
  String? thumbnail;

  AtThisLocation({
    this.position,
    this.title,
    this.dataId,
    this.dataCid,
    this.reviewsLink,
    this.photosLink,
    this.gpsCoordinates,
    this.placeIdSearch,
    this.rating,
    this.type,
    this.price,
    this.thumbnail,
  });

  factory AtThisLocation.fromJson(Map<String, dynamic> json) => AtThisLocation(
        position: json["position"],
        title: json["title"],
        dataId: json["data_id"],
        dataCid: json["data_cid"],
        reviewsLink: json["reviews_link"],
        photosLink: json["photos_link"],
        gpsCoordinates: json["gps_coordinates"] == null
            ? null
            : GpsCoordinates.fromJson(json["gps_coordinates"]),
        placeIdSearch: json["place_id_search"],
        rating: json["rating"]?.toDouble(),
        type: json["type"],
        price: json["price"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "title": title,
        "data_id": dataId,
        "data_cid": dataCid,
        "reviews_link": reviewsLink,
        "photos_link": photosLink,
        "gps_coordinates": gpsCoordinates?.toJson(),
        "place_id_search": placeIdSearch,
        "rating": rating,
        "type": type,
        "price": price,
        "thumbnail": thumbnail,
      };
}

class GpsCoordinates {
  double? latitude;
  double? longitude;

  GpsCoordinates({
    this.latitude,
    this.longitude,
  });

  factory GpsCoordinates.fromJson(Map<String, dynamic> json) => GpsCoordinates(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Description {
  String? snippet;

  Description({
    this.snippet,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        snippet: json["snippet"],
      );

  Map<String, dynamic> toJson() => {
        "snippet": snippet,
      };
}

class Weather {
  String? celsius;
  String? fahrenheit;
  String? conditions;

  Weather({
    this.celsius,
    this.fahrenheit,
    this.conditions,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        celsius: json["celsius"],
        fahrenheit: json["fahrenheit"],
        conditions: json["conditions"],
      );

  Map<String, dynamic> toJson() => {
        "celsius": celsius,
        "fahrenheit": fahrenheit,
        "conditions": conditions,
      };
}

class SearchInformation {
  String? localResultsState;
  String? queryDisplayed;

  SearchInformation({
    this.localResultsState,
    this.queryDisplayed,
  });

  factory SearchInformation.fromJson(Map<String, dynamic> json) =>
      SearchInformation(
        localResultsState: json["local_results_state"],
        queryDisplayed: json["query_displayed"],
      );

  Map<String, dynamic> toJson() => {
        "local_results_state": localResultsState,
        "query_displayed": queryDisplayed,
      };
}

class SearchMetadata {
  String? id;
  String? status;
  String? jsonEndpoint;
  String? createdAt;
  String? processedAt;
  String? googleMapsUrl;
  String? rawHtmlFile;
  double? totalTimeTaken;

  SearchMetadata({
    this.id,
    this.status,
    this.jsonEndpoint,
    this.createdAt,
    this.processedAt,
    this.googleMapsUrl,
    this.rawHtmlFile,
    this.totalTimeTaken,
  });

  factory SearchMetadata.fromJson(Map<String, dynamic> json) => SearchMetadata(
        id: json["id"],
        status: json["status"],
        jsonEndpoint: json["json_endpoint"],
        createdAt: json["created_at"],
        processedAt: json["processed_at"],
        googleMapsUrl: json["google_maps_url"],
        rawHtmlFile: json["raw_html_file"],
        totalTimeTaken: json["total_time_taken"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "json_endpoint": jsonEndpoint,
        "created_at": createdAt,
        "processed_at": processedAt,
        "google_maps_url": googleMapsUrl,
        "raw_html_file": rawHtmlFile,
        "total_time_taken": totalTimeTaken,
      };
}

class SearchParameters {
  String? engine;
  String? type;
  String? q;
  String? googleDomain;
  String? hl;

  SearchParameters({
    this.engine,
    this.type,
    this.q,
    this.googleDomain,
    this.hl,
  });

  factory SearchParameters.fromJson(Map<String, dynamic> json) =>
      SearchParameters(
        engine: json["engine"],
        type: json["type"],
        q: json["q"],
        googleDomain: json["google_domain"],
        hl: json["hl"],
      );

  Map<String, dynamic> toJson() => {
        "engine": engine,
        "type": type,
        "q": q,
        "google_domain": googleDomain,
        "hl": hl,
      };
}
