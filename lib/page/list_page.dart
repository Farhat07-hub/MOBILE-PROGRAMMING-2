import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/pertemuan.dart';
import 'package:flutter_application_2/page/pertemuan_page.dart';

class ListPage extends StatefulWidget {
  ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Pertemuan> pertemuan = [
    Pertemuan(title: 'Pertemuan1', subtitle: 'Pengenalan Android'),
    Pertemuan(title: 'Pertemuan2', subtitle: 'Widget & Button'),
    Pertemuan(title: 'Pertemuan3', subtitle: 'Activity & Intent'),
    Pertemuan(title: 'Pertemuan4', subtitle: 'Toast & AlertDialog'),
    Pertemuan(title: 'Pertemuan5', subtitle: 'ListView'),
    Pertemuan(title: 'Pertemuan6', subtitle: 'Checkbox'),
    Pertemuan(title: 'Pertemuan7', subtitle: 'Radio Button'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pertemuan 5"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: pertemuan.length,
        itemBuilder: (context, index) {
          final item = pertemuan[index];

          return Card(
            child: ListTile(
              leading: Icon(Icons.list),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PertemuanPage(pertemuan: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}