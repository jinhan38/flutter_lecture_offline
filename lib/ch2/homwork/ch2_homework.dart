/// 카멜 케이스 : 클래스명은 첫 글자는 대문자, 단어나 단락 구분일 때는 대문자
/// 클래스명, 파일명, 변수명, 함수명 모두 숫자는 앞에 올 수 없습니다.
class Ch2Homework {
  Ch2Homework() {
    // Benz(100000, "벤츠", "김진한");

    // var 타입은 아무거나 올 수 있는 변수 타입
    // var benz1 = Benz(price: 100000000, carName: "벤츠1", owner: "김진한");
    Benz benz1 = Benz(price: 100000000, carName: "벤츠1", owner: "김진한");
    benz1.run();
    benz1.stop();
    benz1.repair();
    benz1.sale();
    print('');

    Genesis genesis = Genesis(price: 80000000, carName: "제네시스1", owner: "김진한");
    genesis.run();
    genesis.stop();
    genesis.wash();
    genesis.sale();
    print('');

    Sonata sonata = Sonata(price: 50000000, carName: "소나타1", owner: "김진한");
    sonata.run();
    sonata.stop();
    sonata.getGas();
    sonata.sale();

    // sonata
    //   ..run()
    //   ..stop()
    //   ..getGas();
  }
}

/// 추상 클래스는 abstract 키워드 필수
abstract class Car {
  double price;

  /// 카멜케이스 : carName에서 첫 글자는 소문자
  /// Name은 다른 단어이기 때문에 대문자
  String carName;
  String owner;

  /// Car 클래스의 생성자
  /// 3개의 값을 받도록 설정
  Car(this.price, this.carName, this.owner);

  void run() {
    print('$carName이 달리고 있습니다.');
  }

  void stop() {
    print('$carName이 정지했습니다.');
  }
}

/// 상속을 받을 때는 extends 키워드 사용
class Benz extends Car implements CarInterface {
  /// super 키워드는 부모 클래스에 접근할 수 있는 키워드
  //  Benz(super.price, super.carName, super.owner);
  //   Car(this.price, this.carName, this.owner);

  /// 다른 형태의 생성자
  Benz({
    required double price,
    required String carName,
    required String owner,
  }) : super(price, carName, owner) {
    print('Benz $carName을(를) 출고했습니다.');
  }

  ///
  void repair() {
    print('$owner가 $carName을(를) 수리했습니다.');
  }

  @override
  void sale() {
    print('$owner가 Benz $carName을 $price에 판매했습니다.');
  }
}

class Genesis extends Car implements CarInterface {
  // Genesis(super.price, super.carName, super.owner);

  Genesis({
    required double price,
    required String carName,
    required String owner,
  }) : super(price, carName, owner) {
    print('Genesis $carName을(를) 출고했습니다.');
  }

  void wash() {
    print('$owner가 $carName을 세차했습니다.');
  }

  @override
  void sale() {
    print('$owner가 Genesis $carName을 $price에 판매했습니다.');
  }
}

class Sonata extends Car implements CarInterface {
  Sonata({
    required double price,
    required String carName,
    required String owner,
  }) : super(price, carName, owner) {
    print('Sonata $carName을(를) 출고했습니다.');
  }

  void getGas() {
    print('$owner가 $carName에 주유했습니다.');
  }

  @override
  void sale() {
    print('$owner가 Sonata $carName을 $price에 판매했습니다.');
  }
}

/// 인터페이스는 추상클래스로 만들어도 되고 그냥 클래스로 만들어도 됩니다.
/// abstract 키워드를 쓰면 클래스를 생성자를 이용해서 생성하는게 불가능합니다.
/// 인터페이스는 implements 키워드로 사용합니다.
abstract class CarInterface {
  /// 중괄호가 없는 것은 구현부가 없다는 의미
  /// 구현부가 없으면 자식 클래스 혹은
  /// 인터페이스를 구현하는 클래스에서 구현해줘야 합니다.
  void sale();
}
