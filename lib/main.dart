import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final mycontroller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latihan GetX"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${mycontroller.data.value}",
                style: TextStyle(fontSize: 36),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mycontroller.decrement();
                  },
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: () {
                    mycontroller.increment();
                  },
                  child: Text("+"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var data = 0.obs; // state yang akan selalu dipantau perubahannya
  void increment() {
    data++;
  }

  void decrement() {
    data--;
  }
}
