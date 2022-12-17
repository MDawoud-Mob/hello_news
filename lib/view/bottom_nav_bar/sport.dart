// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_news/controller/new_conttroller.dart';
import 'package:hello_news/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class Sport extends GetWidget {
  // ignore: annotate_overrides
  NewsController controller = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 218, 231, 144),
        body: FutureBuilder<List<Article>>(
            future: controller.getGeneral('sport'),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(snapshot.data![index].url));
                              },
                              child: Container(
                                height: 215,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data![index].urlToImage,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(snapshot.data![index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)))
                          ]));
                    });
              }
            }));
  }
}
