import 'package:crud_getx/constant/export.dart';
import 'package:crud_getx/service/firebase_service.dart';

class FirestoreController extends GetxController{
TextEditingController email = TextEditingController();
TextEditingController name =TextEditingController();
TextEditingController phoneno =TextEditingController();
RxList data =[].obs;
RxMap value={}.obs;
RxList dataList =[].obs;
Stream get dataListStream => dataList.stream;
//
// final _dataList = RxList<Map<String, dynamic>>([]);
//
// Stream<List<Map<String, dynamic>>> get dataListStream => _dataList.stream;

// Future<void> refreshData() async {
//   try {
//     final data = await FirebaseService().getDataFireStore(email, name, phoneno);
//     _dataList.assignAll(data); // Update internal data list
//   } catch (e) {
//     print('Error fetching data: $e');
//   }
// }

@override
void onInit() {
  super.onInit();
  // refreshData(); // Fetch data on controller initialization
}
}