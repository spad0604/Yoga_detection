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
  //     "registerDate": "2025-09-27T15:07:13.821312"
  // }
  const factory GetInformation({
    required String firstName,
    required String lastName,
    required String dob,
    required String id,
    required String email,
    required String registerDate,
  }) = _GetInformation;

  factory GetInformation.fromJson(Map<String, Object?> json) => _$GetInformationFromJson(json);
}
