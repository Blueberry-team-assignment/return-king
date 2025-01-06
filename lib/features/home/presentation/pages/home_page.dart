import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/home/presentation/molecules/room_list_tab.dart';
import 'package:return_king/features/home/presentation/molecules/timeline_tab.dart';
import 'package:return_king/features/home/domain/providers/home_providers.dart';
import 'package:return_king/features/room/domain/providers/room_providers.dart';
import 'package:return_king/features/timeline/domain/providers/timeline_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex = ref.watch(homeTabProvider);
    final rooms = ref.watch(roomListProvider);
    final hasRooms = rooms.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('답례왕'),
        actions: [
          ElevatedButton(
              onPressed: () async {
                ref.invalidate(homeTabProvider); // 초기화
                ref.invalidate(roomListProvider); // 초기화
                ref.invalidate(timelineListProvider); // 초기화
                await FirebaseUIAuth.signOut(
                  context: context,
                  auth: FirebaseAuth.instance,
                );
              },
              child: const Text('로그아웃'))
        ],
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            if (hasRooms) {
              ref.read(roomListProvider.notifier).clearRooms();
            } else {
              ref.read(roomListProvider.notifier).fetchRooms();
            }
          },
          child: Text('hasRooms : ${!hasRooms}')),
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
