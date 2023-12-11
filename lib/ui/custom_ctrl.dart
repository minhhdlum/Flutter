import 'package:connection/models/place.dart';
import 'package:flutter/material.dart';

import '../models/class.dart';
import '../models/profile.dart';
import 'AppConstant.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    super.key,
    required this.textButton,
  });

  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Text(
          textButton,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController textController,
    required this.hintText,
    required this.obscureText,
  }) : _textController = textController;

  final TextEditingController _textController;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: _textController,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.favorite,
        size: 150, color: Color.fromARGB(255, 230, 6, 80));
  }
}

class CustomSpinner extends StatelessWidget {
  const CustomSpinner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.deepPurple.withOpacity(0.5),
      child: const Center(
        child: Image(
          width: 50,
          image: AssetImage('assets/images/spiner.gif'),
        ),
      ),
    );
  }
}

class CustomAvatar1 extends StatelessWidget {
  const CustomAvatar1({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.height * 0.25),
      child: SizedBox(
          width: 100, height: 100, child: Image.network(Profile().user.avatar)),
    );
  }
}

class CustomInputTextFormField extends StatefulWidget {
  const CustomInputTextFormField({
    super.key,
    required this.width,
    required this.title,
    required this.value,
    required this.callback,
    this.type = TextInputType.text,
  });

  final double width;
  final String title;
  final String value;
  final TextInputType type;
  final Function(String output) callback;

  @override
  State<CustomInputTextFormField> createState() =>
      _CustomInputTextFormFieldState();
}

class _CustomInputTextFormFieldState extends State<CustomInputTextFormField> {
  int status = 0;
  String output = "";

  @override
  void initState() {
    output = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppConstant.textbody,
          ),
          status == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Text(
                    widget.value == "" ? "Không có" : widget.value,
                    style: AppConstant.textbodyfocus,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200]),
                      width: widget.width - 50,
                      child: TextFormField(
                        keyboardType: widget.type,
                        onChanged: (value) {
                          setState(() {
                            output = value;
                            widget.callback(output);
                          });
                        },
                        decoration: const InputDecoration(border: InputBorder.none),
                        initialValue: output,
                        style: AppConstant.textbodyfocus,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = 0;
                          widget.callback(output);
                        });
                      },
                      child: const Icon(
                        Icons.save,
                        size: 30,
                      ),
                    )
                  ],
                ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}

class CustomInputDropDown extends StatefulWidget {
  const CustomInputDropDown({
    super.key,
    required this.width,
    required this.title,
    required this.valueId,
    required this.callback,
    required this.list,
    required this.valuename,
  });

  final double width;
  final String title;
  final int valueId;
  final String valuename;
  final List<Lop> list;
  final Function(int outputId, String outputName) callback;
  @override
  State<CustomInputDropDown> createState() => _CustomInputDropDownState();
}

class _CustomInputDropDownState extends State<CustomInputDropDown> {
  int status = 0;
  int outputId = 0;
  String outputName = "";

  @override
  void initState() {
    // TODO: implement initState
    outputId = widget.valueId;
    outputName = widget.valuename;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppConstant.textbody,
        ),
        status == 0
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    status = 1;
                  });
                },
                child: Text(outputName == "" ? "Không có" : outputName,
                    style: AppConstant.textbodyfocus),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200]),
                width: widget.width,
                child: DropdownButton(
                  value: outputId,
                  items: widget.list
                      .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Container(
                              width: widget.width * 0.8,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Text(
                                e.ten,
                                overflow: TextOverflow.ellipsis,
                              ))))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      outputId = value!;
                      for (var dropitem in widget.list) {
                        if (dropitem.id == outputId) {
                          outputName = dropitem.ten;
                          widget.callback(outputId, outputName);
                          break;
                        }
                      }
                      status = 0;
                    });
                  },
                )),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}

class CustomPlaceDropDown extends StatefulWidget {
  const CustomPlaceDropDown({
    super.key,
    required this.width,
    required this.title,
    required this.valueId,
    required this.callback,
    required this.list,
    required this.valuename,
  });

  final double width;
  final String title;
  final int valueId;
  final String valuename;
  final List<Place> list;
  final Function(int outputId, String outputName) callback;
  @override
  State<CustomPlaceDropDown> createState() => CustomPlaceDropDownState();
}

class CustomPlaceDropDownState extends State<CustomPlaceDropDown> {
  int status = 0;
  int outputId = 0;
  String outputName = "";

  @override
  void initState() {
    // TODO: implement initState
    outputId = widget.valueId;
    outputName = widget.valuename;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppConstant.textbody,
          ),
          status == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      status = 1;
                    });
                  },
                  child: Text(
                      widget.valuename == "" ? "Không có" : widget.valuename,
                      style: AppConstant.textbodyfocus),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 165, 162, 162)),
                  width: (widget.width),
                  child: DropdownButton(
                    value: widget.valueId,
                    items: widget.list
                        .map((e) => DropdownMenuItem(
                            value: e.id,
                            child: Container(
                                width: (widget.width - 50),
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                child: Text(
                                  e.name,
                                  overflow: TextOverflow.ellipsis,
                                ))))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        outputId = value!;
                        for (var dropitem in widget.list) {
                          if (dropitem.id == outputId) {
                            outputName = dropitem.name;
                            widget.callback(outputId, outputName);
                            break;
                          }
                        }
                        status = 0;
                      });
                    },
                  )),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
