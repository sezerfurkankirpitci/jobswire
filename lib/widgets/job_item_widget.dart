import 'package:flutter/material.dart';
import 'package:jobswire/widgets/job_tag_item.dart';

class JobItemWidget extends StatelessWidget {
  final String logo;
  final String position;
  final String location;
  final String date;
  final List<dynamic> tags;
  final String description;

  JobItemWidget(
    this.logo,
    this.position,
    this.location,
    this.date,
    this.tags,
    this.description,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      child: Card(
        color: Color(0xffffb60e),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(child: Image.network(logo),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 4, 4, 2),
                        child: Text(
                          position,
                          style: TextStyle(color: Colors.red,
                              fontSize: 19, fontStyle: FontStyle.italic),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(location,style: TextStyle(color: Colors.white),),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                date,
                                style: TextStyle(color: Colors.lightBlue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(4, 2, 4, 4),
                        height: 25,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return JobTagItem(tags[index]);
                          },
                          itemCount: tags.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
