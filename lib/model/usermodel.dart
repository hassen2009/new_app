class UserModel{
  String name;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;
  String role;
  String role2;
  String typel;

  UserModel({
    required this.name,
    required this.bio,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
    required this.role,
    required this.role2,
    required this.typel

      }
      );
  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel
      (name: map["name"] ??"",
        bio: map["bio"]?? "",
        profilePic:map["profilePic"] ?? "",
        createdAt: map["createdAt"]?? "",
        phoneNumber:map["phoneNumber"] ??"",
      uid: map["uid"]?? "",
      role: map['role']??"",
      role2: map["role2"]??"",
      typel: map["typel"]??""
    );
  }
  Map<String,dynamic> toMap(){
    return{
      "name":name,
      "bio":bio,
      "profilePic":profilePic,
     "createdAt":createdAt,
     "phoneNumber":phoneNumber,
      "uid":uid,
      "role":role,
      "role2":role2,
      "typel":typel
    };
  }
}