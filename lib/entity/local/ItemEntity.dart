class ItemEntity {
  String id;
  String title;
  dynamic tag;

  ItemEntity(this.id, this.title, {this.tag});

  @override
  String toString() {
    return 'ItemEntity{id: $id, title: $title, tag: $tag}';
  }
}
