import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

Future<void> downloadAudio(String url, String fileName) async {
  try {
    // Create a Dio instance
    Dio dio = Dio();

    // Get the directory where the file will be saved
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/$fileName';

    // Download the file
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          // Print download progress
          print("Downloading: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    print("Audio file saved at: $filePath");
  } catch (e) {
    print("Error downloading audio file: $e");
  }
}
