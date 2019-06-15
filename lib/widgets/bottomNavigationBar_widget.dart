import 'package:flutter/material.dart';

//@Author Ismael Alves
class BottomNavigationBarWidget extends StatefulWidget {

  final PageController pageController;

  final ScrollController scrollController;

  final int page;

  BottomNavigationBarWidget({@required this.pageController, this.scrollController, @required this.page});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState(this.pageController, this.scrollController, this.page);
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {

  final PageController pageController;

  final ScrollController scrollController;

  final int page;

  @override
  void initState() {
    super.initState();
  }

  _BottomNavigationBarWidgetState([ this.pageController, this.scrollController, this.page]);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Tooltip(
              message: "Lista de Mesas",
              child: RaisedButton(
                onPressed: () {
                  pageController.jumpToPage(0);
                  // ignore: invalid_use_of_protected_member
                  if(scrollController != null && scrollController.positions.isNotEmpty){
                    scrollController.animateTo(
                      0.0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                },
                elevation: 0.0,
                color: Colors.red,
                child:  Icon(
                  Icons.assignment,
                  color: page == 0 ? Colors.black : Colors.white,
                ),
              ),
            )
          ),
          Expanded(
            child: Tooltip(
              message: "Chat",
              child: Stack(
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      pageController.jumpToPage(1);
                      // ignore: invalid_use_of_protected_member
                      if(scrollController != null && scrollController.positions.isNotEmpty){
                        scrollController.animateTo(
                          0.0,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    },
                    elevation: 0.0,
                    color: Colors.red,
                    splashColor: Colors.white,
                    disabledColor: Colors.black,
                    child: Icon(Icons.chat,
                      color: page == 1 ? Colors.black : Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 25.0,
                    top: 5.0,
                    child: CircleAvatar(
                      backgroundColor: page == 1 ? Colors.white : Colors.black,
                      radius: 10.0,
                      child: Text("100",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10.0,
                          color: page == 1 ? Colors.black : Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Tooltip(
              message: "Meus Pedidos",
              child: RaisedButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                  // ignore: invalid_use_of_protected_member
                  if(scrollController != null && scrollController.positions.isNotEmpty){
                    scrollController.animateTo(
                      0.0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                },
                elevation: 0.0,
                color: Colors.red,
                splashColor: Colors.white,
                disabledColor: Colors.black,
                child: Icon(
                  Icons.library_books,
                  color: page == 2 ? Colors.black : Colors.white,
                ),
              ),
            )
          ),
          Expanded(
            child: Tooltip(
              message: "Meu Perfil",
              child: RaisedButton(
                onPressed: () {
                  pageController.jumpToPage(3);
                  // ignore: invalid_use_of_protected_member
                  if(scrollController != null && scrollController.positions.isNotEmpty){
                    scrollController.animateTo(
                      0.0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                },
                elevation: 0.0,
                color: Colors.red,
                splashColor: Colors.white,
                disabledColor: Colors.black,
                child: Icon(
                  Icons.person_pin_circle,
                  color: page == 3 ? Colors.black : Colors.white,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
