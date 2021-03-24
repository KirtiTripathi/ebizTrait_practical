import 'package:ebiz_trait_test_flutter_app/job_list_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobList extends StatefulWidget {
  @override
  _JobListState createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  Map jobDetailsData = {};
  List getJobs = [];
  JobListApi _jobListApi = new JobListApi();

  jobListDetails() async {
    jobDetailsData = await _jobListApi.getJobDetails(UserId: 138);
    setState(() {
      print("JOB DETAILS ${jobDetailsData}");
      getJobs = jobDetailsData['Results']['GetAvailableJob'];
      print("${jobDetailsData['Results']['GetAvailableJob']}");
      print("List ${getJobs}");
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
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: getJobs.length,
              itemBuilder: (context, index) {
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                getJobs[index]["UserImage"] != null ||
                                        getJobs[index]["UserImage"] != ""
                                    ? Container(
                                        child: Image.network(
                                        "${getJobs[index]["UserImage"]}",
                                        height: 100,
                                      ))
                                    : Icon(
                                        Icons.account_circle,
                                        size: 50,
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${getJobs[index]["UserName"]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Job Title:",
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("${getJobs[index]["JobTitle"]}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "City:",
                                        style: TextStyle(
                                            color: Colors.blue[800],
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("${getJobs[index]["City"]}"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width /
                                            1.7,
                                        child: Text(
                                          "${getJobs[index]["JobDescription"]}",
                                          style: TextStyle(),
                                          softWrap: true,
                                          maxLines: 3,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(
                                      children: [
                                        Text("Salary: ",style: TextStyle(color:Colors.blue[800],fontWeight: FontWeight.w800),),
                                        Text("RS ${getJobs[index]["JobPrice"]}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(
                                      children: [
                                        if(getJobs[index]["Ratings"]==0)
                                          Row(
                                            children: [
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined)
                                            ],
                                          )
                                        else
                                          Row(
                                            children: [
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined),
                                              Icon(Icons.star_border_outlined)
                                            ],
                                          ),
                                        SizedBox(width: 5,),
                                        Text("${getJobs[index]["TotalReviewCount"]}"),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top:5.0),
                                    child: Row(
                                      children: [
                                        Text("Join: ",style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.w800),),
                                        Text("${getJobs[index]["NeedIt"]}",)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ));
              })),
    );
  }
}
