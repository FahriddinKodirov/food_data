class Next {
  String title;
  String href;

  Next({
      required this.title,
      required this.href
      });

  factory Next.fromJson(Map<String, dynamic> jsonData) {
    return Next(
        title: jsonData['title'] as String? ?? '',
        href: jsonData['href'] as String? ?? ''
        );
  }
}
