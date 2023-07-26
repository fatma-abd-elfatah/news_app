import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Data/Cubits/cubit/news_app_cubit.dart';

class NewsDetailScreen extends StatelessWidget {
  int index;
  NewsDetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                color: Color(0xffFF3A44),
                borderRadius: BorderRadius.circular(50)),
            child: SvgPicture.asset("assets/heart.svg"),
          ),
        ),
        body: BlocBuilder<NewsAppCubit, NewsAppState>(
          builder: (context, state) {
            if (state is NewsAppSucsess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 400 / 815,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(state
                                  .ourResponse.articles![index].urlToImage!),
                              fit: BoxFit.cover)),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 438 / 815,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24))),
                        child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      88 /
                                      438,
                                ),
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.ourResponse.articles![index]
                                            .content!,
                                        style: GoogleFonts.nunito(
                                          color: Color(0xFF2E0505),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              height: MediaQuery.of(context).size.height *
                                  180 /
                                  815,
                              width:
                                  MediaQuery.of(context).size.width * 311 / 375,
                              decoration: BoxDecoration(
                                  color: Color(0x80F5F5F5),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.ourResponse.articles![index]
                                        .publishedAt!,
                                    style: GoogleFonts.nunito(
                                      color: Color(0xFF2E0505),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    state.ourResponse.articles![index].title!,
                                    style: GoogleFonts.dmSerifDisplay(
                                      color: Color(0xFF2E0505),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    state.ourResponse.articles![index].author!,
                                    style: GoogleFonts.nunito(
                                      color: Color(0xFF2E0505),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.only(start: 15, top: 19),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                              child: Container(
                                //padding: EdgeInsets.all(12),
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0x80F5F5F5)),
                                child: SvgPicture.asset("assets/back.svg"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
