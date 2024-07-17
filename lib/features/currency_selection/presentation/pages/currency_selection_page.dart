import 'package:flutter/material.dart';
import '../../../../config/constants.dart';
import '../../../../config/fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dashboard/model/contry_model.dart';

class CurrencySelectionPage extends StatefulWidget {
  static const routeName = '/currency_selection_page';
  const CurrencySelectionPage({super.key});

  @override
  State<CurrencySelectionPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<CurrencySelectionPage> {
  List<Country> filteredCountryList = List.from(countryList);
  TextEditingController searchController = TextEditingController();
  Set<int> selectedItems = Set<int>();

  @override
  void initState() {
    super.initState();
    _loadSelectedItems();
  }

  void filterSearchResults(String query) {
    List<Country> dummySearchList = [];
    dummySearchList.addAll(countryList);
    if (query.isNotEmpty) {
      List<Country> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredCountryList.clear();
        filteredCountryList.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        filteredCountryList.clear();
        filteredCountryList.addAll(countryList);
      });
    }
  }

  Future<void> _loadSelectedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedItems = prefs.getStringList('selectedItems');
    if (savedItems != null) {
      setState(() {
        selectedItems = savedItems.map((e) => int.parse(e)).toSet();
      });
    }
  }

  Future<void> _saveSelectedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemsToSave = selectedItems.map((e) => e.toString()).toList();
    await prefs.setStringList('selectedItems', itemsToSave);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Choose Currency",
          style: AppFonts.styleWithGilroyMediumText(
              color: Theme.of(context).colorScheme.onBackground,
              fSize: FontSizeValue.fontSize16),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: searchController,
                style: AppFonts.styleWithGilroyMediumText(
                    color: Theme.of(context).colorScheme.onBackground,
                    fSize: FontSizeValue.fontSize16),
                onChanged: filterSearchResults,
                decoration: InputDecoration(
                  hintStyle: AppFonts.styleWithGilroyMediumText(
                      color: Theme.of(context).colorScheme.onBackground,
                      fSize: FontSizeValue.fontSize16),
                  labelStyle: AppFonts.styleWithGilroyMediumText(
                      color: Theme.of(context).colorScheme.onBackground,
                      fSize: FontSizeValue.fontSize16),
                  labelText: "Search",
                  hintText: "Search Currency",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: filteredCountryList.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                    endIndent: 30,
                    indent: 20,
                  );
                },
                itemBuilder: (context, index) {
                  String countryCode = filteredCountryList[index].iso3Code!;
                  String countryName = filteredCountryList[index].name!;
                  bool isSelected = selectedItems.contains(index);

                  return ListTile(
                    onTap: () {
                      Get.back(result: filteredCountryList[index]);
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countryCode,
                          style: AppFonts.styleWithGilroyMediumText(
                              color: Theme.of(context).colorScheme.onBackground,
                              fSize: FontSizeValue.fontSize16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            countryName,
                            style: AppFonts.styleWithGilroyMediumText(
                                color: Theme.of(context).colorScheme.onBackground,
                                fSize: FontSizeValue.fontSize16),
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        isSelected ? Icons.star : Icons.star_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isSelected) {
                            selectedItems.remove(index);
                          } else {
                            selectedItems.add(index);
                          }
                          _saveSelectedItems();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
