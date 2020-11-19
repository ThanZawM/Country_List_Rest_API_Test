// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiservice.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://restcountries.eu/rest/v2/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Country>> getCountries({options}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(<String, dynamic>{});
    final _result = await _dio.request<List<dynamic>>('all',
        queryParameters: queryParameters,
        options: newOptions.merge(method: 'GET', baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Country.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Detail>> getDetail(name, {options}) async {
    ArgumentError.checkNotNull(name, 'name');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final newOptions = newRequestOptions(options);
    newOptions.extra.addAll(_extra);
    newOptions.headers.addAll(<String, dynamic>{});
    final _result = await _dio.request<List<dynamic>>(
        'name/$name?fullText=true',
        queryParameters: queryParameters,
        options: newOptions.merge(method: 'GET', baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Detail.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions newRequestOptions(Options options) {
    if (options is RequestOptions) {
      return options;
    }
    if (options == null) {
      return RequestOptions();
    }
    return RequestOptions(
      method: options.method,
      sendTimeout: options.sendTimeout,
      receiveTimeout: options.receiveTimeout,
      extra: options.extra,
      headers: options.headers,
      responseType: options.responseType,
      contentType: options.contentType.toString(),
      validateStatus: options.validateStatus,
      receiveDataWhenStatusError: options.receiveDataWhenStatusError,
      followRedirects: options.followRedirects,
      maxRedirects: options.maxRedirects,
      requestEncoder: options.requestEncoder,
      responseDecoder: options.responseDecoder,
    );
  }
}
