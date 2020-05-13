import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class News extends Equatable {
  final String slugName;
  final String section;
  final String title;
  final String shortDescription;
  final String url;
  final String byline;
  final String thumbnailStandard;

  News(this.slugName, this.section, this.title, this.shortDescription, this.url,
      this.byline, this.thumbnailStandard);

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['slug_name'] ?? UniqueKey().toString(),
      json['section'] ?? "none",
      json['title'] ?? "Untitled",
      json['abstract'] ?? "Untitled",
      json['url'] ?? "https://www.nytimes.com/",
      json['byline'] ?? "Untitled",
      json['thumbnail_standard'] ?? 'http://via.placeholder.com/75x75',
    );
  }

  @override
  List<Object> get props => [slugName];
}
