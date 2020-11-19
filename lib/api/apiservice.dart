import 'package:country/model/country.dart';
import 'package:country/model/detail_ct.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: 'https://restcountries.eu/rest/v2/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  @GET('all')
  Future<List<Country>> getCountries({@DioOptions() Options options});

  @GET('name/{name}?fullText=true')
  Future<List<Detail>> getDetail(@Path() String name,
      {@DioOptions() Options options});
}
