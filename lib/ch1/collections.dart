class Collections {
  /// List, Map, Set
  /// List = 목록 -> 어떠한 형태의 것들을 여러개 가지고 있는 것
  /// 주석 = 컨트롤 + /
  /// List => 순서가 있습니다.
  /// Map, Set => 순서가 없습니다.
  Collections() {
    // // List => String 타입을 여러개 가진 List
    //
    // // String = 타입
    // // name = 변수명
    // // "김진한" = 초기화
    // String name = "김진한";
    //
    // // List<String> = 타입
    // // nameList = 변수명
    // // [] = 초기화 -> [] 콜렉션(여러개를 모아둔 것)
    // List<String> nameList = [
    //   "김진한",
    //   "더조은컴퓨터학원",
    // ];
    // print('Collections.Collections $nameList');
    //
    // /// 코드 정리하는 단축키 = 컨트롤 + 알트 + L
    // List<int> scoreList = [88, 62, 90, 100, 41];
    //
    // print('Collections.Collections $scoreList');

    // listAdd();
    // listRemove();
    // sort();
    collectionMap();
    collectionSet();
  }

  /// 1. add -> 1개 추가
  /// 2. addAll -> 여러개 추가
  /// 3. insert(수정) -> 수정을 하기 위해서는 몇번째 값을 수정할지, 어떤 값으로 수정할지
  /// 이러한 것들은 예전부터 만들어진 사용 방법
  /// Collection에서 중요한 것 => 순서가 0부터 시작한다.
  void listAdd() {
    List<int> listInt = [1, 2, 3, 4, 5];
    listInt.add(6);
    listInt.add(7);
    listInt.addAll([1, 2, 3]);

    /// 0번째 값을 50으로 변경시켜주세요.
    listInt.insert(0, 50);

    /// 3번째 값을 수정하세요
    /// 배열의 시작은 0부터 합니다.
    /// 0, 1, 2
    listInt.insert(2, 99);
    print('Collections.listAdd : $listInt');
  }

  /// 배열 제거
  /// 1. removeLast
  /// 2. remove
  /// 3. removeAt
  /// 4. clear
  void listRemove() {
    List<int> listInt = [1, 2, 3, 4, 5];

    // 배열의 값 읽기
    // 읽어오고 싶은 index 값을 넣어준다. index라는 것은 몇번째 인지(숫자값)
    // listInt[1] => listInt 배열에서 두번째 값을 가져옵니다.
    int first = listInt[1];

    // sout
    // soutm
    // 배열에서 마지막 값을 제거합니다.
    listInt.removeLast();

    /// removeAt => 몇번째의 값을 제거한다.
    listInt.removeAt(0);

    /// remove 일치하는 값을 제거합니다.
    listInt.remove(3);

    /// clear 전부 삭제해줍니다.
    listInt.clear();
    print('Collections.listRemove : $listInt');
  }

  void sort() {
    List<int> listInt = [4, 2, 666, 5, 2, 7, 8];
    print('Collections.sort 111 : $listInt');

    /// 오름차순으로 정렬
    listInt.sort();
    print('Collections.sort 222 : $listInt');

    /// 내림차순 정렬
    listInt.sort((a, b) => b.compareTo(a));
    print('Collections.sort $listInt');

    // /// 배열을 거꾸로 만들기
    // List<int> newList = List.from(listInt.reversed);
    // print('Collections.sort 333 : $newList');
    // List<int> reverseToList = listInt.reversed.toList();
  }

  /// Map 타입 => key, value
  void collectionMap() {
    /// Map = 타입,
    /// map = 변수명
    /// {"key": "value"} = 초기화(입력한 값)
    /// :(콜론)을 기준으로 왼쪽이 key, 오른쪽이 value
    /// json => key, value 형태로 이루어짐
    Map map = {
      // key = String, value = String
      "key": "value",

      // key = int, value = String
      34123: "aaaa",

      // key = int, value = bool
      4545: true,

      // key = int, value = double
      55: 100.1,

      // key = int, value = int
      33: 6,
    };

    /// 읽어오기
    /// 추가하기
    /// 수정하기
    /// 제거하기
    ///
    /// var 타입은 아무거나 올 수 있다.
    /// String, int, bool
    var result1 = map[55];
    print('Collections.collectionMap result1 : $result1');

    /// 추가
    /// 추가에는 2가지 방식이 있다.
    /// 1. putIfAbsent, 2 map[key] = 입력값
    /// 두가지 방식의 차이점
    /// putIfAbsent 값이 비어있을 때만 추가
    /// map[key] 값이 비어 있을 때 추가, 값이 있을 때 변경
    /// put 넣다, if 만약, Absent 비어있는
    /// 만약에 비어있다면 데이터를  추가해주세요
    map.putIfAbsent("name", () => "김진한");

    // 앞에서 한번 넣었기 때문에 또 넣을 수 없다.
    map.putIfAbsent("name", () => "김진한222");

    map["age"] = 33;
    map["age"] = 60;
    map.remove("age");

    /// map에서는 remove함수가 remove하나밖에 없다.
    /// 그 이유는 순서가 있고 없음에 있습니다.
    map.clear();
    print('Collections.collectionMap $map');

    /// Map<key의 타입, value의 타입>
    /// 일반적으로 Key는 String 타입을 사용합니다.
    /// 일반적으로 value는 다양한 타입을 사용합니다.
    /// 다양한 타입 -> 아무거나 올 수 있다.
    /// 아무거나 타입 = dynamic
    Map<String, dynamic> typeMap = {
      "name": "김진한",
      "age": 50,
      "check": true,
      "weight": 70.8,
    };
    print('typeMap : $typeMap');
  }

  /// Set 타입 -> List, Map과 닮았다.
  /// List에는 중복 값이 들어갈 수 있습니다.
  /// Set에는 중복된 값이 들어갈 수 없습니다.
  void collectionSet() {
    // List<int> list = [];
    // Map<String ,dynamic> map = {};

    /// Set 타입을 만드는 형태는 Map과 비슷하지만, 한개의 값을 넣을 수 있다.
    Set set = {"a", "b", "c", 1, 2, 3};

    /// 읽기, 쓰기, 수정, 제거
    // var result = set.elementAt(3);
    var result = set.last;
    print('Collections.collectionSet $result');

    set.add("name");
    set.addAll(["age", "weight", 100]);

    set.remove("age");
    set.removeAll(["weight", 100]);
    set.clear();
    print('Collections.collectionSet $set');

    Set<int> typeSet ={};
    typeSet.add(50);

  }
}
