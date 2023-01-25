import 'dart:convert';

import 'package:homeworks/models/student.dart';
import 'package:http/http.dart' as http;

import '../models/group.dart';
import '../models/homework.dart';

class Api {
  static Future<List<Group>> getGroup() async {
    // print('dafd');
    Uri url = Uri(
      scheme: 'https',
      host: 'codeschoolhomeworkapi.pythonanywhere.com',
      path: 'student/get-groups/',
    );
    http.Response response = await http.get(url);

    List dataFromJson = jsonDecode(response.body);

    print(response.statusCode);

    List<Group> readyData = dataFromJson.map((e) => Group.getGroup(e)).toList();

    // print(dataFromJson);

    return readyData;
  }

  static Future<List<Homework>> getHomework(int id) async {
    Uri url = Uri(
        scheme: 'https',
        host: 'codeschoolhomeworkapi.pythonanywhere.com',
        path: 'homework/get-homeworks/$id/');
    http.Response response = await http.get(url);

    List dataFromJson = jsonDecode(response.body);

    List<Homework> readyData =
        dataFromJson.map((e) => Homework.getHomework(e)).toList();

    // print(dataFromJson);

    return readyData;
  }

  static Future<List> getStudent(int groupId, int homeworkId) async {
    Uri url = Uri(
        scheme: 'https',
        host: 'codeschoolhomeworkapi.pythonanywhere.com',
        path: 'homework/get-results/$groupId/$homeworkId/');

    http.Response response = await http.get(url);

    Map<String, dynamic> dataFromJson = jsonDecode(response.body);

    print(dataFromJson);
    List readyData =
        dataFromJson['ok'].map((e) => Student.getStudent(e)).toList();

    return readyData;
  }
}
