class AllAPIRequestForAudio {
  String getChapterAudio =
      "https://api.quran.com/api/v4/chapter_recitations/:id/:chapter_number";
  String listOfAllAudioFilesOfAReciter =
      "https://api.quran.com/api/v4/chapter_recitations/:id";
  String recitations = "https://api.quran.com/api/v4/resources/recitations";
  String getAudioFilesOfSingleRecitation =
      "https://api.quran.com/api/v4/quran/recitations/:recitation_id";
  String listOfChapterReciters =
      "https://api.quran.com/api/v4/resources/chapter_reciters";
  String getAyahRecitationsForSpecificSurah =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_chapter/:chapter_number";
  String getAyahRecitationsForSpecificJuz =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_juz/:juz_number";

  String getAyahRecitationsForSpecificMadaniMushafPage =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_page/:page_number";
  String getAyahRecitationsForSpecificRubElHizb =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_rub/:rub_el_hizb_number";
  String getAyahRecitationsForSpecificHizb =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_hizb/:hizb_number";
  String getAyahRecitationsForSpecificAyah =
      "https://api.quran.com/api/v4/recitations/:recitation_id/by_ayah/:ayah_key";
}

class AllAPIRequestForChapters {
  String listChapters = "https://api.quran.com/api/v4/chapters";
  String getChapter = "https://api.quran.com/api/v4/chapters/:id";
  String getChapterInfo =
      "https://api.quran.com/api/v4/chapters/:chapter_id/info";
}

class AllAPIRequestForVerses {
  String byChapter =
      "https://api.quran.com/api/v4/verses/by_chapter/:chapter_number";
  String byPage = "https://api.quran.com/api/v4/verses/by_page/:page_number";
  String byJuz = "https://api.quran.com/api/v4/verses/by_juz/:juz_number";
  String byHizbNumber =
      "https://api.quran.com/api/v4/verses/by_hizb/:hizb_number";
  String byRubeElHizbNumber =
      "https://api.quran.com/api/v4/verses/by_rub/:rub_el_hizb_numbe";
  String bySpecificVerseByKey =
      "https://api.quran.com/api/v4/verses/by_key/:verse_key";
  String getRandomAyah = "https://api.quran.com/api/v4/verses/random";
}

class AllAPIRequestForJuzs {
  String getAllJuzs = "https://api.quran.com/api/v4/juzs";
}

class AllAPIRequestForQuran {
  String getIndopakScriptOfAyah =
      "https://api.quran.com/api/v4/quran/verses/indopak";
  String getUthmaniTajweedScriptOfAyah =
      "https://api.quran.com/api/v4/quran/verses/uthmani_tajweed";
  String getUthmaniScriptOfAyah =
      "https://api.quran.com/api/v4/quran/verses/uthmani";
  String getUthmaniSimpleScriptOfAyah =
      "https://api.quran.com/api/v4/quran/verses/uthmani_simple";
  String getImlaeiSimpleTextOfAyah =
      "https://api.quran.com/api/v4/quran/verses/imlaei";
  String getaSingleTranslation =
      "https://api.quran.com/api/v4/quran/translations/:translation_id";
  String getaSingleTafsir =
      "https://api.quran.com/api/v4/quran/tafsirs/:tafsir_id";
  String getV1GlyphCodesOfAyah =
      "https://api.quran.com/api/v4/quran/verses/code_v1";
  String getV2GlyphCodesOfAyah =
      "https://api.quran.com/api/v4/quran/verses/code_v2";
}

class AllAPIRequestForAllAPIRequestForResources {
  String recitationInfo =
      "https://api.quran.com/api/v4/resources/recitations/:recitation_id/info";
  String translationInfo =
      "https://api.quran.com/api/v4/resources/translations/:translation_id/info";
  String translations = "https://api.quran.com/api/v4/resources/translations";
  String tafsirs = "https://api.quran.com/api/v4/resources/tafsirs";
  String tafsirInfo =
      "https://api.quran.com/api/v4/resources/tafsirs/:tafsir_id/info";
  String recitationStyles =
      "https://api.quran.com/api/v4/resources/recitation_styles";
  String languages = "https://api.quran.com/api/v4/resources/languages";
  String chapterInfos = "https://api.quran.com/api/v4/resources/chapter_infos";
  String verseMedia = "https://api.quran.com/api/v4/resources/verse_media";
  String search = "https://api.quran.com/api/v4/search";
}
