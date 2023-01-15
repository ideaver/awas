import '/res/widgets/kdivider_widget.dart';
import '/res/widgets/kexpansiontile_widget.dart';
import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KanimatedListExpansionWidget extends StatefulWidget {
  const KanimatedListExpansionWidget({super.key});

  @override
  State<KanimatedListExpansionWidget> createState() =>
      _KanimatedListExpansionWidgetState();
}

class _KanimatedListExpansionWidgetState
    extends State<KanimatedListExpansionWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  late ListModel<int> listData;
  int? selectedItem;
  late int
      nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    listData = ListModel<int>(
      listKey: listKey,
      initialItems: <int>[0, 1, 2, 3, 4, 5, 6, 7],
      removedItemBuilder: buildRemovedItem,
    );
    nextItem = 3;
  }

  // Used to build list items that haven't been removed.
  Widget buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: listData[index],
      selected: selectedItem == listData[index],
      onTap: () {
        setState(() {
          selectedItem =
              selectedItem == listData[index] ? null : listData[index];
        });
      },
    );
  }

  /// The builder function used to build items that have been removed.
  ///
  /// Used to build an item after it has been removed from the list. This method
  /// is needed because a removed item remains visible until its animation has
  /// completed (even though it's gone as far as this ListModel is concerned).
  /// The widget will be used by the [AnimatedListState.removeItem] method's
  /// [AnimatedRemovedItemBuilder] parameter.
  Widget buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  // Insert the "next item" into the list model.
  void insert() {
    // uncomment to insert on last
    // final int index = selectedItem == null
    //     ? listData.length
    //     : listData.indexOf(selectedItem!);
    listData.insert(0, nextItem++);
  }

  // Remove the selected item from the list model.
  void remove() {
    if (selectedItem != null) {
      listData.removeAt(listData.indexOf(selectedItem!));
      setState(() {
        selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KexpansionTileWidget(
        childrenPadding: const EdgeInsets.all(0.0),
        title: 'Last report location',
        children: [
          // IconButton(
          //   icon: const Icon(Icons.add_circle),
          //   onPressed: insert,
          //   tooltip: 'insert a new item',
          // ),
          // IconButton(
          //   icon: const Icon(Icons.remove_circle),
          //   onPressed: remove,
          //   tooltip: 'remove the selected item',
          // ),
          const Padding(
            padding: EdgeInsets.only(
                top: defaultMargin, left: defaultMargin, right: defaultMargin),
            child: KtextFormFieldWidget(
                icon: Icons.search,
                withTitle: false,
                title: 'Search or add new'),
          ),
          AnimatedList(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            key: listKey,
            initialItemCount: listData.length,
            itemBuilder: buildItem,
          ),
          const SizedBox(
            height: defaultMargin * 8,
          )
        ]);
  }
}

typedef RemovedItemBuilder<T> = Widget Function(
    T item, BuildContext context, Animation<double> animation);

/// Keeps a Dart [List] in sync with an [AnimatedList].
///
/// The [insert] and [removeAt] methods apply to both the internal list and
/// the animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that
/// mutate the list must make the same changes to the animated list in terms
/// of [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> items;

  AnimatedListState? get animatedList => listKey.currentState;

  void insert(int index, E item) {
    items.insert(index, item);
    animatedList!.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = items.removeAt(index);
    if (removedItem != null) {
      animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => items.length;

  E operator [](int index) => items[index];

  int indexOf(E item) => items.indexOf(item);
}

/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: defaultMargin / 2, horizontal: defaultMargin),
              tileColor:
                  selected ? LightColors.kInfoColor.withOpacity(0.2) : null,
              leading: FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(defaultMargin / 2),
                  decoration: const BoxDecoration(
                      color: LightColors.kPrimaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      'Attacka Field'.substring(0, 1),
                      style: LightColors.whiteTextStyle
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              title: Text(
                '$item attaka field',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const KdividerWidget(
              horizontalMargin: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
