import 'package:flutter/material.dart';

class HayTracker extends StatefulWidget {
  @override
  _HayTrackerState createState() => _HayTrackerState();
}

class _HayTrackerState extends State<HayTracker> {
  final _hayKey = GlobalKey<FormState>();

  // Form values
  int? _selectedField;
  int? _selectedType;
  int? _selectedCrop;
  int? _baleAmount;

  // Will eventually get this from DB
  final List<Map<String, dynamic>> cropTypes = [
    {
      "id": 1,
      "name": 'Grass'
    },
    {
      "id": 2,
      "name": 'Alphalfa'
    },
    {
      "id": 3,
      "name": 'Grain Hay'
    }
  ];

  final List<Map<String, dynamic>> fields = [
    {
      "id": 1,
      "name": 'Grandpas Bottom 20'
    },
    {
      "id": 2,
      "name": '25 Acres'
    },
    {
      "id": 3,
      "name": 'Grandpas Top 20'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _hayKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (MediaQuery.of(context).size.height * .85),
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DropdownButtonFormField<int>(
                      value: _selectedField,
                      hint: Text('Select a Field'),
                      decoration: InputDecoration(
                        labelText: 'Field',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      items: fields.map<DropdownMenuItem<int>>((field) {
                        return DropdownMenuItem<int>(
                          value: field['id'],
                          child: Text(field['name']),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedField = newValue;
                        });
                      },
                    ),
                    DropdownButtonFormField(
                      value: _selectedType,
                      hint: Text('Select a Type'),
                      decoration: InputDecoration(
                        labelText: 'Crop Type',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      items: cropTypes.map<DropdownMenuItem<int>>((type) {
                        return DropdownMenuItem<int>(
                          value: type['id'],
                          child: Text(type['name']),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedType = newValue;
                        });
                      },
                    ),
                    FormField<int>(
                      builder: (FormFieldState<int> state) {
                        return Column(
                          children: List<Widget>.generate(4, (int index) {
                            int number = index + 1;
                            return RadioListTile<int>(
                              title: Text('$number crop'),
                              value: number,
                              groupValue: state.value,
                              onChanged: (int? value) {
                                state.didChange(value);
                                setState(() {
                                  _selectedCrop = value!;
                                });
                            });
                          },
                        ));
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Bale Amount',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid integer';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _baleAmount = int.tryParse(value!);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null, 
                            child: Text('Submit')
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}