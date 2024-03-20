import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/domain/entities/user_data.dart';

part 'user_data_dto.g.dart';

@HiveType(typeId: 1)
class UserDataDTO {
  @HiveField(0)
  final bool isLoggedIn;

  @HiveField(1)
  final User user;


  UserDataDTO({required this.isLoggedIn, required this.user});

  UserData toDomain() {
    return UserData(user: user, isLoggedIn: isLoggedIn);
  }

  factory UserDataDTO.fromDomain(UserData userData) {
    return UserDataDTO(
      user: userData.user,
      isLoggedIn: userData.isLoggedIn,
    );
  }
}
