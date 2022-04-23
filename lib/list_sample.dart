import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/person_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListSample extends StatelessWidget {
  ListSample({Key? key}) : super(key: key);

  getContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    contacts.forEach((element) {
      print(element.displayName);
    });
  }

  List persons = [
    Person(
      "viswa",
      "457985323",
      "https://source.unsplash.com/random/200x200?sig=4",
    ),
    Person(
      "rahul",
      "468523567",
      "https://source.unsplash.com/random/200x200?sig=5",
    ),
    Person(
      "basil",
      "989465666",
      "https://source.unsplash.com/random/200x200?sig=1",
    ),
    Person(
      "aswathy",
      "876543219",
      "https://source.unsplash.com/random/200x200?sig=2",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Person person = persons[index];
          return createView(person);
        },
        itemCount: persons.length,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: getContacts,
        child: Text("get contacts"),
      ),
    );
  }

  Widget createView(Person person) {
    return Container(
      margin: EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          launch("tel: ${person.mobile}");
        },
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              Image.network(
                person.imageUrl,
                height: 150,
                width: 250,
              ),
              Column(
                children: [
                  Text(person.name),
                  Text(person.mobile),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
