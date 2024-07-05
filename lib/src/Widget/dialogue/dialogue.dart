import 'package:flutter/material.dart';

class AddInformation extends StatelessWidget {
  const AddInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController();
    final controller2 = TextEditingController();
    // final controller3 = TextEditingController();
    // final controller4 = TextEditingController();
    return Dialog(
      child: SizedBox(
        height: 350,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///name TB
            SizedBox(
              width: 250,
              child: TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///number TB

            SizedBox(
              width: 250,
              child: TextField(
                controller: controller2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Number"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // ///git Tb
            // SizedBox(
            //   width: 250,
            //   child: TextField(
            //     controller: controller3,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       label: Text("Git Id name"),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            // ///Linkedin Tb
            // SizedBox(
            //   width: 250,
            //   child: TextField(
            //     controller: controller4,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       label: Text("Linkedin Id name"),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                FilledButton(
                  onPressed: () {
                    if (controller2.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Number can't be blank! Tap cancel"),
                        ),
                      );

                      // Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop([
                        controller1.text,
                        controller2.text,
                        // controller3.text,
                        // controller4.text,
                      ]);
                    }
                  },
                  child: const Text("Ok"),
                ),
                const SizedBox(
                  width: 50,
                ),
                FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
