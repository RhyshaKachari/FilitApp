import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:personal_expenses/database/sms_database.dart';
import 'package:personal_expenses/models/sms.dart';
import '../database/blocked_sender_database.dart';
import '../database/categories_database.dart';
import '../models/blocked_sender.dart';
import '../models/category.dart';

class SmsController extends GetxController {
  final SmsQuery _query = SmsQuery();
  var smsList = <SMS>[].obs;
  var notificationCategoryList = <Category>[].obs;
  var blockedSendersList = <BlockedSender>[].obs;
  var latestRefreshDate = DateTime(2000).obs;

  SmsController() {
    getNotificationCategories();
    getAllBlockedSenders();
  }

  Future<List<BlockedSender>?> getAllBlockedSenders() async {
    var list = await BlockedSenderDatabase.instance.readAllBlockedSenders();
    if (list != null) {
      blockedSendersList.value = list;
      return list;
    }
    return null;
  }

  List<String> getBlockedSendersStringList(List<BlockedSender> list) {
    return list.map((e) => e.sender).toList();
  }

  Future<List<SMS>?> getAllMessagesFromDB() async {
    var dbList = await SMSDatabase.instance.readAllSMS();
    var deviceList = await getAllMessagesFromDevice();
    if (dbList != null) {
      var first = dbList.first.time;
      if (first.isBefore(latestRefreshDate.value)) {
        first = latestRefreshDate.value;
      } else {
        latestRefreshDate.value = first;
      }
      for (var element in deviceList) {
        if (element.date!.isAfter(first)) {
          await SMSDatabase.instance.create(SMS(
            sender: element.sender!,
            body: element.body!,
            time: element.date!,
          ));
        } else {
          break;
        }
      }
    } else {
      for (var element in deviceList) {
        await SMSDatabase.instance.create(SMS(
          sender: element.sender!,
          body: element.body!,
          time: element.date!,
        ));
      }
    }
    return SMSDatabase.instance.readAllSMS();
  }

  void getPreviousSMS(BlockedSender blockedSender) async {
    var deviceList = await getAllMessagesFromDevice();
    for (var element in deviceList.where((element) => element.sender == blockedSender.sender)) {
      await SMSDatabase.instance.create(
        SMS(
          sender: element.sender!,
          body: element.body!,
          time: element.date!,
        ),
      );
      if (element.date!.isAfter(latestRefreshDate.value)) {
        latestRefreshDate.value = element.date!;
      }
    }
  }

  void markSMSAsAdded(SMS sms) {
    SMSDatabase.instance.added(sms);
  }

  void addSender(String sender) {
    BlockedSenderDatabase.instance.create(BlockedSender(sender: sender));
    SMSDatabase.instance.blockSender(sender);
    getAllBlockedSenders();
  }

  void deleteSender(BlockedSender blockedSender) {
    BlockedSenderDatabase.instance.delete(blockedSender.id!);
    getAllBlockedSenders();
  }

  Future<Iterable<SmsMessage>> getAllMessagesFromDevice() async {
    var permission = await Permission.sms.status;
    var filteredMessages = <SmsMessage>[];
    int count = 0;
    var bList = await getAllBlockedSenders() ?? [];
    var blockList = getBlockedSendersStringList(bList);
    if (permission.isGranted) {
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
      );
      for (int i = 0; i < messages.length; i++) {
        if (await checkMessage(messages[i], blockList)) {
          count++;
          filteredMessages.add(messages[i]);
          if (count >= 200) {
            break;
          }
        }
      }
    } else {
      await Permission.sms.request();
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
      );
      for (int i = 0; i < messages.length; i++) {
        if (await checkMessage(messages[i], blockList)) {
          count++;
          filteredMessages.add(messages[i]);
          if (count >= 200) {
            break;
          }
        }
      }
    }
    return filteredMessages;
  }

  Future<bool> checkMessage(SmsMessage message, List<String>? blockList) async {
    String lst = message.body!.toLowerCase();
    if ((lst.contains('debited') || lst.contains('credited') || lst.contains('transaction')) &&
        !lst.contains('recharge') &&
        !lst.contains('sale') &&
        !lst.contains('expire') &&
        !lst.contains('offer') &&
        !lst.contains('free') &&
        !lst.contains('requested') &&
        !lst.contains('enjoy') &&
        !lst.contains('rummy') &&
        !lst.contains('claim') &&
        !lst.contains('get') &&
        !lst.contains('prize')) {
      if (blockList != null) {
        if (blockList.contains(message.sender!)) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  void addNotificationCategories() {
    addNotificationCategory(Category(title: 'Food', iconCode: 1, categoryType: 'Expense'));
    addNotificationCategory(Category(title: 'Recharge', iconCode: 2, categoryType: 'Expense'));

    addNotificationCategory(Category(title: 'Salary', iconCode: 17, categoryType: 'Income'));
    addNotificationCategory(Category(title: 'Investments', iconCode: 18, categoryType: 'Income'));
  }

  void addNotificationCategory(Category category) async {
    await CategoryDatabase.instance.createNotificationCategory(category);
  }

  void editNotificationCategory(int id, Category category) async {
    await CategoryDatabase.instance.updateNotificationCategory(id, category);
  }

  Future<List<Category>?> getNotificationCategories() async {
    var list = await CategoryDatabase.instance.readAllNotificationCategories();
    if (list != null) {
      notificationCategoryList.value = list;
    }
    return list;
  }
}