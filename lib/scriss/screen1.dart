import 'package:flutter/material.dart';

class MyApp01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home:
          // Scaffold(
          //   appBar: AppBar(
          //     title: Text('My List'),
          //     leading: IconButton(
          //       icon: Icon(Icons.arrow_back),
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //     ),
          //   ),
          //   body: MyList(),
          // ),
          Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child:
                      Text('Categories', style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(color: Colors.black),
                  // margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {
                  // do something
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  // do something
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('My App Content'),
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'title': 'Item 1',
      'subtitle': 'Subtitle 1',
      'description': 'Description 1'
    },
    {
      'title': 'Item 2',
      'subtitle': 'Subtitle 2',
      'description': 'Description 2'
    },
    {
      'title': 'Item 3',
      'subtitle': 'Subtitle 3',
      'description': 'Description 3'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item['title']!),
          subtitle: Text(item['subtitle']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: item),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item['subtitle']!,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(item['description']!, style: TextStyle(fontSize: 20)),
            SizedBox(height: 16),
            Text(item['subtitle']!),
          ],
        ),
      ),
    );
  }
}
