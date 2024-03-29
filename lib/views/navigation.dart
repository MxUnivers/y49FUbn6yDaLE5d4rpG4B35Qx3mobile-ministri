  import 'package:flutter/cupertino.dart';
import  "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:torismo/style/style.dart';
import 'package:torismo/views/evennement/eventList.dart';
import 'package:torismo/views/profile/profilePage.dart';
import 'package:torismo/views/temoignages/temoignageList.dart';
  import 'package:torismo/views/bookmark/bookmarck.dart';
  import 'package:torismo/component/DrawerLayout.dart';
import 'home/home.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  late PageController _pageController ;
  int pageIndex = 0 ;

  @override
  void  initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void  dispose(){
    _pageController.dispose();
    super.dispose();
  }

  onPagechanged(int pageIndex){
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex){
    _pageController.animateToPage(pageIndex, duration: Duration(microseconds: 300), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
                icon: Icon(Icons.menu_rounded) ,
                color : blackColor
            ),
            title: Text("app-mobile-ministry" ,  style: GoogleFonts.nunito(fontSize: 20,fontWeight: FontWeight.w700, color: Colors.blueGrey[700])),
            centerTitle: true,
            actions: [
              Padding(padding: const  EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  backgroundImage: const  AssetImage("assets/lac.jpeg"),
                ),
              )
            ],
            /*bottom: TabBar(
              indicatorColor: primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: primaryColor,
              unselectedLabelColor: blackLightColor,
              tabs: [
                Tab(
                  child: Text("Popular" ,  style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.bold
                  ),),
                ),

                Tab(
                  child: Text("Most Visited" ,  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.bold
                  ),),
                ),
                Tab(
                  child: Text("Europe " ,  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.bold
                  ),),
                ),
                Tab(
                  child: Text("Europe " ,  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),

             */
          ),
          drawer: MyDrawerLayout(),
          body: PageView(
            scrollDirection: Axis.vertical,
            reverse: true,
            allowImplicitScrolling: true,
            scrollBehavior: ScrollBehavior(),
            controller: _pageController,
            onPageChanged: onPagechanged,
            physics: NeverScrollableScrollPhysics(),
            children: [
               HomePage(),
              VideoListPage(),
              EventListPage(),
              BookmarkPage(),
              ProfilePage()
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 1,vertical: 1),
            child: Container(
              decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0,3)
                    )
                  ],
                  borderRadius: BorderRadius.circular(1)
              ),
              child: Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 5,vertical: 8),
                child: CupertinoTabBar(
                  border: Border(
                      top:BorderSide(
                          color: whiteColor
                      )
                  ),
                  backgroundColor: whiteColor,
                  currentIndex: pageIndex,
                  onTap: onTap,
                  activeColor: greenColors,
                  items: const [
                    BottomNavigationBarItem(label: "accueil",icon: Icon(Icons.home_outlined,size:20),),
                    BottomNavigationBarItem( label:"témoignages", icon: Icon(Icons.group, size: 20,)),
                    BottomNavigationBarItem(label:"evenements",icon: Icon(Icons.calendar_month_outlined, size: 20,)),
                    BottomNavigationBarItem(label:"bookmark",icon: Icon(Icons.bookmark_outline, size: 20,)),
                    BottomNavigationBarItem(label:"progile",icon: Icon(Icons.person_outline, size: 20,)),
                  ],
                ),
              ),
            ),

           ),
        )
      ],
    ));
  }
}
