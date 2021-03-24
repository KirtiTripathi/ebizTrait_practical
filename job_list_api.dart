import 'package:dio/dio.dart' as http_dio;
import 'dart:async';
import 'dart:convert';

class JobListApi{
  Map jobDetailsData ={};
  Future<Map> getJobDetails({UserId}) async {
    http_dio.Dio dio = http_dio.Dio();
    dio.options.headers = {"Content-Type": "form-data","Accept":"application/json"};
   Map body = {
      "UserId": UserId,
    };
    http_dio.Response response = await dio.post(
        "http://107.180.107.49/Moms/api/AvailableJobList" , data: body);
    if (response.statusCode == 200) {
      print("success, $response");
      final rawData = jsonDecode(jsonEncode(response.data));
      jobDetailsData = rawData;
      return jobDetailsData;
    }
  }
}