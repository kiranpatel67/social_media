class PhotosDataModel {
  String id;
  String title;
  String description;
  String imageurl;
  List<dynamic> likedby;
  int likecount;

  PhotosDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageurl,
    required this.likedby,
    required this.likecount,
  });

  getPhotoMap(){
    return {
      "id": id,
      "title": title,
      "description": description,
      "imageurl": imageurl,
      "likedby": List<dynamic>.from(likedby.map((x) => x)),
      "likecount": likecount,
    };
  }

}
