import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_information.freezed.dart';
part 'get_information.g.dart';

@freezed
class GetInformation with _$GetInformation {
  //   "data": {
  //     "firstName": "Nguyễn",
  //     "lastName": "Giáp",
  //     "dob": "2004-06-04",
  //     "id": "d42dcebe-b6ea-453a-a6a9-d8fc94e24ea4",
  //     "email": "giapt2k29@cht.edu.vn",
  //     "registerDate": "2025-09-27T15:07:13.821312",
  //     "role": "ADMIN"
  // }
  const factory GetInformation({
    @JsonKey(name: "firstName") required String firstName,
    @JsonKey(name: "lastName") required String lastName,
    @JsonKey(name: "dob") DateTime? dob,
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "registerDate") DateTime? registerDate,
    @JsonKey(name: "avatarUrl") String? avatarUrl,
    @JsonKey(name: "role") String? role,
  }) = _GetInformation;

  factory GetInformation.fromJson(Map<String, Object?> json) => _$GetInformationFromJson(json);
}
