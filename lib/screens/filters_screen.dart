import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {bool filter, String title, String subtitle, Function updateValue}) {
    return SwitchListTile(
      value: filter,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  filter: _glutenFree,
                  title: "Gluten-free",
                  subtitle: "Only include gluten-free meals.",
                  updateValue: ((newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  filter: _lactoseFree,
                  title: "Lactose-free",
                  subtitle: "Only include lactose-free meals.",
                  updateValue: ((newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  filter: _vegetarian,
                  title: "Vegetarian",
                  subtitle: "Only include vegetarian meals",
                  updateValue: ((newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                ),
                _buildSwitchListTile(
                  filter: _vegan,
                  title: "Vegan",
                  subtitle: "Only include vegan meals.",
                  updateValue: ((newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ),
              ],
            )),
          ],
        ));
  }
}
