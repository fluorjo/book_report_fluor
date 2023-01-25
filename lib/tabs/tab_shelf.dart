import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_report_fluor/models/model_shelf.dart';

class ShelfTab extends StatelessWidget {
  late String uid = '';

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
        if (shelfProvider.booksInShelf.length == 0) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: shelfProvider.booksInShelf.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/bookDetail',
                  //       arguments: shelfProvider.booksInShelf[index]);
                  // },
                  title: Text(shelfProvider.booksInShelf[index].title),
                  // trailing: Text(shelfProvider.booksInShelf[index].authors),
                  leading: Text(shelfProvider.booksInShelf[index].thumbnail),
                );
              });
        }
      },
    );

    //return const Center(child: Text('서재'));
  }
}
