import 'package:cloud_firestore/cloud_firestore.dart';

class New {
  final String date, title, description, image, section;
  final Timestamp
      timestamp; //We are going to order the news in the feed by this.
  final bool thereIsNoImage;
  final bool isAGalleryImage;
  final bool isANetworkImage;

  New(
      {this.title,
      this.date,
      this.description,
      this.image,
      this.section,
      this.timestamp,
      this.isAGalleryImage,
      this.thereIsNoImage,
      this.isANetworkImage});
}
