/// 변수 -> 변하는 변수/타입 -> 변(하는)수
/// 상수 -> 변하지 않는 변수/타입 -> (항)상수
/// 상수에는 2가지가 있습니다.
/// 1. final
/// 2. const -> static 과 같이 사용
///
/// static const가 무슨 뜻이냐?
/// - 변하지 않는 값
/// - static으로 선언하면 다른데서도 접근 가능
/// - compile 시에 이미 정해져 있는 값 -> 추후 설명
class Constant {
  Constant(this.work);

  /// 생성할 때 값을 입력합니다.
  /// 물론 final 키워드가 있기 때문에 변경 불가합니다.
  final bool work;

  /// final은 Constant 클래스를 생성할 때 정해집니다.
  /// 그리고 변하지 않는 값이다.
  /// 앱/어플리케이션/소프트웨어가 실행되는 시점에서 정해지는 값
  final int age = 30;
  final String name = "홍길동";

  /// 절대 안바뀜
  /// Constant 클래스를 생성하지 않아도 이미 존재하는 값이다.
  static const int age3 = 40;
}

/// 클래스 밖에 const를 붙일 때는 static 없이 사용
/// 앱/소프트웨어가 설치되는 시점에서 이미 존재하는 값
const int age4 = 40;
