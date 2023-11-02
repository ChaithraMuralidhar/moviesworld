// Will contain Auth API Call logic

class UserAuthenticationRepo {

  Future<Map<String, dynamic>> logInWithEmailAndPassword({required String email, required String password}) async {
    //API Call and return JSON Map
    return new Map();
  }

  Future<Map<String, dynamic>> signUp({required String email, required String password}) async {
    //API Call and return JSON Map
    return new Map();
  }

  Future<Map<String, dynamic>> updateAuthToken({required String refreshToken}) async {
    //API Call and return JSON Map
    return new Map();
  }

}