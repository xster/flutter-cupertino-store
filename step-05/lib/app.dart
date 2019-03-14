// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/cupertino.dart';
import 'product_list_tab.dart';
import 'search_tab.dart';
import 'shopping_cart_tab.dart';
import 'styles.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoApp(
        title: 'Cupertino Store',
        theme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            navLargeTitleTextStyle: Styles.headlineText,
          ),
        ),
        home: CupertinoStoreHomePage(),
        color: Styles.appBackground,
      );
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text('Products'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              title: Text('Cart'),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return ProductListTab();
            case 1:
              return SearchTab();
            case 2:
              return ShoppingCartTab();
            default:
              return Center(
                child: Text('Unexpected tab #$index'),
              );
          }
        },
      );
}