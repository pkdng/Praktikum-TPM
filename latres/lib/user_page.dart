import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latres/user_model.dart';

import 'data_source.dart';
import 'repos_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Icon(
            FontAwesomeIcons.github,
            size: 40,
            color: Colors.white
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DataSource.instance.loadUser(widget.username),
        builder: ( BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          } if (snapshot.hasData) {
            UserModel userModel = UserModel.fromJson(snapshot.data);
            if (userModel.id == null) {
              return const Center(child: Text("user not found"));
            } else {
              return _buildSuccessSection(userModel);
            }
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return const Center(child: Text("Error"));
  }

  Widget _buildSuccessSection(UserModel data) {
    // return Text("${data.name}");
    return (
      Center (
        child: Column(
          children: [
            SizedBox(height: 100.0),
            CircleAvatar(
              minRadius: 60.0,
              backgroundColor: Colors.black26,
              child: CircleAvatar(
                radius: 55.0,
                backgroundImage: NetworkImage('${data.avatarUrl}'),
              ),
            ),
            data.name != null
              ? _buildTextName('${data.name}')
              : _buildTextName('${data.login}'),
            _buildUsername('${data.login}'),
            _buildDetailButton('Followers',data.followers,'${data.login}'),
            _buildDetailButton('Following',data.following,'${data.login}'),
            _buildDetailButton('Repositories',data.publicRepos,'${data.login}')
          ],
        )
      )
    );
  }

  Widget _buildUsername(String username) {
    return (
        Padding(padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Text(
            username,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey
            ),
          ),
        )
    );
  }

  Widget _buildTextName(String name) {
    return (
        Padding(padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
    );
  }

  Widget _buildDetailButton(String title, int? sub, String username) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54
        ),
        borderRadius: const BorderRadius.all(Radius.circular(50))
      ),
      child: ListTile(
          title: Text("$title ($sub)"),
          // subtitle: Padding(
          //   padding: const EdgeInsets.only(top: 2.0),
          //   child: Text("${sub}"),
          // ),
          trailing: const Icon(
            FontAwesomeIcons.circleChevronRight,
            color: Colors.black54
          ),
          hoverColor: Colors.transparent,
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    if(title == "Repositories") return ReposPage(username: username);
                    else if(title == "Followers") return ReposPage(username: username);
                    else return ReposPage(username: username);
                  }
                )
            );
          }
      )
    );
  }
}
