import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/extensions/widget_ex.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/search/search_title_cubit.dart';
import 'package:flutter_application_1/Features/Tafsuir/presentation/tafsir.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Home extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 22, 176, 182),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: EsaySize.width(context),
              height: EsaySize.height(context) / 5,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Assets.images.logo.image(
                        width: EsaySize.width(context) / 2,
                        height: EsaySize.height(context) / 8),
                  ),
                  Positioned(
                    bottom: -24,
                    left: 50,
                    right: 50,
                    child: SizedBox(
                      height: 55,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 4,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _textController,
                                onSubmitted: (value) {
                                  BlocProvider.of<SearchTitleCubit>(context)
                                      .searchData();
                                },
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'البحث...',
                                  hintStyle: TextStyle(color: Colors.black12),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ZoomTapAnimation(
                                onTap: () {
                                  BlocProvider.of<SearchTitleCubit>(context)
                                      .searchData();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ).padAll(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Tafsir(
                editingController: _textController,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
