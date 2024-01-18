import 'dart:developer';

import 'package:flutter/material.dart';

import 'main.dart';

class CountryList extends StatefulWidget {
  final List<List<Country>> countryData;
  const CountryList({super.key,required this.countryData});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

  @override
  Widget build(BuildContext context) {

    log("${widget.countryData}");
    return Scaffold(
      appBar: AppBar(title: const Text("List Manipulate"),
      ),
      body: ListView.builder(
          itemCount: widget.countryData.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.countryData[index].map((e) {
                  return  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 12),
                    child: Text(e.name),
                  );

                }).toList(),
              ),
            );
          }),
    ) ;
  }


}
