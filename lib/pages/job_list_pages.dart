import 'package:flutter/material.dart';
import 'package:jobswire/modals/job_class.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jobswire/modals/time_ago.dart';
import 'package:jobswire/widgets/job_item_widget.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  @override
  Future getJobData() async {
    print('Başladı');
    var response = await http.get(Uri.https('remoteOK.io', 'api'));
    var jsonData = jsonDecode(response.body);
    List<Job> jobs = [];
    if (response.statusCode == 200) {
      for (var j in jsonData) {
        if (j["position"] != null &&
            j["logo"] != null &&
            j["tags"] != null &&
            j["location"] != null &&
            j["date"] != null &&
            j["description"] != null) {
          Job job = Job(j["logo"], j["position"], j["location"], j["date"],
              j["tags"], j["description"]);
          jobs.add(job);
        }
      }
      print(jobs.length);
      return jobs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.fill,
              )),
              height: 100,
            ),
            Expanded(
              child: FutureBuilder(
                future: getJobData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return JobItemWidget(
                              snapshot.data[index].logo,
                              snapshot.data[index].position,
                              snapshot.data[index].location,
                              TimeAgo.timeAgoSinceDate(
                                      snapshot.data[index].date)
                                  .toString(),
                              snapshot.data[index].tags,
                              snapshot.data[index].description);
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*

,*/
