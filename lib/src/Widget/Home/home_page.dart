import 'package:flutter/material.dart';
import 'package:myapp/src/BLoC_Db/logic.dart';
import 'package:myapp/src/Widget/dialogue/dialogue.dart';
import 'package:myapp/src/Widget/pages/detailesPage/details_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // var keys = GlobalKey();
  static final u = Db();

  final cng = ToggleSwitch.instance;

  @override
  Widget build(BuildContext context) {
    //  late bool b;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: const Text("My Contact List"),
              expandedHeight: 50,
              backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
              actions: [
                ListenableBuilder(
                    listenable: cng,
                    builder: (context, snapshot) {
                      return IconButton(
                        onPressed: () {
                          cng.changeTheme();
                        },
                        icon: cng.themeIcon,
                      );
                    }),
              ],
            ),
            ListenableBuilder(
              listenable: u,
              builder: (context, snapshot) {
                return SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      for (int i = 0; i < u.item1.length; i++) ...[
                        Dismissible(
                            background: Container(
                              color: Colors.amber,
                            ),
                            key: ValueKey(u.item1[i]),
                            child: ListTile(
                              onTap: () {
                                //  u.indexnum(i);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(),
                                  ),
                                );
                              },
                              leading: const Icon(Icons.account_circle),
                              trailing: IconButton(
                                onPressed: () {
                                  launchUrlString("tel:${u.item2[i]}");
                                },
                                icon: const Icon(
                                  Icons.call,
                                  color: Colors.green,
                                ),
                              ),
                              title: Text("${u.item1[i]}"),
                              subtitle: Text("${u.item2[i]}"),
                            ))
                      ]
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var element = await showDialog(
              context: (context),
              builder: (context) => const AddInformation(),
            );

            if (element is! List) {
              return;
            } else {
              u.add(element);

              element.clear();
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
