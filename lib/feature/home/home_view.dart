import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product/auth_controller/auth_controller.dart';
import '../../product/common/error_dialog.dart';
import '../../product/constants/color_constants.dart';
import 'home_controller.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    Future.microtask(() {
      ref.read(homeProvider.notifier).fetchUser();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    ref.listen(authProvider, (previous, next) {
      if (next.authStatus == AuthStatus.unauthenticated) {
        Navigator.pop(context);
      }
    });

    ref.listen(homeProvider, (previous, next) {
      if(next.error==null&& next.postResponse==null){
        Center(child: CircularProgressIndicator());
      }else if(
      next.error!=null&& next.postResponse==null
      ){
        ErrorDialog.show(context, "${next.error}");
      }
      print("state: ${next.postResponse}");
    });

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          ref.read(authProvider.notifier).onSignOut();
        }, icon: Icon(Icons.logout))
      ],),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ref.watch(homeProvider).postResponse!=null?
      ListView.builder(
                itemCount: ref.watch(homeProvider).postResponse?.userList!.length!,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                          ref.watch(homeProvider).postResponse!.userList![index].avatar!,
                          imageBuilder: (context, imageProvider) => Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${ref.watch(homeProvider).postResponse!.userList?[index].firstName!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${ref.watch(homeProvider).postResponse!.userList?[index].lastName!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: ColorConstants.black),
                              ),
                              Text(
                                "${ref.watch(homeProvider).postResponse!.userList?[index].email!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: ColorConstants.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                ):
            Center(child: Text(" Not Loaded Data"),),
          ),
        ],
      ),
    );
  }
}
