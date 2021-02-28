class User {
  String userPhoto;
  String username;
  bool isFollowed;
  int tolds;
  int retolds;
  int followers;
  int following;
  String bio;

  User(
      {this.userPhoto,
      this.username,
      this.isFollowed,
      this.tolds,
      this.retolds,
      this.followers,
      this.following,
      this.bio});
}

class Message {
  User user;
  String time;
  String msg;

  Message({this.msg, this.time, this.user});
}

class ImageMessage {
  User user;
  String url;
  String time;

  ImageMessage({this.time, this.url, this.user});
}

class PostMessage {
  User user;
  var post;
  String time;

  PostMessage({this.post, this.time, this.user});
}

class DM {
  User user;
  List<dynamic> messages;
  bool unread;

  DM({this.messages, this.user, this.unread});
}

class Comment {
  User user;
  String comment;
  int likes;
  bool isLiked;

  Comment({this.user, this.comment, this.likes, this.isLiked = false});
}

class PhotoPost {
  User user;
  String photoUrl;
  String time;
  String descrip;
  String location;
  int likes;
  int retolds;
  List<Comment> commentList;
  bool isLiked;

  PhotoPost(
      {this.user,
      this.photoUrl,
      this.time,
      this.descrip,
      this.location,
      this.likes,
      this.retolds,
      this.commentList,
      this.isLiked = false});
}

class VideoPost {
  User user;
  String videoUrl;
  String time;
  String descrip;
  String location;
  int likes;
  int retolds;
  List<Comment> commentList;
  bool isLiked;

  VideoPost(
      {this.user,
      this.videoUrl,
      this.time,
      this.descrip,
      this.location,
      this.likes,
      this.retolds,
      this.commentList,
      this.isLiked = false});
}

class ArticlePost {
  User user;
  String time;
  String title;
  String explanation;
  String article;
  int likes;
  int retolds;
  List<Comment> commentList;
  bool isLiked;

  ArticlePost(
      {this.user,
      this.time,
      this.title,
      this.explanation,
      this.article,
      this.likes,
      this.retolds,
      this.commentList,
      this.isLiked = false});
}

class Trend {
  String header;
  List posts;
  int postnumber;

  Trend({this.header, this.postnumber, this.posts});
}

class Retold {
  User user;
  String time;
  var post;

  Retold({this.user, this.post, this.time});
}

class LocationPost {
  var post;
  String id;
  double latitude;
  double longitude;

  LocationPost({this.post, this.id, this.latitude, this.longitude});
}
