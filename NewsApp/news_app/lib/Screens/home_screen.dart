import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../Data/Cubits/cubit/news_app_cubit.dart';
import 'newsdetail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    iconColor: Color(0xff818181),
                    hintText: "Dogecoin to the Moon...",
                    hintStyle: GoogleFonts.nunito(
                      color: Color.fromARGB(255, 211, 210, 210),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(16, 8, 28.18, 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffF0F1FA)),
                    ),
                  ))),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 45,
                    width: 44,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 58, 68, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: SvgPicture.asset("assets/notification.svg"),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<NewsAppCubit>().getAllNew();
                },
                child: Text("Get News")),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    "Latest News",
                    style: GoogleFonts.dmSerifDisplay(
                      color: Color(0xFF000000),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    child: Text(
                      "See All",
                      style: GoogleFonts.nunito(
                        color: Color(0xFF0080FF),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset("assets/arrow.svg")
                ],
              ),
            ),
            Expanded(child: BlocBuilder<NewsAppCubit, NewsAppState>(
              builder: (context, state) {
                if (state is NewsAppInitial) {
                  return Center(child: Text("press to get news"));
                } else if (state is NewsAppLoding) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NewsAppSucsess) {
                  return ListView.builder(
                    itemCount: state.ourResponse.articles?.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        context.read<NewsAppCubit>().getAllNew();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailScreen(index: index)),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 240 / 812,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(state
                                  .ourResponse.articles![index].urlToImage!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),
                              Text(
                                state.ourResponse.articles![index].author!,
                                style: GoogleFonts.nunito(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                state.ourResponse.articles![index].title!,
                                style: GoogleFonts.dmSerifDisplay(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                state.ourResponse.articles![index].description!,
                                style: GoogleFonts.nunito(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                } else {
                  return Center();
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
