class PostResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserItem>? userList;
  Support? support;

  PostResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.userList,
    this.support,
  });

  PostResponse copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserItem>? data,
    Support? support,
  }) {
    return PostResponse(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      totalPages: totalPages ?? this.totalPages,
      userList: data ?? this.userList,
      support: support ?? this.support,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': userList,
      'support': support,
    };
  }

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      userList: (json['data'] as List<dynamic>?)
          ?.map((e) => UserItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() =>
      "Response(page: $page,perPage: $perPage,total: $total,totalPages: $totalPages,data: $userList,support: $support)";

  @override
  int get hashCode =>
      Object.hash(page, perPage, total, totalPages, userList, support);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is PostResponse &&
              runtimeType == other.runtimeType &&
              page == other.page &&
              perPage == other.perPage &&
              total == other.total &&
              totalPages == other.totalPages &&
              userList == other.userList &&
              support == other.support;
}

class UserItem {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserItem({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  UserItem copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserItem(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  factory UserItem.fromJson(Map<String, dynamic> json) {
    return UserItem(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  @override
  String toString() =>
      "Data(id: $id,email: $email,firstName: $firstName,lastName: $lastName,avatar: $avatar)";

  @override
  int get hashCode => Object.hash(id, email, firstName, lastName, avatar);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UserItem &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              email == other.email &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              avatar == other.avatar;
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  Support copyWith({
    String? url,
    String? text,
  }) {
    return Support(
      url: url ?? this.url,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'text': text,
    };
  }

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );
  }

  @override
  String toString() => "Support(url: $url,text: $text)";

  @override
  int get hashCode => Object.hash(url, text);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Support &&
              runtimeType == other.runtimeType &&
              url == other.url &&
              text == other.text;
}
