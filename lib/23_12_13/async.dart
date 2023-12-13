import 'dart:io';

Future<void> modifyCopy(String fromPath, String toPath) async {
  try {
    /* final sample = File('sample.csv');
    오류 PathNotFoundException: Cannot open file, path = 'sample.csv' (OS Error: The system cannot find the file specified.
, errno = 2) 발생 */
    print('현재 디렉토리: ${Directory.current.path}');
    final sample = File('lib/23_12_13/$fromPath'); // 상대 경로
    final text = await sample.readAsString();
    print('sample text: $text');

    final modifiedText = text.replaceAll('한석봉', '김석봉');

    // final copiedFile = File(toPath);
    final copiedFile = File('lib/23_12_13/$toPath');
    await copiedFile.writeAsString(modifiedText);

    print('수정완료');
  } catch (e) {
    print('오류 $e 발생');
  }
}

void main() async {
  await modifyCopy('sample.csv', 'sample_copy.csv');
}