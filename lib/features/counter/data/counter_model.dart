import 'package:return_king/features/counter/domain/entities/counter.dart';

class CounterModel {
  final int value;

  CounterModel({required this.value});

  // 도메인 엔티티에서 모델로 변환
  factory CounterModel.fromEntity(Counter counter) {
    return CounterModel(value: counter.value);
  }

  // JSON에서 모델로 변환
  factory CounterModel.fromJson(Map<String, dynamic> json) {
    return CounterModel(value: json['value'] as int);
  }

  // 모델에서 JSON으로 변환
  Map<String, dynamic> toJson() {
    return {'value': value};
  }

  // 모델에서 도메인 엔티티로 변환
  Counter toEntity() {
    return Counter(value);
  }
}
