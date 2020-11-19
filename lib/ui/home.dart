import 'package:cached_network_image/cached_network_image.dart';
import 'package:country/api/apiservice.dart';
import 'package:country/model/country.dart';
import 'package:country/ui/detail.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class Home extends StatelessWidget {
  final ApiService apiService = Get.find();
  @override
  Widget build(BuildContext context) {
    Options options = buildCacheOptions(Duration(days: 10), forceRefresh: true);
    Get.put(options);
    return Scaffold(
      appBar: AppBar(title: Text('Countries List')),
      body: FutureBuilder<List<Country>>(
          future: apiService.getCountries(options: options),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Country> country = snapshot.data;
              return ListView.builder(
                  itemCount: country.length,
                  itemBuilder: (context, position) {
                    return item(country[position], context);
                  });
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

  Widget item(Country country, BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(DetailScreen(country.name));
        },
        leading: CachedNetworkImage(
          imageUrl:
              'https://www.countryflags.io/${country.alpha2Code}/flat/64.png',
          width: 100,
          height: 100,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          //placeholder: (_, __) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Text(
          country.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          country.region,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
