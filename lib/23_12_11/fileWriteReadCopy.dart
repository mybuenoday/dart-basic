import 'dart:io';

void main(List<String> arguments) {
  final myFile = File('save.txt');
  myFile.writeAsStringSync('Hello, world!');
  final text = myFile.readAsStringSync();
  print('text: $text');

  final sourcePath = 'save.txt';
  final targetPath = 'copiedTarget_save.txt';
  copy(sourcePath, targetPath);

  final copied = File('copiedTarget_save.txt');
  final copiedText = copied.readAsStringSync();
  print('copiedText: $copiedText');
}

void copy(String sourcePath, String targetPath) {
  final sourceFile = File(sourcePath);
  final contents = sourceFile.readAsStringSync();

  final targetFile = File(targetPath);
  targetFile.writeAsStringSync(contents);
}