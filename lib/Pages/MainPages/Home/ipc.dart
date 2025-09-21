import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:leagese/Pages/Onboard/screen1.dart';
import 'package:leagese/colors.dart';

class IPCSectionPage extends StatefulWidget {
  const IPCSectionPage({Key? key}) : super(key: key);

  @override
  State<IPCSectionPage> createState() => _IPCSectionPageState();
}

class _IPCSectionPageState extends State<IPCSectionPage> {
  final ValueNotifier<String> searchQuery = ValueNotifier("");

  Future<Map<int, List<dynamic>>> loadIPCJson() async {
    final String response = await rootBundle.loadString('assets/img/ipc.json');
    final data = jsonDecode(response) as List<dynamic>;
    return groupByChapter(data);
  }

  static Map<int, List<dynamic>> groupByChapter(List<dynamic> data) {
    final Map<int, List<dynamic>> map = {};
    for (var item in data) {
      final int chapterNum = item["chapter"];
      map.putIfAbsent(chapterNum, () => []);
      map[chapterNum]!.add(item);
    }
    return map;
  }

  Widget topgradient() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyColors.primary.withOpacity(0.8),
            MyColors.primary.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Stack(
        children: [
          topgradient(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SafeArea(child: nav(context)),

                // 🔎 Search Bar
                TextField(
                  onChanged: (value) => searchQuery.value = value,
                  style: GoogleFonts.cabin(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search IPC sections...',
                    hintStyle: GoogleFonts.cabin(color: Colors.grey.shade500),
                    prefixIcon: const Icon(
                      Iconsax.search_normal,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.15),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // 📂 FutureBuilder for JSON
                Expanded(
                  child: FutureBuilder<Map<int, List<dynamic>>>(
                    future: loadIPCJson(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error loading IPC",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No IPC sections found",
                            style: GoogleFonts.cabin(color: Colors.white),
                          ),
                        );
                      }

                      final chaptersMap = snapshot.data!;

                      // 👂 Listen to Search
                      return ValueListenableBuilder<String>(
                        valueListenable: searchQuery,
                        builder: (context, query, _) {
                          final filtered = filterSections(chaptersMap, query);

                          if (filtered.isEmpty) {
                            return Center(
                              child: Text(
                                "No matching sections found.",
                                style: GoogleFonts.cabin(
                                  color: Colors.grey.shade500,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.0,
                            ),
                            itemCount: filtered.keys.length,
                            itemBuilder: (context, idx) {
                              final chapterNum = filtered.keys.elementAt(idx);
                              final sections = filtered[chapterNum]!;
                              final chapterTitle = sections.isNotEmpty
                                  ? toTitleCase(
                                      sections[0]["chapter_title"] ??
                                          "Chapter $chapterNum",
                                    )
                                  : "Chapter $chapterNum";

                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Theme(
                                  // 🔧 Fix: Remove divider lines by making them transparent
                                  data: Theme.of(
                                    context,
                                  ).copyWith(dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                    collapsedIconColor: MyColors.primary,
                                    iconColor: MyColors.primary,
                                    tilePadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    childrenPadding: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    title: Text(
                                      "Chapter $chapterNum: $chapterTitle",
                                      style: GoogleFonts.cabin(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    children: sections.map((section) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 8,
                                        ),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Section ${section["Section"]}: ${section["section_title"]}",
                                              style: GoogleFonts.cabin(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              section["section_desc"],
                                              style: GoogleFonts.cabin(
                                                fontSize: 14,
                                                color: Colors.grey.shade400,
                                                height: 1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Map<int, List<dynamic>> filterSections(
    Map<int, List<dynamic>> chaptersMap,
    String query,
  ) {
    if (query.isEmpty) return chaptersMap;
    final lowerQuery = query.toLowerCase();

    final Map<int, List<dynamic>> newFilteredMap = {};
    chaptersMap.forEach((chapterNum, sections) {
      // Get chapter title for comparison
      final chapterTitle = sections.isNotEmpty
          ? (sections[0]["chapter_title"]?.toString().toLowerCase() ?? '')
          : '';

      // Check if chapter matches the search query
      final chapterMatches =
          chapterTitle.contains(lowerQuery) ||
          "chapter $chapterNum".contains(lowerQuery) ||
          "$chapterNum".contains(lowerQuery);

      // Filter sections that match the search query
      final filteredSections = sections.where((s) {
        final title = s["section_title"]?.toString().toLowerCase() ?? '';
        final desc = s["section_desc"]?.toString().toLowerCase() ?? '';
        return title.contains(lowerQuery) ||
            desc.contains(lowerQuery) ||
            "${s["Section"]}".contains(lowerQuery);
      }).toList();

      if (chapterMatches || filteredSections.isNotEmpty) {
        newFilteredMap[chapterNum] = chapterMatches
            ? sections
            : filteredSections;
      }
    });

    return newFilteredMap;
  }

  String toTitleCase(String str) {
    if (str.isEmpty) return str;
    return str
        .split(" ")
        .map(
          (word) => word.isEmpty
              ? word
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(" ");
  }

  Row nav(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: MyColors.textPrimary.withOpacity(0.28),
            ),
            child: const Icon(
              Iconsax.arrow_left_2,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          "IPC Sections",
          style: GoogleFonts.cabin(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
