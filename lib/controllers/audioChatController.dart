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
  RxList<RoomModel> channels = <RoomModel>[].obs; // 모든 채널 이름 저장
  late RtcEngine engine;
  @override
  void onReady() {
    initPlatformState();
    channels.bindStream(getChannel());
    super.onReady();
  }
  Future<void>initPlatformState()async{ // 엔진 초기화
    await [Permission.microphone].request();
    RtcEngineConfig config = RtcEngineConfig(APP_ID);
    engine = await RtcEngine.createWithConfig(config);
  }
  Future<void>makeChannel()async{ // 채널 생성
    await engine.setClientRole(ClientRole.Broadcaster);
    await engine.joinChannel(null, channelName.text,null,0);

  }
  addChannelToFirebase()async{ // 채널 이름 저장
    await firebaseFirestore.collection("channelName").doc(channelName.text).set({
      'channel' : channelName.text,
    });
  }
  joinChannel(String channelName)async{  // 채널 입장
    await engine.setClientRole(ClientRole.Audience);
    await engine.joinChannel(null,channelName,null,0);
  }
  void dispose()async{ //
    await engine.leaveChannel();
    //_client.logout();
    //_client.destroy();
    //_seniorMember.clear();
    //_channelList.clear();
    super.dispose();
  }
  Stream <List<RoomModel>> getChannel()=>  // roomModel 클라우드에서 받아오기
      firebaseFirestore.collection("channelName").snapshots().map((value) =>
          value.docs.map((item)=>
              RoomModel.fromMap(item.data())
          ).toList()
      );
}