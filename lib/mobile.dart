import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> saveAndOpenFile(List<int> bytes, String filename) async {
  final path = (await getExternalStorageDirectory())!.path;
  final file = File('$path/$filename');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$path/$filename');
}
