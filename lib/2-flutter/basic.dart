import 'package:flutter/material.dart';

class HomeBasic extends StatefulWidget {
  const HomeBasic({super.key});

  @override
  State<HomeBasic> createState() => _HomeBasicState();
}

class _HomeBasicState extends State<HomeBasic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined),
              label: "",
            )
          ],
        ),
        appBar: AppBar(title: const Text('Life Cycle')),
        body: const Center(child: Text("Ola!")),
        // floatingActionButtonLocation: FloatingActionButtonLocation,
        floatingActionButton: ElevatedButton(
            onPressed: () {},
            // rounded button
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            child: SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [Icon(Icons.edit), Text("Escrever")],
                ),
              ),
            )),
      ),
    );
  }
}
