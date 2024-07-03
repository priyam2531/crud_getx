import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_getx/app/modules/controllers/firestore%20controller/firestore_controller.dart';
import 'package:crud_getx/app/modules/views/pages/database%20firestore/data_screen.dart';
import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class FirestoreScreen extends StatefulWidget {
  FirestoreScreen({Key? key}) : super(key: key);

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {
  FirestoreController firestoreController = Get.put(FirestoreController());

  FirebaseService firebaseService = FirebaseService();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    print("------------------<>-----------${firebaseService.firebaseFirestore.collection('user')}");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          title: Text(
            'Data',
            style: poppinsRegular.copyWith(color: AppColor.whiteColor, fontSize: 18),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.to(DataScreen());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firebaseFirestore.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == true) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.toString().isNotEmpty) {
            final data = snapshot.data?.docs ?? [];
            print("Data:-${snapshot.data!.docs.length}");
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                bool _isSwiped = false;
                return SwipeableTile(
                  color: Colors.transparent,
                  swipeThreshold: 0.2,
                  direction: SwipeDirection.horizontal,
                  key: UniqueKey(),
                  backgroundBuilder: (context, direction, progress) {
                    if (direction == SwipeDirection.endToStart) {
                      return Container(color: Colors.red);
                      // return InkWell(
                      //     onTap: () {
                      //       firebaseService.deleteDataFireStore(data[index]['did']);
                      //     },
                      //     child: Container(color:Colors.red,child: Icon(Icons.delete, color: Colors.white)));
                    } else if (direction == SwipeDirection.startToEnd) {
                      _isSwiped = true;
                      return Container(color: AppColor.primaryColor);
                    }
                    return Container();
                  },
                  onSwiped: (direction)  {
                    if (direction == SwipeDirection.startToEnd && _isSwiped) {
                      Get.to(DataScreen(
                        id: data[index]['did'],
                        name: data[index]['name'],
                        email: data[index]['email'],
                        number: data[index]['number'],
                      ));
                    } else if (direction == SwipeDirection.endToStart) {
                      firebaseService.deleteDataFireStore(data[index]['did']);

                      Get.snackbar("Success", "Data deleted successfully");
                    }
                  },
                  child: Card(
                      child: ListTile(
                    title: Text("${data[index]['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("${data[index]['email']}"),
                        Text("${data[index]['number']}"),
                      ],
                    ),
                    leading: CircleAvatar(
                        backgroundColor: AppColor.primaryColor, child: Text("${index + 1}")),
                    // trailing: Wrap(children: [
                    //   InkWell(
                    //       onTap: () {
                    //         Get.to(DataScreen(
                    //           id: data[index]['did'],
                    //           name: data[index]['name'],
                    //           email: data[index]['email'],
                    //           number: data[index]['number'],
                    //         ));
                    //       },
                    //       child: Icon(Icons.edit)),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    //   InkWell(onTap: () {
                    //     firebaseService.deleteDataFireStore(data[index]['did']);
                    //   }, child: Icon(Icons.delete))
                    // ]),
                  )),
                );
              },
            );
          } else {
            return const Text("No data found");
          }
        },
      ),
    ));
  }
}
