import 'package:agora_rtc_engine/rtc_channel.dart';
import 'package:crud_project/constants/firebase.dart';
import 'package:crud_project/models/room.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';

const APP_ID = 'c1886a27a9af440cbca306eda4b3047e';
class AudioController extends GetxController{
  static AudioController instance = AudioController();
  TextEditingController channelName = TextEditingController();
  RxList<String> channelNames = <String>[].obs; // 모든 채널 이름 저장
  RxList<RtcChannel> channels = <RtcChannel>[].obs; // 자신이 만든 채널 저장
  late RtcEngine engine;
  @override
  void onReady() {
    initPlatformState();
    //channelNames.bindStream(getChannel());
    super.onReady();
  }
  Future<void>initPlatformState()async{
    await [Permission.microphone].request();
    RtcEngineConfig config = RtcEngineConfig(APP_ID);
    engine = await RtcEngine.createWithConfig(config);
    await engine.setClientRole(ClientRole.Audience);
  }
  Future<void>makeChannel()async{
    channels.add(await RtcChannel.create(channelName.text));
  }
  addChannelNameToFirebase(){
    firebaseFirestore.collection("channelName").doc(channelName.text).set({
      'channel' : channelName.text,
    });
  // }
  // Stream <String> getChannel() =>
  //     firebaseFirestore.collection("channelName").snapshots().map((value) =>
  //         value.docs.map((item)=>
  //             RoomModel.fromMap(item.data())
  //         ).toList()
  //     );
}