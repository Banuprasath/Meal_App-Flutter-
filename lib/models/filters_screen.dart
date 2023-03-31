import 'package:Meal_APP/models/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext Context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };

                widget.saveFilters(selectedFilters);
                var tot;
                if (_glutenFree == true &&
                    _lactoseFree == true &&
                    _vegetarian == true &&
                    _vegan == true) {
                  tot = "you have selected all the constraints ";
                } else if (_glutenFree == true ||
                    _lactoseFree == true ||
                    _vegetarian == true ||
                    _vegan == true) {
                  if (_glutenFree == true) {
                    tot = "You selected Gluteen";
                  }
                  if (_vegetarian == true) {
                    tot = "You selected Vegetarian";
                  }
                  if (_vegan == true) {
                    tot = "You selected Vegan";
                  }
                  if (_lactoseFree == true) {
                    tot = "You selected Lactose";
                  }
                } else {
                  tot = "Please apply filters and then click save button";
                }
                /* if (_glutenFree == true \\
                    _lactoseFree == true &&
                    _vegetarian == true &&
                    _vegan == true) {
                  tot = "you have selected all the constraints ";
                } else if (_glutenFree == true) {
                  tot = "You selected Gluteen";
                } else if (_lactoseFree == true) {
                  tot = "You selected Lactose";
                } else if (_vegetarian == true) {
                  tot = "You selected Vegetarian";
                } else if (_vegan == true) {
                  tot = "You selected Vegan";
                } else {
                  tot = "Please apply filters and then click save button";
                }*/
                Fluttertoast.showToast(
                    msg: tot.toString(),
                    //"You have updated constraints now check the meals page",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.pink,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust Your Selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    "Gluten-free",
                    "only include Gluten free meal",
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Click the Save button to save the changes ",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegetarian",
                    "only include vegetarian  free meal",
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Click the Save button to save the changes ",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );

                        _vegetarian = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegan",
                    "only include Vegan meal",
                    _vegan,
                    (newValue) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Click the Save button to save the changes ",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        _vegan = newValue;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    "Lactose-free",
                    "only include Lactose free meal",
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Click the Save button to save the changes ",
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
