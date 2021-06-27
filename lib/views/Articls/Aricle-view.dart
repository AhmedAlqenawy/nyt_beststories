import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt_beststories/components/widgets/widgets.dart';

import '../show-article-details/show-details.dart';
import 'Aricle view-model.dart';

 class ArticlePage extends StatelessWidget {
  ArticlePage();

  bool called = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: myAppBar('NYT best Stories'),
      body: SafeArea(
        child: Consumer(
          builder: (ctx, watch, widget) {
            final coachesResponse = watch(ArticleProvider.articlesProvider).state;
             if (called == false) {
              called = true;
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ArticleProvider().fetchArticlesList(context);
              });
            }
            return coachesResponse == null
                ? spinKit(context)
                : ListView.builder(
                    itemCount: coachesResponse.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetails(articl: coachesResponse[index],)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        margin: EdgeInsets.only(top:20.h,right: 10.w,left: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 0.99.sw,
                              height: 0.20.sh,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      coachesResponse[index].multimedia[0]
                                          ['url'],
                                    ),
                                    fit: BoxFit.cover),
                                //    boxShadow: [myBoxShadow]
                              ),
                              //child: Icon(Icons.book,color: Color(0xFFFF4F7D),),
                            ),
                            Container(color: Colors.black,height: 1.h,margin: EdgeInsets.only(bottom: 2.h,top: 4.h),),
                            Container(color: Colors.black,height: 1.h,width: double.infinity,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 250.w,
                                      height: 100.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         Text("Article title ",style: TextStyle(
                                             fontSize: 20.w,
                                             fontWeight: FontWeight.w500
                                         ),),
                                          Text(
                                           coachesResponse[index].title,style: TextStyle(
                                              fontSize: 10.sp
                                              ,color: Colors.grey
                                          ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 250.w,
                                      height: 100.h,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Article abstract ",style: TextStyle(
                                              fontSize: 20.w,
                                              fontWeight: FontWeight.w500
                                      ),),
                                          Text(
                                            coachesResponse[index].abstract,style: TextStyle(
                                              fontSize: 10.sp,color: Colors.grey
                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 100.h,
                                      width: 100.w,

                                      child: Column(
                                        children: [
                                          Text("published Date "+timeText(coachesResponse[index].publishedDate),style: TextStyle(
                                              fontSize: 13.sp
                                          ),),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 100.h,
                                      width: 100.w,
                                      child: Text("created Date "+timeText(coachesResponse[index].createdDate),style: TextStyle(
                                          fontSize: 13.sp
                                      ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
