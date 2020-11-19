import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/api/apiservice.dart';
import 'package:country/model/detail_ct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DetailScreen extends StatelessWidget {
  final ApiService apiService = Get.find();
  final String countryName;
  DetailScreen(this.countryName);
  @override
  Widget build(BuildContext context) {
    Options options = Get.find();
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: FutureBuilder<List<Detail>>(
          future: apiService.getDetail(countryName, options: options),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Detail detail = snapshot.data[0];
              return ListView(
                children: [
                  Center(
                      child: Text(
                    '${detail.name}',
                    style: TextStyle(fontSize: 25),
                  )),
                  Text(
                    'region : ${detail.region}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'subregion : ${detail.subregion}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'population : ${detail.population}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Demoyn : ${detail.demonym}',
                    style: TextStyle(fontSize: 20),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        'https://www.countryflags.io/${detail.alpha2Code}/flat/64.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.fill,
                    placeholder: (_, __) => CircularProgressIndicator(),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
