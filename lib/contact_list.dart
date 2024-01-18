import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  Map<String, Contact> uniqueContactsMap = {};
  List<Contact> uniqueContactsList=[];
  List<Contact> contactList = [
    Contact(name: "Solanki Meghana",
        gender: "Female",
        mobileNo: "964742541",
        id: 1),
    Contact(
        name: "Keval Mangroliya", gender: "Male", mobileNo: "123452541", id: 2),
    Contact(
        name: "Chirag Mevada", gender: "Male", mobileNo: "961245641", id: 3),
    Contact(name: "Solanki Meghana",
        gender: "Female",
        mobileNo: "998842541",
        id: 4),
    Contact(
        name: "Keval Mangroliya", gender: "Male", mobileNo: "965412541", id: 5),
  ];

  void getUniqueList() {
    for (Contact contact in contactList) {
      uniqueContactsMap[contact.name] = contact;
    }

    // Convert the Map values back to a list
    uniqueContactsList = uniqueContactsMap.values.toList();

    // Display the unique list
    for (var contact in uniqueContactsList) {
      if(contact.gender=="Male"){
        contact.gender="Female";
        contact.name="Ms.${contact.name}";

      }else{
        contact.gender="Male";
        contact.name="Mr.${contact.name}";
      }
      setState(() {
      });

      if (kDebugMode) {
        print("Name: ${contact.name}, Gender: ${contact.gender}, Mobile No: ${contact.mobileNo}, ID: ${contact.id}");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  getUniqueList();
                },
                child: const Text("Next")),
          )
        ],
      ),
    );
  }
}


class Contact {
  String name;
  String gender;
  String mobileNo;
  int id;

  Contact(
      {required this.name, required this.gender, required this.mobileNo, required this.id});
}
