class CheckUsername {
  final String username;
  CheckUsername(this.username);
}

class CheckPassword {
  final String password;
  CheckPassword(this.password);
}

class CheckRetypePassword {
  final String password;
  CheckRetypePassword(this.password);
}

class MatchPassword {
  final String password;
  final String retypePassword;
  MatchPassword(this.password, this.retypePassword);
}

class CheckFullname {
  final String fullname;
  CheckFullname(this.fullname);
}