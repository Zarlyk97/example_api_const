import 'package:exemple_api_const/models/model.dart';
import 'package:exemple_api_const/service/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Usermodel>? usermodel = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    usermodel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(
        () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: usermodel == null || usermodel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: usermodel!.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(usermodel![index].id.toString()),
                          Text(usermodel![index].username),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(usermodel![index].email),
                          Text(usermodel![index].website),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
    );
  }
}
