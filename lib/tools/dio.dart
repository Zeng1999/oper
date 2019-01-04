import 'package:dio/dio.dart';
// import 'dart:convert';

dynamic dioGet(String path) async {
    var dio = new Dio();
    var res = await dio.get(path);
    return res.data;
}

dynamic dioPost(String path, [dynamic data]) async {
    var dio = new Dio();
    var res = await dio.post(path, data: data);
    return res.data;
}

void main() async {
    var res = await dioPost("http://localhost:8080/gettext", {"aid": 4});
    print(res);
}
