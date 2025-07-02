import 'package:auto_route/auto_route.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/core/router/router.gr.dart';
import 'search_friends_notifier.dart';

@RoutePage()
class SearchFriendsPage extends ConsumerStatefulWidget {
  const SearchFriendsPage({super.key});

  @override
  ConsumerState<SearchFriendsPage> createState() => _SearchFriendsPageState();
}

class _SearchFriendsPageState extends ConsumerState<SearchFriendsPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _controller.addListener(() {
      ref.read(searchFriendsProvider.notifier).search(_controller.text);
    });
  }

  void _clearSearch() {
    if (_controller.text.trim().isEmpty) {
      Navigator.of(context).pop();
      return;
    }
    _controller.clear();
    _focusNode.unfocus();
    ref.read(searchFriendsProvider.notifier).clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(searchFriendsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: _searchBar),
                      _cancelTextButton,
                    ],
                  ),
                ),
              ),
              Expanded(child: _buildResults(context, resultsAsync)),
            ],
          ),
        ),
      ),
    );
  }
}

extension _SearchFriendsPageStateWidgets on _SearchFriendsPageState {
  Container get _searchBar {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        children: [
          const Icon(Icons.search, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              decoration: const InputDecoration(
                hintText: 'Search by name or email',
                border: InputBorder.none,
                isDense: true,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
        ],
      ),
    );
  }

  TextButton get _cancelTextButton => TextButton(
    onPressed: _clearSearch,
    style: TextButton.styleFrom(foregroundColor: Colors.black),
    child: const Text('Cancel'),
  );

  Widget _buildResults(BuildContext context, AsyncValue<List<Contact>> resultsAsync) {
    return resultsAsync.when(
      data: (results) {
        if (_controller.text.length < 3) return const SizedBox();
        if (results.isEmpty) {
          return const Center(child: Text('No results found.'));
        }
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(results[index].displayName ?? ''),
            onTap: () {
              _clearSearch();
              context.pushRoute(ContactDetailsRoute(contact: results[index]));
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
    );
  }
}
