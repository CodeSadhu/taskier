import 'package:appwrite_hack/models/task_model.dart';
import 'package:appwrite_hack/utils/app_routes.dart';
import 'package:appwrite_hack/utils/assets.dart';
import 'package:appwrite_hack/utils/colors.dart';
import 'package:appwrite_hack/utils/constants.dart';
import 'package:appwrite_hack/utils/shared_prefs_helper.dart';
import 'package:appwrite_hack/utils/strings.dart';
import 'package:appwrite_hack/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Box<TaskModel> taskBox;
  late Size size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBox = Hive.box<TaskModel>(Strings.tasks);
  }

  @override
  Widget build(BuildContext context) {
    size = Constants.getSize(context);
    return Scaffold(
      floatingActionButton: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          if (value.values.isNotEmpty) {
            return Container(
              margin: EdgeInsets.only(
                right: size.width * 0.04,
                bottom: size.height * 0.02,
              ),
              child: FloatingActionButton(
                backgroundColor: ColorPalette.primary,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.taskForm);
                },
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: size.height * 0.04,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Todo Hack',
                    style: Styles.appbarStyle(),
                  ),
                  IconButton(
                    onPressed: () => Constants.logout(),
                    icon: Icon(
                      Icons.logout,
                      size: size.height * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                    vertical: size.height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPalette.backgroundGrey.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ValueListenableBuilder<Box<TaskModel>>(
                    valueListenable: taskBox.listenable(),
                    builder: (context, value, child) {
                      var boxContent = value.values.toList();
                      if (boxContent.isEmpty) {
                        return EmptyScreenPage(size: size);
                      } else {
                        return ListView.separated(
                          itemCount: boxContent.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                boxContent[index].name!,
                                style: Styles.smallBodyStyle(),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: size.height * 0.01,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyScreenPage extends StatelessWidget {
  const EmptyScreenPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            Assets.notes,
            height: size.height * 0.14,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'Create your first task to get started!',
          style: Styles.bodyStyle(),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: ColorPalette.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
              horizontal: size.width * 0.04,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.taskForm);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Text(
                'Create Task',
                style: Styles.bodyStyle(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
