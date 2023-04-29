class OpenItem {
  String? baseDate;
  String? baseTime;
  String? category;
  String? fcstDate;
  String? fcstTime;
  String? fcstValue;
  int? nx;
  int? ny;

  OpenItem({
    required this.baseDate,
    required this.baseTime,
    required this.category,
    required this.fcstDate,
    required this.fcstTime,
    required this.fcstValue,
    required this.nx,
    required this.ny,
  });

  factory OpenItem.fromJson(Map<String, dynamic> json) {
    return OpenItem(
      baseDate: json["baseDate"],
      baseTime: json["baseTime"],
      category: json["category"],
      fcstDate: json["fcstDate"],
      fcstTime: json["fcstTime"],
      fcstValue: json["fcstValue"],
      nx: json["nx"],
      ny: json["ny"],
    );
  }

  @override
  String toString() {
    return 'Item{baseDate: $baseDate, baseTime: $baseTime, category: $category, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue, nx: $nx, ny: $ny}';
  }

// type 값이 int일때도 있고, double 일때도 있음
// type => num 타입으로 사용하세요.
}
