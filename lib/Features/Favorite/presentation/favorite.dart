import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/Core/common/common_diolog.dart';
import 'package:flutter_application_1/Core/database/db_helper.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Core/utils/loading.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DBhelper().getFavorite(),
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
          if (snapshot.data!.isEmpty) {
            return Center(
              child: IntrinsicHeight(
                child: Container(
                  alignment: Alignment.center,
                  width: EsaySize.width(context) / 1.5,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withAlpha((0.1 * 255).toInt()),
                      borderRadius: BorderRadius.circular(4)),
                  child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      'لم يتم اضافة اي شئ بعد',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                )
                    .animate()
                    .moveY(delay: const Duration(milliseconds: 300), begin: 40)
                    .fade(),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
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
                              color: Colors.red.withAlpha((0.1 * 255).toInt()),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              onPressed: () {
                                CustomDialog.showDeleteDilog(
                                  context,
                                  onTap: () {
                                    DBhelper().updateFav(
                                        snapshot.data![index]['id'], 0);
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
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
              );
            },
          );
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
}
