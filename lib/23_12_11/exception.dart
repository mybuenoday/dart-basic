void main(List<String> arguments) {
  final numString = '10.5';
  int num = 0;

  try {
    try {
      num = int.parse(numString);
      print(num);
    } catch (e) {
      print('에러 $e 발생');
      num = 0;
      print('num: $num');
      print('rethrow를 사용하여 에러 $e 다시 발생시켜 봄');
      rethrow;
    } finally {
      print('예외 발생 여부와 상관없이 항상 실행되는 finally');
    }
  } catch (e) {
    num = 0;
    print('rethorw 이후 catch, num: $num');
  }


  try {
    someError();
  } catch (e) {
    print('someError의 에러 $e 발생');
  }

  try {
    someError2();
  } on FormatException {
    print('FormatException이 발생');
  } // 항상 해야 하는 처리는 finally로?
  finally {
    print('무조건 실행되는 코드');
  }

  try {
    checkMusicFile("some_file.wav");
  } on UnsupportedMusicFileException catch (e) {
    print('에러 $e 발생');
  } catch (e) {
    print('unknown 에러 $e 발생');
  }
}


void someError(){
  // 예외를 발생시키는 throw Exception
  throw FormatException('someError_FormatException 에러');
}

void someError2() {
  try {
    someError();
  } catch (e) {
    // 에러 처리를 미루는 rethrow
    rethrow;
  }
}

class UnsupportedMusicFileException implements Exception {
  final String? _message;
  UnsupportedMusicFileException([this._message]);

  @override
  String toString() {
    if (_message == null) return 'UnsupportedMusicFileException';
    return 'UnsupportedMusicFileException: $_message';
  }
}

void checkMusicFile(String fileName) {
  if (!isSupportedFormat(fileName)) {
    throw UnsupportedMusicFileException('Unsupported file format: $fileName');
  }
}

bool isSupportedFormat(String fileName) {
  return fileName.endsWith('.mp3');
}