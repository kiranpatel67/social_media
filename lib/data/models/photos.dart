class PhotosDataModel {
  String id;
  String uid;
  String title;
  String description;
  List<String> imageurl;
  List<dynamic> likedby;
  int likecount;

  PhotosDataModel({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.likedby,
    required this.likecount,
  });

  getPhotoMap(){
    return {
      "id": id,
      "uid": uid,
      "title": title,
      "description": description,
      "imageurl": List<String>.from(imageurl.map((e) => e)) ,
      "likedby": List<dynamic>.from(likedby.map((x) => x)),
      "likecount": likecount,
    };
  }

}
