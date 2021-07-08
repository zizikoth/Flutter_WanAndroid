import 'package:path_provider/path_provider.dart';
import 'package:wan/tools/Tools.dart';

class CleanUtils {
  static Future<String> getCacheSize() async {
    Directory tempDir = await getTemporaryDirectory();
    double size = await _getTotalSizeOfFilesInDir(tempDir);
    return _formatCacheSize(size);
  }

  static Future cleanCache() async {
    Directory tempDir = await getTemporaryDirectory();
    return _delDir(tempDir);
  }

  static Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) total += await _getTotalSizeOfFilesInDir(child);
      return total;
    }
    return 0;
  }

  static String _formatCacheSize(double value) {
    if (value == 0) return "";
    List<String> unitArr = []..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  static Future _delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delDir(child);
      }
    }
    await file.delete();
  }
}
