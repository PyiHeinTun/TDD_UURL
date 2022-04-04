import 'package:flutter/material.dart';
import 'package:flutter_tdd_uurl/core/constant/name.dart';
import 'package:flutter_tdd_uurl/features/extractAllUrl/presentation/bloc/extractallurl_bloc.dart';
import 'package:provider/provider.dart';

class TextAndButton extends StatefulWidget {
  const TextAndButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  State<TextAndButton> createState() => _TextAndButtonState();
}

String inputStr = '';

class _TextAndButtonState extends State<TextAndButton> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = widget.width;
    final height = widget.height;

    return Column(
      children: [
        SizedBox(
          width: width,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input a URL',
            ),
            onChanged: (value) {
              inputStr = value;
            },
            onSubmitted: (value) => dispatchExtractUrl(inputStr),
          ),
        ),
        SizedBox(
          height: 0.1 * height,
        ),
        //Button
        Container(
          width: width,
          height: height / 8,
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.secondary),
            ),
            child: const Text(SEARCH_BTN),
            onPressed: () => dispatchExtractUrl(inputStr),
          ),
        ),
      ],
    );
  }

  void dispatchExtractUrl(String url) {
    Provider.of<ExtractallurlBloc>(context, listen: false)
        .add(ExtractallurlEvent(url: url));
  }
}
