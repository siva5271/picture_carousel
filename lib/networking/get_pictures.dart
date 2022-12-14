import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/picture_carousel_screen.dart';

Future<void> GetPictures(BuildContext context) async {
  List<String> imagesUrl = [];
  const url =
      'https://api.unsplash.com/photos/?client_id=fphre5IEtqwRyw2SjVGAqShdZSr6Z6mn4laTq-NKbfM';
  try {
    final response = await http.get(Uri.parse(url));
    final imagesAPI = await jsonDecode(response.body).toList();
    List<String> result = [];
    imagesAPI.forEach((element) {
      imagesUrl.add(element["urls"]["small"]);
    });
    if (imagesUrl.isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => pictureCarouselScreen(
                    imagesUrl: imagesUrl,
                  ))));
    }
  } catch (e) {
    print(e);
  }
}
