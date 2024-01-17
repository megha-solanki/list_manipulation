import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Country {
  String name;
  bool selected;

  Country({required this.name, required this.selected});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  List<Country> selectedNewList = [];
  List<Country> countryList = [
    Country(name: "India", selected: false),
    Country(name: "Pakistan", selected: false),
    Country(name: "Shree lanka", selected: false),
    Country(name: "Dubai", selected: false),
    Country(name: "USA", selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: countryList.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(countryList[index].name),
              value: selectedNewList.contains(index),
              onChanged: (_) {
                if (selectedNewList.contains(index)) {
                  selectedNewList.remove(index); // unselect
                } /*else {
                  selectedNewList.add(index); // select
                }*/
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          }),
    );
  }
}
