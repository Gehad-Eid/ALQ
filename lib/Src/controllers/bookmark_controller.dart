import 'package:alqgp/Src/Models/bookmark_model.dart';
import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:get/get.dart';

class BookmarksController extends GetxController {
  static BookmarksController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  final String bookmarkfolderID = Get.arguments;
  RxList<Bookmark> lesoonssList = RxList<Bookmark>();
  List<Bookmark> get lessons => lesoonssList;

  @override
  void onInit() {
    super.onInit();
    //  the lessons from data base to keep track of the changes
    lesoonssList
        .bindStream(_databaseRepo.getBookmarksLessons(bookmarkfolderID));
  }
}
