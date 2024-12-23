import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:return_king/features/home/presentation/molecules/room_list_tab.dart';
import 'package:return_king/features/home/presentation/molecules/timeline_tab.dart';
import 'package:return_king/features/home/providers/home_providers.dart';
import 'package:return_king/features/room/providers/room_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex = ref.watch(homeTabProvider);
    final rooms = ref.watch(roomListProvider);
    final hasRooms = rooms.isNotEmpty;
    return Scaffold(
      appBar: AppBar(title: const Text('답례왕')),
      floatingActionButton: ElevatedButton(
          onPressed: () => {
                if (hasRooms)
                  {ref.read(roomListProvider.notifier).clearRooms()}
                else
                  {ref.read(roomListProvider.notifier).fetchRooms()}
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
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.timeline_rounded), label: ''),
          ]),
    );
  }
}
