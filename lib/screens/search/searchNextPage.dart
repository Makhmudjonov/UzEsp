import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uzesp/base/bolim.dart';
import 'package:uzesp/core/constants/const_color.dart';
import 'package:uzesp/core/constants/padding/padding_comp.dart';
import 'package:uzesp/core/widgets/home_app_bar/home_app_bar.dart';
import 'package:uzesp/provider/search_provider.dart';
import '../../core/components/size_konfig.dart';

class SearchNextPage extends StatefulWidget {
  var index;
  SearchNextPage({Key? key, this.index}) : super(key: key);

  @override
  State<SearchNextPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SearchNextPage> {
  @override
  Widget build(BuildContext context) {
     var order = context.watch<SearchProvider>().order.toList();
    var bolims = context.watch<SearchProvider>().bolimSearch.toList();
    SizeConfig().init(context);
    return Scaffold(
      appBar: HomeAppBar(
        title: order[widget.index].toString(),
        leftIcon:
            Icon(Icons.arrow_back_ios_rounded, color: ConstColor.whiteColor),
        rightIcon: Icon(Icons.share, color: ConstColor.whiteColor),
        righ2tIcon: Icon(Icons.search, color: ConstColor.whiteColor),
        right2Ontap: () => Navigator.pushNamed(context, "/search"),
        leftOntap: () => Navigator.pushNamed(context, "/home"),
      ).getBar(context),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: he(10)),
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((_, __) {
          return FadeInUp(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: wi(20), vertical: he(10)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    color: ConstColor.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MyPadddings.pdSymetric(
                    horizontal: wi(20),
                    vertical: he(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bolims[widget.index!][__]["uz"],
                          style: TextStyle(
                              fontFamily: "balo",
                              fontSize: he(20),
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: ConstColor.blackColor,
                        ),
                        Text(
                          bolims[widget.index!][__]["esp"],
                          style: TextStyle(
                            fontFamily: "balo",
                            fontSize: he(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: wi(30),
                  top: he(20),
                  child: CircleAvatar(
                    backgroundColor: ConstColor.siyohColor.withOpacity(0.2),
                    child: IconButton(
                      splashRadius: 1,
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: ConstColor.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        itemCount: bolim1[widget.index].length,
      ),
    );
  }
}
