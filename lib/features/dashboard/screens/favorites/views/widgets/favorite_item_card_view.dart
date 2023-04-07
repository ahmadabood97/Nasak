import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nasak/features/dashboard/screens/favorites/controllers/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../auth/screens/login/controllers/provider/login_provider.dart';
import '../../models/favorite_model.dart';

class FavoriteItemCardView extends StatefulWidget {
  final Items item;
  const FavoriteItemCardView({super.key, required this.item});

  @override
  State<FavoriteItemCardView> createState() => _FavoriteItemCardViewState();
}

class _FavoriteItemCardViewState extends State<FavoriteItemCardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                onPressed: (_) {
                  var userData =
                      Provider.of<LoginProvider>(context, listen: false)
                          .loginData;
                  Provider.of<FavoriteProvider>(context, listen: false)
                      .deleteFromFavorites(
                          context: context,
                          stopLoading: () {
                            Navigator.pop(context);
                          },
                          shopId: widget.item.serviceProviderId,
                          token: userData!.authToken!);
                },
                icon: Icons.delete,
              )
            ],
          ),
          child: Container(
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(color: Colors.grey.withOpacity(0.7))),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://img.freepik.com/premium-vector/burger-logo-template_441059-18.jpg?w=2000',
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.item.appServiceProvider!.name!,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  maxLines: 1,
                                  widget.item.appServiceProvider!.desc!,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    maxLines: 1,
                                    widget.item.appServiceProvider!
                                        .contactAddress!,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black.withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              )),
        ));
  }
}
