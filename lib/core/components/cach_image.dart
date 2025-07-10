
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'circle_progress_indicator.dart';


class cach_image extends StatelessWidget {
  const cach_image({
    super.key, required this.url,
  });
  final String url ;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(child: SizedBox(child: circle_progress()),),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}