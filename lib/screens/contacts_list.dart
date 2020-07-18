import 'package:flutter/material.dart';
import 'package:neobank/screens/contact_form.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'bob',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: (Text(
                '100',
                style: TextStyle(fontSize: 16.0),
              )),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ContactForm(),
              ),
            ).then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add),
      ), 
    );
  }
}
