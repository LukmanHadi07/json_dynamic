import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DynamicWidgets extends StatefulWidget {
  const DynamicWidgets({super.key});

  @override
  State<DynamicWidgets> createState() => _DynamicWidgetsState();
}

bool _isCircle = false;

class _DynamicWidgetsState extends State<DynamicWidgets> {
  double radiusValue = 130;
  double translationX = 0.0;

  simplePrintMessage() {
    setState(() {
      _isCircle = !_isCircle;
      print(_isCircle);
      if (_isCircle) {
        radiusValue = 100;
        translationX = -185.0;
      } else {
        radiusValue = 0;
        translationX = 0.0;
      }
    });
  }

  var registry = JsonWidgetRegistry.instance;

  @override
  Widget build(BuildContext context) {
    Map dataWidgets = {
      "type": "scaffold",
      "args": {
        "body": {
          "type": "center",
          "args": {
            "child": {
              "type": "list_view",
              "args": {
                "children": [
                  {
                    "type": "center",
                    "args": {
                      "child": {
                        "type": "padding",
                        "args": {
                          "padding": {
                            "top": 25,
                            "bottom": 10,
                            "left": 10,
                            "right": 10
                          },
                          "child": {
                            "type": "row",
                            "args": {
                              "mainAxisAlignment": "center",
                              "children": [
                                {
                                  "type": "sized_box",
                                  "args": {
                                    "width": 10,
                                  }
                                },
                                {
                                  "type": "animated_container",
                                  "curve": "Curves.easeInOut",
                                  "args": {
                                    "duration": 1000,
                                    "transform": {
                                      "type": "matrix_4",
                                      "values": [
                                        translationX,
                                        0,
                                        -1,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        1,
                                        0,
                                        0,
                                        0,
                                        0,
                                        1
                                      ]
                                    },
                                    "width": 150,
                                    "height": 150,
                                    "decoration": {
                                      "color": "#68D2E8",
                                      "borderRadius": {
                                        "type": "circular",
                                        "radius": radiusValue
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "sized_box",
                                  "args": {"width": 10}
                                },
                                {
                                  "type": "animated_container",
                                  "args": {
                                    "curve": "Curves.easeInOut",
                                    "duration": 1000,
                                    "width": 150,
                                    "height": 150,
                                    "decoration": {
                                      "color": "#FF76CE",
                                      "borderRadius": {
                                        "type": "circular",
                                        "radius": radiusValue
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "sized_box",
                                  "args": {"width": 10}
                                },
                                {
                                  "type": "animated_container",
                                  "args": {
                                    "curve": "Curves.easeInOut",
                                    "duration": 1000,
                                    "width": 150,
                                    "height": 150,
                                    "decoration": {
                                      "color": "#FDDE55",
                                      "borderRadius": {
                                        "type": "circular",
                                        "radius": radiusValue
                                      }
                                    }
                                  }
                                },
                                {
                                  "type": "sized_box",
                                  "args": {"width": 10}
                                }
                              ]
                            }
                          }
                        }
                      }
                    }
                  },
                  {
                    "type": "center",
                    "args": {
                      "child": {
                        "type": "text",
                        "args": {
                          "text": "Auto Animate",
                          "style": {
                            "color": "#1E0342",
                            "fontSize": 25,
                            "fontWeight": "bold"
                          }
                        },
                      }
                    }
                  },
                ]
              }
            }
          }
        },
        "floatingActionButton": {
          "type": "floating_action_button",
          "args": {
            "onPressed": () => simplePrintMessage(),
            "child": {
              "type": "icon",
              "args": {
                "icon": {"codePoint": 0xe41d, "fontFamily": "MaterialIcons"},
                "size": 50
              }
            }
          }
        }
      }
    };

    var widget = JsonWidgetData.fromDynamic(dataWidgets, registry: registry);
    return widget.build(context: context);
  }
}
