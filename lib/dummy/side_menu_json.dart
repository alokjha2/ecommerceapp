

import 'package:line_icons/line_icons.dart';
import 'package:uicommerce/pages/favourite.dart';
import 'package:uicommerce/pages/home_page.dart';
import 'package:uicommerce/pages/my_cart_page.dart';
import 'package:uicommerce/pages/order_page.dart';

List sideMenuItems = [
      {
        "label": "Home",
        "selected": true,
        "icon": LineIcons.home,
        "page": MyHomePage()
      },
      {
        "label": "My Cart",
        "selected": false,
        "icon": LineIcons.shoppingCart,
        "page": MyCartPage()
      },
      {
        "label": "Favourite",
        "selected": false,
        "icon": LineIcons.heart,
        "page": FavouritePage()
      },
      {
        "label": "Orders",
        "selected": false,
        "icon": LineIcons.history,
        "page": OrderPage()
      },
    ];