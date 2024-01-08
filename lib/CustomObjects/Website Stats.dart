import 'package:cloud_firestore/cloud_firestore.dart';

class WebsiteStats{

  bool isLive;
  String status;

  WebsiteStats({
    required this.isLive,
    required this.status
});

  factory WebsiteStats.fromFireStore(
      DocumentSnapshot<Map<String,dynamic>> snapshot,
      SnapshotOptions? options
      ){
    final data = snapshot.data();
    return WebsiteStats(isLive: data?['isLive'],
    status: data?['status']);
  }

  Map<String,dynamic> toFireStore(){
    return{
      "isLive":isLive,
      "status":status
    };
  }
}