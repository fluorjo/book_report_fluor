import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_report_fluor/models/model_shelf.dart';

class ShelfTab extends StatelessWidget {
  late String uid = '';

  ShelfTab({Key? key}) : super(key: key);

  Future<void> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final shelfProvider = Provider.of<ShelfProvider>(context);
    getUid();

    return FutureBuilder(
      future: shelfProvider.fetchBookOrCreateShelf(uid),
      builder: (context, snapshot) {
        if (shelfProvider.booksInShelf.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: shelfProvider.booksInShelf.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {

                    },
                    title:Text(shelfProvider.booksInShelf[index].title),

                    leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  shelfProvider.booksInShelf[index].thumbnail,
                ),
              ),
                    );
              });
        }
      },
    );

    //return const Center(child: Text('서재'));
  }
}
