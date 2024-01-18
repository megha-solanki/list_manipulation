import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:temp/contact_list.dart';
import 'package:temp/country_list.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactList(),
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
  List<List<Country>> multiDataList=[];
  List<Country> countryList = [
    Country(name: "India", selected: false),
    Country(name: "Pakistan", selected: false),
    Country(name: "Sri lanka", selected: false),
    Country(name: "Dubai", selected: false),
    Country(name: "USA", selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Country"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(countryList[index].name),
                    value: countryList[index].selected,
                    onChanged: (val) {
                      setState(() {
                        countryList[index].selected = val!;
                        if (!selectedNewList.contains(countryList[index])) {
                          selectedNewList.add(countryList[index]);
                          log("${selectedNewList.length}");
                        } else {
                          selectedNewList.remove(countryList[index]);
                          log("${selectedNewList.length}");
                        }
                      });

                      log("${countryList[index].selected}");
                      //  log("${selectedNewList}");
                    },
                  );
                }),
            const SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                  onPressed: selectedNewList.isNotEmpty?
                      () {
                    for(int i = 0;i<selectedNewList.length;i++){
                      log("${i}");
                      List<Country> newDataList=[];
                      for(int j=0;j<selectedNewList.length;j++){

                        int position = (j+i) % selectedNewList.length;
                        log("i=$i j=$j position ==$position");
                        newDataList.add(selectedNewList[position]);
                        log("${newDataList.length}");
                      }
                      multiDataList.add(newDataList);
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CountryList(countryData:multiDataList);
                          },
                        ));
                  }:null,
                  child: const Text("Next")),
            )
          ],
        ),
      ),
    );
  }

}

