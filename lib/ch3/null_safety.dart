class NullSafety {
  // null이란?
  // [어떤 값이 존재하지 않거나 아직 할당하지 않았다.]는 상태
  // null 오류를 방지하기 위한 장치
  // null-safety : 개발자가 코드를 작성하면서 null이 발생할 수 있는 오류를 잡아주는 것

  // Dart는 기본적으로 null을 허용하지 않습니다. -> non-nullable type
  int age = 30;
  String name = "홍길동";

  /// [?] 기호를 사용해서 nullable type을 만들 수 있습니다.
  /// [?] 기호를 사용하고 초기화를 안해주면 기본 값으로 null이 세팅됩니다.
  /// int => int 타입에 해당하는 값만 올 수 있다.
  /// int? => int 타입과 null 값이 올 수 있다. ex) 1,2 3, 4, null
  int? age2;
  String? name2 = "김진한";
}

/// typedef 함수를 정의하는 키워드
typedef NullFunction = void Function();

typedef StringNullFunction = String Function();

void aa() {}

