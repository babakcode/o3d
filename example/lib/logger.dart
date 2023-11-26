import 'package:flutter/material.dart';

class LoggerPage extends StatelessWidget {
  final List<String> list;
  const LoggerPage(this.list,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) => Text(list[index]),
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        itemCount: list.length,
      ),
    );
  }
}
