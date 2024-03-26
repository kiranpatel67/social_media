import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class Nextpage extends StatefulWidget {
  const Nextpage({super.key});

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getImages(), builder: (context, imageList) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:4),
          itemCount: imageList.data != null ? imageList.data!.length : 0,
          itemBuilder: (context,index){
        if (imageList.data != null){
          return AssetEntityImage(imageList.data![index]);
          // return Text("${imageList.data!.elementAt(index)}");
        }
        else{
          return Container();
        }
          });

    });
  }


  Future<List<AssetEntity>> getImages() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend(); // the method can use optional param `permission`.

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(type: RequestType.image);
    if (paths.isNotEmpty){
      return paths.first.getAssetListRange(start: 0, end: 100000000);
    }
   return [];

  }
}

