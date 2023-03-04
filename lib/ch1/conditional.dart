class Conditional {
  /// 조건문
  /// If, switch => 만약에
  Conditional() {
    // conditionalIf("k");
    conditionalSwitch("a");
  }

  void conditionalIf(String value) {
    /// value가 a와 같다면 true
    /// 다르다면 false
    if (value == "a") {
      /// value가 a와 같아서 true인 경우 진입
      print('Conditional.conditionalIf value의 값은 a 입니다.');
    } else if (value == "b") {
      /// value가 b와 같다면 진입
      print('Conditional.conditionalIf value의 값은 b 입니다.');
    } else {
      // a와 b가 아닌 경우
      print('Conditional.conditionalIf value의 값을 찾을 수 없습니다.');
    }
  }

  void conditionalSwitch(String value) {
    switch (value) {
      case "a":
        print('Conditional.conditionalSwitch value의 값은 a 입니다.');
        break;
      case "b":
        print('Conditional.conditionalSwitch value의 값은 b 입니다.');
        break;
      case "c":
        print('Conditional.conditionalSwitch value의 값은 c 입니다.');
        break;
      default:
        // a와 b가 아닌 경우
        print('Conditional.conditionalSwitch value의 값을 찾을 수 없습니다.');
        break;
    }
  }


}
