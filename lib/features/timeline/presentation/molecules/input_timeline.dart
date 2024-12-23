import 'package:flutter/material.dart';

class InputTimeline extends StatelessWidget {
  const InputTimeline({
    super.key,
    required this.controller
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.indigo.shade400,
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: '입력해봐 ㅎㅎ', border: InputBorder.none),
              )),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}
