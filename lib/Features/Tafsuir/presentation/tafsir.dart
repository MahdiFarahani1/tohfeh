import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/search/search_status.dart';
import 'package:flutter_application_1/Features/Home/presentation/bloc/search/search_title_cubit.dart';
import 'package:flutter_application_1/Features/Tafsuir/presentation/tafsir_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Tafsir extends StatefulWidget {
  final TextEditingController editingController;
  const Tafsir({super.key, required this.editingController});

  @override
  State<Tafsir> createState() => _TafsirState();
}

class _TafsirState extends State<Tafsir> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTitleCubit, SearchTitleState>(
      builder: (context, state) {
        if (state.status is Complete) {
          return FutureBuilder(
            future: DBhelper().searchTitle(widget.editingController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CustomLoading.fadingCircle(context));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'خطا: ${snapshot.error}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                return listTitles(snapshot);
              } else {
                return const Center(
                  child: Text(
                    'هیچ داده‌ای وجود ندارد',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }
            },
          );
        }
        if (state.status is Init) {
          return FutureBuilder(
            future: DBhelper().getTafsir(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CustomLoading.fadingCircle(context));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'خطا: ${snapshot.error}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                return listTitles(snapshot);
              } else {
                return const Center(
                  child: Text(
                    'هیچ داده‌ای وجود ندارد',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget listTitles(AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) => ZoomTapAnimation(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TafsirContent(
                  id: snapshot.data![index]['id'],
                  title: snapshot.data![index]['title'],
                ),
              ),
            );
          },
          child: Card(
            color: Theme.of(context)
                .colorScheme
                .primary
                .withAlpha((0.1 * 255).toInt()),
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withAlpha((0.6 * 255).toInt()),
                  ),
                  EsaySize.gap(8),
                  Expanded(
                    child: Text(
                      snapshot.data![index]['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withAlpha((0.1 * 255).toInt()),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (snapshot.data![index]['fav'] != 1) {
                              DBhelper()
                                  .updateFav(snapshot.data![index]['id'], 1);
                              setState(() {});
                            }
                          },
                          icon: Icon(
                            snapshot.data![index]['fav'] == 1
                                ? Icons.star
                                : Icons.star_border,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha((0.1 * 255).toInt()),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Theme.of(context).colorScheme.primary,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
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
    );
  }
}
