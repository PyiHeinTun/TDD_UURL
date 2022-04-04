import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constant/name.dart';
import 'core/constant/theme.dart';
import 'features/extractAllUrl/presentation/bloc/extractallurl_bloc.dart';
import 'extractor_injection_container.dart' as extractor;
import 'features/extractAllUrl/presentation/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await extractor.extractorinit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ExtractallurlBloc>(
          create: (context) => extractor.sl<ExtractallurlBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: APP_NAME,
        theme: AppTheme.light,
        home: const Home(),
      ),
    );
  }
}
