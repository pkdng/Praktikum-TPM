import 'base_network.dart';
import 'repos_model.dart';

class DataSource {
  static DataSource instance = DataSource();
  
  Future<Map<String, dynamic>> loadUser(String user) {
    return BaseNetwork.get("users/$user");
  }

  Future<List<ReposModel>> loadRepos(String user) {
    return BaseNetwork.getRepos("users/$user/repos");
  }
}