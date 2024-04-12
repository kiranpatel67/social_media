class PhotosDataModel {
  String id;
  String uid;
  String title;
  String description;
  List<dynamic> imageurl;
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
      "likedby": List<String>.from(likedby.map((x) => x)),
      "likecount": likecount,
    };
  }


  factory PhotosDataModel.fromJson( Map<String, dynamic> data){
    return PhotosDataModel(
        id: data['id'],
        uid: data['uid'],
        title: data['title'],
        description: data['description'],
        imageurl: data['imageurl'] ?? [],
        likedby: data['likedby'] ?? [],
        likecount: data['likecount']);

  }

}
