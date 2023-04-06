import 'package:equatable/equatable.dart';

class ChatUser extends Equatable {
  final String id;
  final String image;
  final String userName;
  final String phoneNumber;
  final String aboutMe;

  const ChatUser(
      {required this.id,
      required this.image,
      required this.userName,
      required this.phoneNumber,
      required this.aboutMe});
      
        @override
        // TODO: implement props
        List<Object?> get props => throw UnimplementedError();
}
