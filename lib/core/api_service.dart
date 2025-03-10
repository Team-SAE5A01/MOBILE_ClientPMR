import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://35.180.230.63:4500/api';


Future<bool> checkApiConnection() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users/'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
  // Fetch all users
  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users/'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Login user
  Future<dynamic> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'mot_de_passe': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // Register a new user
  Future<dynamic> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  // Retrieve a user by email
  Future<dynamic> getUserByEmail(String email) async {
    final response = await http.get(Uri.parse('$baseUrl/users/email/$email'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to retrieve user');
    }
  }

  // Update user details
  Future<dynamic> updateUser(int userId, Map<String, dynamic> userData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

  // Delete a user
  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
