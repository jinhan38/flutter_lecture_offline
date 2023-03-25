mixin Item {
  void fly() {
    print('날아갑니다.');
  }
}

mixin Item2 {

  /// 구현부가 없는 경우에는 자식 클래스나
  /// 사용하는 클래스에서 구현해줘야합니다.
  void sleep2();
}
