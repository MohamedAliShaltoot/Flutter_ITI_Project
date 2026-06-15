class MyEventModel {
  final String id;
  final String name;
  final String imageUrl;
  final String date;
  final String time;
  final String venueName;
  final String city;
  final String eventUrl;
  final String status;

  const MyEventModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.venueName,
    required this.city,
    required this.eventUrl,
    required this.status,
  });

  factory MyEventModel.fromJson(Map<String, dynamic> json) {
    final images = (json['images'] as List?) ?? [];
    final image = images.firstWhere(
          (img) => img['ratio'] == '16_9' && img['width'] > 500,
      orElse: () => images.isNotEmpty ? images.first : {'url': ''},
    );

    final venues = (json['_embedded']?['venues'] as List?) ?? [];
    final venue = venues.isNotEmpty ? venues.first : {};

    return MyEventModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: image['url'] ?? '',
      date: json['dates']?['start']?['localDate'] ?? '',
      time: json['dates']?['start']?['localTime'] ?? '',
      venueName: venue['name'] ?? '',
      city: venue['city']?['name'] ?? '',
      eventUrl: json['url'] ?? '',
      status: json['dates']?['status']?['code'] ?? 'onsale',
    );
  }
}