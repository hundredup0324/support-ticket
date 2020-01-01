class LoginResponse {
  int? status;
  String? message;
  Data? data;


  LoginResponse({
     this.status,
      this.message,
     this.data,
  });
  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

}

class Data {
  String? token;
  User? user;
  List<Workspace>? workspaces;

  Data({
    required this.token,
    required this.user,
    required this.workspaces,
  });



  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['workspaces'] != null) {
      workspaces = <Workspace>[];
      json['workspaces'].forEach((v) {
        workspaces!.add(Workspace.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (workspaces != null) {
      data['workspaces'] = workspaces!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class User {
  int? id;
  String? name;
  String? email;
  String? mobileNo;
  String? type;
  int? activeWorkspace;
  String? avatar;
  String? lang;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.type,
    required this.activeWorkspace,
    required this.avatar,
    required this.lang,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    type = json['type'];
    activeWorkspace = json['active_workspace'];
    avatar = json['avatar'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile_no'] = mobileNo;
    data['type'] = type;
    data['active_workspace'] = activeWorkspace;
    data['avatar'] = avatar;
    data['lang'] = lang;
    return data;
  }

}

class Workspace {
  int? id;
  String? name;
  String? slug;
  String? status;
  int? createdBy;

  Workspace({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.createdBy,
  });

  Workspace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    createdBy = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['status'] = status;
    data['created_by'] = createdBy;
    return data;
  }

}
