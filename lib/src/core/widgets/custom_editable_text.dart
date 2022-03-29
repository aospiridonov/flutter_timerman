import 'package:flutter/material.dart';

class CustomEditableText extends StatefulWidget {
  const CustomEditableText({
    Key? key,
    required this.labelText,
    this.text = '',
    this.hintText = '',
    this.isEdit = false,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final String text;
  final bool isEdit;

  @override
  State<CustomEditableText> createState() => CustomEditableTextState();
}

class CustomEditableTextState extends State<CustomEditableText> {
  bool _isEditable = true;

  TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isEditable = widget.isEdit;
    _controller.text = widget.text;

    _focusNode.addListener(() {
      print(_focusNode.hasFocus);
      if (!_focusNode.hasFocus) {
        setEditState(state: false);
        //FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String get text => _controller.text;
  String get labelText => widget.labelText;

  @override
  Widget build(BuildContext context) {
    return !_isEditable ? _buildText() : _buildTextEdit();
  }

  void setEditState({required bool state}) {
    setState(() {
      _isEditable = state;
      if (!_isEditable) {
        _focusNode.unfocus(); //is important
      }
    });
  }

  Widget _buildText() {
    return TextButton(
      onPressed: () => setEditState(state: true),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              labelText,
              softWrap: false,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextEdit() {
    return TextField(
      autofocus: true,
      controller: _controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.labelText, hintText: widget.hintText,
        border: InputBorder.none,
//        enabled: !_isLoading,
        //focusedBorder: InputBorder.none,
      ),
      autocorrect: false,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onChanged: (text) => _updateState(),
      onEditingComplete: () => setEditState(state: false),
      //onSubmitted: (value) => setEditState(state: false),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
