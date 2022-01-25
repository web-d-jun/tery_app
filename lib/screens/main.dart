import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tery_app/screens/store.dart';
import 'package:tery_app/screens/coupon.dart';
import 'package:tery_app/screens/liked.dart';
import 'package:tery_app/screens/cart_view.dart';
import 'package:tery_app/screens/my_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _children = [
    StoreView(),
    LikedView(),
    CouponView(),
    CartView(),
    MyView()
  ];
  int _currentIndex = 0;
  void _onTap(int index) {
    setState(() => {_currentIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/tery_logo.svg'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xffEA4E83),
                Color(0xffFF8A6A),
              ],
            ),
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 14),
        onTap: _onTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: '매장보기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '좋아요',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            label: '쿠폰',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: '장바구니',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
