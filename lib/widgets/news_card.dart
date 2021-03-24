import 'package:flutter/material.dart';

Widget buildNewsCard({String imgUrl, String title, String excerpt}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Text(
                  excerpt,
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
