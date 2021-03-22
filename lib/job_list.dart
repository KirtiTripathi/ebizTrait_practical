import 'package:ebiz_trait_test_flutter_app/job_list_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  List<dynamic> jobDetails = [];
  JobListApi _jobListApi = new JobListApi();

  jobListDetails() async {
   jobDetails = await _jobListApi.getJobDetails(UserId: 138);
   setState(() {
     print("JOB DETAILS $jobDetails");
     //print("${jobDetails[1]['GetAvailableJob']}");
   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobListDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOBS"),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        child:ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
            itemBuilder: (context,index){
          return Card(

            child:Column(
              children: [
                Row(
                  children: [
                    Text("Job Title"),
                    // Text("${jobDetails[index]["JobTitle"]}")
                  ],
                )

              ],
            )
          );
        })
      ),
    );
  }
}
