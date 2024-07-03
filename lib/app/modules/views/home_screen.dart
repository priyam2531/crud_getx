

import 'package:crud_getx/constant/export.dart';

class UpdateValue extends StatelessWidget {
  UpdateValue({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Update Value'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          homeController.xIncrement();
          homeController.data
              .add({"xNumber": homeController.counter.value.toString()});
          print("------------<>--------${homeController.data.length}");
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: homeController.data.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text(homeController.data[index]["xNumber"] ?? '',style: const TextStyle(fontSize: 20),),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        homeController.data.removeAt(index);
                      },
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        homeController.xNumber.text =
                            homeController.data[index]["xNumber"] ?? '';
                          dialog(index);
                      },
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void dialog(int? id) {
    Get.dialog(
      AlertDialog(
        title: const Text("Details"),
        content: TextFormField(
          controller: homeController.xNumber,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (id != null) {
                homeController.data.canUpdate;
                homeController.data[id] = {
                  "xNumber": homeController.xNumber.text,
                };
              } else {
                homeController.data.add(
                  {
                    "xNumber": homeController.xNumber.text,
                  },
                );
              }
              Get.back();
            },
            child: const Text("Done"),
          )
        ],
      ),
    ).whenComplete(() {
      homeController.xNumber.clear();
    });
  }
}
