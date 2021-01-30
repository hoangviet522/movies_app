import 'package:mygarment/data/models/video_model.dart';

class VideosResultModel {
  List<VideoModel> videos;

  VideosResultModel({this.videos});

  VideosResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      videos = new List<VideoModel>();
      json['results'].forEach((v) {
        videos.add(new VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.videos != null) {
      data['results'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
