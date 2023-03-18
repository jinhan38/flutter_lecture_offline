class ForLoop {
  /// 반복문(for문)
  ForLoop() {
    normalForLoop();
    enhancedForLoop();
    forEachLoop();
    doubleFor();
  }

  /// 반복문
  /// 전통적인 for문 (예전부터 많이 써오던 방식)
  void normalForLoop() {
    /// for문의 형태
    /// int i = 0 => 값
    /// i < 5     => 종료 조건, true면 통과, false면 종료
    /// i가 5보다 작다 i = 4 -> true 통과
    /// i = 10 -> false 종료
    /// i++     -> 1회 반복할 때 마다 실행되는 연산자
    for (int i = 0; i < 5; i++) {
      // print('ForLoop.normalForLoop i : $i');
    }

    List<String> list = ["a", "b", "c", "d", "e"];
    // list.length 배열의 개수(길이)를 반환 => 5
    // i < list.length => i가 list 배열의 개수만큼 반복됨
    for (int i = 0; i < list.length; i++) {
      print('ForLoop.normalForLoop i : $i, 값 : ${list[i]}');
    }
  }

  void enhancedForLoop() {
    List<String> list = ["가", "나", "다", "라", "마"];

    /// String value  값에는 list 배열의 값들이 차례차례 들어옵니다.
    /// list 배열 안에 있는(in) String value 값을 반복해서 출력해준다.
    for (String value in list) {
      print('ForLoop.enhancedForLoop $value');
    }

    /// 단축키
    /// list.for
    for (var value1 in list) {}
  }

  void forEachLoop() {
    List<String> list = ["가", "나", "다", "라", "마"];

    /// list 배열에 있는 값이 차례차례 호출된다.
    list.forEach((element) {
      print('ForLoop.forEachLoop $element');
    });
  }

  /// double 값으로 만들어진 배열(List)를
  /// for문을 사용해서 print를 출력해주세요
  /// 각자 만들어주시면 5분 후에 같이 해보겠습니다.
  void doubleFor() {
    List<double> doubleList = [
      1.1,
      3.6,
      10.4,
      5.5,
    ];

    /// 3가지 형태의  for문
    /// 첫번째
    for (int i = 0; i < doubleList.length; i++) {
      print('i : $i, value : ${doubleList[i]}');
    }

    /// 두번째
    for (var value in doubleList) {
      print("value : $value");
    }

    /// 세번째
    doubleList.forEach((element) {
      print("element : $element");
    });
  }

}
