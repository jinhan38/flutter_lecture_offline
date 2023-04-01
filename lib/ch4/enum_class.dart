// Enum 클래스, 열거형 클래스

class EnumClass {
  String check({required LectureType type}) {
    String result = '';
    switch (type) {
      case LectureType.a:
        result = "a 클래스";
        break;
      case LectureType.b:
        result = "b 클래스";
        break;
      case LectureType.c:
        result = "c 클래스";
        break;
    }
    return result;
  }
}

/// enum 클래스
enum LectureType {
  a,
  b,
  c,
}
