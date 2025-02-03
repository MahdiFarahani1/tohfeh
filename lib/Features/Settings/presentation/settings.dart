import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Core/common/common_snackBar.dart';
import 'package:flutter_application_1/Core/utils/esay_size.dart';
import 'package:flutter_application_1/Features/Settings/presentation/bloc/cubit/settings_cubit.dart';
import 'package:flutter_application_1/Features/Settings/presentation/custom_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('إعدادات التطبيق'),
          _buildSwitchTile(
            context,
            'المظهر الداكن',
            Icons.brightness_6,
          ),
          _buildNavigationTile(context, 'حجم الخط', Icons.text_fields, () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: EsaySize.width(context),
                  height: EsaySize.height(context) / 2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 4, bottom: 8),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.6),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'حجم الخط',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SliderTheme(
                            data: SliderThemeData(
                                thumbColor:
                                    Theme.of(context).colorScheme.secondary,
                                trackHeight: 2,
                                inactiveTrackColor: Colors.black12,
                                activeTrackColor: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.6)),
                            child: BlocBuilder<SettingsCubit, SettingsState>(
                              builder: (context, state) {
                                return Slider(
                                  min: 14,
                                  max: 30,
                                  divisions: 16,
                                  label: '${state.fontsize}',
                                  value: state.fontsize,
                                  onChanged: (value) {
                                    BlocProvider.of<SettingsCubit>(context)
                                        .changeFontsize(value);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ ',
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('بستن')),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
          divider(context),
          _buildSectionTitle('حول التطبيق'),
          _buildNavigationTile(context, 'عن التطبيق', Icons.info, () {
            showCustomBottomSheet(context, 'test 1 test 1 test 1');
          }),
          _buildClickableTile(
              context, 'تواصل معنا', Icons.email, 'noralanor6236@gmail.com',
              () {
            Clipboard.setData(
                const ClipboardData(text: 'noralanor6236@gmail.com'));
            CustomSnackBar.show(context, message: 'تم نسخ الإيميل بنجاح');
          }),
          _buildNavigationTile(
              context, 'مصادر التفسير الموضوعي', Icons.menu_book, () {
            showCustomBottomSheet(context, 'test 1 test 1 test 1');
          }),
          _buildInfoTile(context, 'إصدار', Icons.verified, subtitle: '(1.0.0)'),
          divider(context),
          _buildSectionTitle('تحميل الكتب'),
          for (var i = 1; i <= 5; i++)
            _buildDownloadTile(
                context, 'تحفة الوعاظ المجلد $i', Icons.download),
        ],
      ),
    );
  }

  Divider divider(BuildContext context) {
    return Divider(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      endIndent: 40,
      indent: 40,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildSwitchTile(BuildContext context, String title, IconData icon) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return SwitchListTile(
          tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
          title: Text(title),
          secondary: Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          value: state.isDark,
          onChanged: (value) {
            BlocProvider.of<SettingsCubit>(context).changeTheme(value);
          },
          activeColor: Colors.black,
          activeTrackColor: Colors.black54,
          inactiveThumbColor: Colors.blue,
          inactiveTrackColor: Colors.blue[300],
        );
      },
    );
  }

  Widget _buildNavigationTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        title: Text(title),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, String title, IconData icon,
      {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle) : null,
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Widget _buildClickableTile(BuildContext context, String title, IconData icon,
      String content, VoidCallback onTap) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
      title: Text(title),
      subtitle: Text(content, style: const TextStyle(color: Colors.blue)),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDownloadTile(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        title: Text(title),
        trailing: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.green.shade100,
          child: Icon(
            Icons.download_for_offline_rounded,
            color: Colors.green.shade500,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
