import 'package:flutter/material.dart';

import 'data_source.dart';
import 'repos_model.dart';

class ReposPage extends StatefulWidget {
  const ReposPage({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  State<ReposPage> createState() => _ReposPageState();
}

class _ReposPageState extends State<ReposPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "Repositories"
        ),
        centerTitle: true,
      ),
      body: FutureBuilder <List<ReposModel>>(
        future: DataSource.instance.loadRepos(widget.username),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } if (snapshot.hasData) {
            List<ReposModel>? reposModel = snapshot.data;
            if (snapshot.data!.isNotEmpty) {
              return _buildSuccessSection(reposModel);
            } else {
              return Center(
                child: Column(children: const [
                  SizedBox(height: 50),
                  Text("belum ada repository"),
                ]),
              );
            }
            // return _buildSuccessSection(reposModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return const Center(child: Text("Error"));
  }

  Widget _buildSuccessSection(List<ReposModel>? data) {
    return ListView.builder(
        itemCount: data!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildReposList(
              data[index].name
          );
        }
    );
  }

  Widget _buildReposList(String? name) {
    return Card(
      child: ListTile(
        title: Text(name!),
        onTap: (){},
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
