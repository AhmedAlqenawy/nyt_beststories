import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nyt_beststories/components/widgets/widgets.dart';
import 'package:nyt_beststories/model/Article-model.dart';

class ArticleDetails extends StatelessWidget {
  final Article articl;
  ArticleDetails({@required this.articl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300.h,
              pinned: true,
              title: Text(
                "Article Details",
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.start,
              ),
              excludeHeaderSemantics: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Hero(
                    tag: "Article Details",
                    child: InteractiveViewer(
                      child: Image.network(
                        this.articl.multimedia[0]['url'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                  margin: EdgeInsets.only(left: 20.w, top: 20.h),
                  width: double.infinity,
                  child: Text(
                    this.articl.title,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )),

              Container(
                margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 15.h),
                width: double.infinity,
                child: Text(
                  this.articl.byline,
                  style: TextStyle(fontSize: 16.w, fontWeight: FontWeight.w300,),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 10.h),
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("created Date"),
                    Text(timeText(this.articl.createdDate)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 10.h),
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("published Date"),
                    Text(timeText(this.articl.publishedDate),),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 20.h),
                width: double.infinity,
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 20.w, fontWeight: FontWeight.w500),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 15.h),
                width: double.infinity,
                child: Text(
                  this.articl.abstract,
                  style: TextStyle(
                    fontSize: 16.w,color: Colors.grey,
                  ),
                ),
              ),
              //this size box only to show sliver bar
              SizedBox(
                height: 700,
              )
            ]))
          ],
        ),
      ),
    );
  }
}
