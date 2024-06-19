import 'package:flutter/material.dart';
import 'package:kids_game/screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kids"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.qua.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Draggable(
                    data: providerW!.qua[index].key,
                    feedback: Text(
                      "${providerW!.qua[index].image}",
                      style: const TextStyle(
                          decoration: TextDecoration.none, fontSize: 30),
                    ),
                    child: Text(
                      "${providerW!.qua[index].image}",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: providerW!.ans.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: DragTarget(
                    onWillAcceptWithDetails: (details) {
                      return details.data == providerW!.ans[index].key;
                    },
                    onAcceptWithDetails: (details) {
                      providerW!.changeDrag(index);
                    },
                    builder: (context, candidateData, rejectedData) {
                      return providerW!.ans[index].isDrop
                          ? Text(
                              "${providerR!.ans[index].drop}",
                              style: const TextStyle(fontSize: 30),
                            )
                          : Text(
                              "${providerR!.ans[index].key}",
                              style: const TextStyle(fontSize: 50),
                            );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
