class TiktokVideo {
  TiktokVideo({
    required this.avatarUrl,
    required this.userName,
    required this.videoTitle,
    required this.likes,
    required this.coverUrl,
    required this.views,
  });

  String avatarUrl;
  String coverUrl;
  String videoTitle;
  String userName;
  int likes;
  int views;

  factory TiktokVideo.fromJson(Map<String, dynamic> json) => TiktokVideo(
        avatarUrl: json['author']['avatar'],
        coverUrl: json['cover'],
        userName: json['author']["username"],
        videoTitle: json['description'],
        likes: json['stats']['likes'],
        views: json['stats']['views'],
      );
}
