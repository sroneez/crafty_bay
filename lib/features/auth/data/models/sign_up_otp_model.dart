class SignUpOtpModel{
  final String email;
  final String otp;
  SignUpOtpModel({required this.email, required this.otp});

  Map<String, dynamic> toJson(){
    return{
      'email': email,
      'otp' :otp,
    };
  }
}