import 'package:customize/customize.dart';
import 'package:flutter/material.dart';

Widget buildNewsCard({String imgUrl, String title, String excerpt}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: FxMargin.m12,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            height: 200,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Container(
            padding: FxPadding.p12,
            child: Column(
              children: [
                Text(title)
                    .color(Colors.black)
                    .xl
                    .extraBold
                    .maxLine(2)
                    .ellipsis,
                SizedBox(height: 8),
                Text(excerpt).color(Colors.black54).maxLine(2).ellipsis,
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
