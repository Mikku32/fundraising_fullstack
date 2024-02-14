import 'package:flutter/material.dart';
import 'package:fundraising_fullstack/bg_gradient.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BgGradient(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 8,
                  ),
                  child: TextField(
                      controller: _searchcontroller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: "Find fundraisers, projects, and more",
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Theme.of(context).colorScheme.secondary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 18),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Start New\nFundraising",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Theme.of(context).colorScheme.surface),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Start Now",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 76, 68, 68),
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    height: 150, color: Theme.of(context).colorScheme.surface)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
