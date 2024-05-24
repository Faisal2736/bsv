class Content {
  final String image;
  final String heading;
  final String text1;
  final String text2;
  String? text3;
  String? text4;

  Content({
    required this.image,
    required this.heading,
    required this.text1,
    required this.text2,
    this.text3,
    this.text4,
  });
}
