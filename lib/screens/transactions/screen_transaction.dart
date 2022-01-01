import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: Text(
                '12 \nDec',
                textAlign: TextAlign.center,
              ),
            ),
            title: Text('Rs.10000'),
            subtitle: Text('Travel'),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: 10,
    );
  }
}
