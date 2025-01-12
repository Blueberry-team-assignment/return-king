import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/home/presentation/molecules/room_list_tab.dart';
import 'package:return_king/features/home/presentation/molecules/timeline_tab.dart';
import 'package:return_king/features/home/domain/providers/home_providers.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/person_button.dart';
import 'package:return_king/features/room/presentation/atoms/buttons/plus_button.dart';
import 'package:return_king/features/room/presentation/pages/room_detail_page.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});


  Future<void> _dialogBuilder(BuildContext context,WidgetRef ref) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('정말 로그아웃 하시겠습니까?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                ref.invalidate(homeTabProvider); // 초기화
                ref.invalidate(roomListProvider); // 초기화
                ref.invalidate(timelineListProvider); // 초기화
                await FirebaseUIAuth.signOut(
                  context: context,
                  auth: FirebaseAuth.instance,
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const Text('로그아웃')),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex = ref.watch(homeTabProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('답례왕'),
        elevation: 2.0,
        leading: 
          PlusButton(onPressed: () {
            ref
                .read(selectedTimelineListByRoomIdProvider.notifier)
                .clearSelectedRoom();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const RoomDetailPage(isNewRoom: true)));
          }),
        actions: [
          PersonButton(onPressed: () => _dialogBuilder(context, ref)),
        ],
      ),
      body: IndexedStack(
        index: currentTabIndex,
        children: const [
          RoomListTab(),
          TimelineTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            ref.read(homeTabProvider.notifier).state = index;
            bool isRoomTab = index == 0;
            bool isTimelineTab = index == 1;
            if (isRoomTab) {
              ref.read(roomListProvider.notifier).fetchRooms();
            }
            if (isTimelineTab) {
              ref.read(timelineListProvider.notifier).fetchAllTimeline();
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.timeline_rounded), label: ''),
          ]),
    );
  }
}
