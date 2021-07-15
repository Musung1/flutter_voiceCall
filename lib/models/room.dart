class RoomModel{
  static const CHANNEL = "channel";
  String? channel;
  RoomModel(this.channel);

  RoomModel.fromMap(Map<String,dynamic> data){
    channel = data[CHANNEL];
  }
}
