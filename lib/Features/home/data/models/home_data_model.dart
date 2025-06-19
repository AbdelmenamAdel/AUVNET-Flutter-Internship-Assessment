class HomeDataModel {
  final String image;
  final String title;
  final String subTitle;
  HomeDataModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });

  HomeDataModel copyWith({String? image, String? title, String? subTitle}) {
    return HomeDataModel(
      image: image ?? this.image,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'subTitle': subTitle,
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
      image: map['image'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
    );
  }
}
