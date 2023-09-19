import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> post(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  final response = await http.post(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
  return response;
}

Future<http.Response> put(
  String url, {
  Map<String, String>? headers,
  Object? body,
  Encoding? encoding,
}) async {
  final response = await http.put(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
  return response;
}

Future<http.Response> delete(String url,
    {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
  final response = await http.delete(Uri.parse(url),
      headers: headers, body: body, encoding: encoding);
  return response;
}

Future<http.Response> get(
  String url, {
  Map<String, String>? headers,
}) async {
  final response = await http.get(
    Uri.parse(url),
    headers: headers,
  );
  return response;
}
