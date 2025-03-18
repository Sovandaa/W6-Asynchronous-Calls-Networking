class PostDto {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostDto(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  // convert json to PostDto
  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      userId: json['userId'], 
      id: json['id'], 
      title: json['title'], 
      body: json['body']
    );
  }
}
