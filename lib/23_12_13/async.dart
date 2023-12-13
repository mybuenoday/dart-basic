import 'dart:io';

Future<void> modifyCopy(String fromPath, String toPath) async {
  try {
    final sample = File('sample.csv');
    final text = await sample.readAsString();
    print('sample text: $text');

    final modifiedText = text.replaceAll('한석봉', '김석봉');

    final copiedFile = File(toPath);
    await copiedFile.writeAsString(modifiedText);

    print('수정완료');
  } catch (e) {
    print('오류 $e 발생');
  }
}

void main() async {
  await modifyCopy('sample.csv', 'sample_copy.csv');
}