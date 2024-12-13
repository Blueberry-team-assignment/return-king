import 'package:firebase_database/firebase_database.dart';

class FirebaseDataSource {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // 데이터 읽기
  void fetchData() {
    _database.child('room').onValue.listen((DatabaseEvent event) {
      event.snapshot.value;
    });
  }
}
