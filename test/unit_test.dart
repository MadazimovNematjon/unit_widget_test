
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget_test/modul/post.dart';
import 'package:unit_widget_test/service/api_service.dart';

void main() {
  test("Post Test", () async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
      List<Post> posts = Network.parsePostList(response!);      
      expect(posts, isNotEmpty);
  });
  test("Post Test 0", () async {
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    List<Post> posts = Network.parsePostList(response!);
    expect(posts.length, greaterThan(0));
  });

}
