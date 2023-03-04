class Method {
  Method() {
    // int result = add(11, 35);
    // print('Method.Method result : $result'); // 46
    //
    // int minusResult = minus(60, 22);
    // print('Method.Method minusResult : $minusResult'); // 46
    //
    // String introResult = introduce("김진한", 40);
    // print('Method.Method introResult : $introResult');

    // String talkResult1 = talk("김진한");
    // print('Method.Method talkResult1 : $talkResult1');
    //
    // String talkResult2 = talk("김진한", time: DateTime.now().toString());
    // print('Method.Method talkResult2 : $talkResult2');
    //
    // var sleepResult = sleep(name: "김진한");
    // print('Method.Method sleepResult : $sleepResult');

    bool checkResult = check(10);
    print('Method.Method result : $checkResult');
  }

  // 반환값은 bool(boolean), 입력값은 int
  // 조건이 10과 같으면 true, 다르면 false
  bool check(int value) {
    return value == 10;
  }

  // 함수 입력값 optional
  // time 값을 입력해도 되고, 입력하지 않아도 됩니다.
  // 소괄호 안에 있는 입력값은 함수를 호출할 때 입력값의 이름을 보여주지 않는다.
  // 하지만 중괄호 안에 있는 입력값은 함수를 호출할 떄 입력값의 이름을 보여준다.
  String talk(String name, {String time = "16:50"}) {
    return "$name님이 대화를 신청하셨습니다. $time";
  }

  // required 키워드를 입력 변수 앞에 넣으면
  // 해당 변수의 값을 반드시 입력해야합니다.
  String sleep({required String name}) {
    return "$name이 자고 있습니다.";
  }

  String introduce(String name, int age) {
    return "안녕하세요. 저는 $name입니다. 제 나이는 $age입니다.";
  }

  // 함수 1. 입력, 2 구현, 3 반환
  // 입력값 2개(int), 반환 값 1개
  // int 값을 반환하고, 입력값 a와 b를 받는 add함수입니다.
  // int add(int a, int b) {
  //   return a + b;
  // }

  // minus 함수를 만들어주세요
  // 반환 값은 int입니다. 입력값은 2개이고, 둘다 int입니다.
  // int minus(int a, int b) {
  //   return a - b;
  // }

  // String eat(String food) {
  //   return "$food를 먹습니다.";
  // }


  /// lambda, 람다
  /// => : FatArrow
  /// -> arrow
  String eat(String food) => "$food를 먹습니다.";

  int minus(int a, int b) => a - b;

  int add(int a, int b) => a + b;

}
