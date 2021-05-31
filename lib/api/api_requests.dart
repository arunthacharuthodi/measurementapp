import 'package:http/http.dart' as http;
import 'package:measurementapp/api/models.dart';

Future<MeasurementData> getdata(String url) async {
  final String apiurl =
      "https://backend-test-zypher.herokuapp.com/uploadImageforMeasurement";
  var response = await http.post(Uri.parse(apiurl), body: {"imageURL": url});
  final String body = response.body;
  return measurementDataFromJson(body);
}
