String buildFullImageUrl(String imagePath) {
    // استبدال localhost بـ 10.0.2.2 للمحاكي
    if (imagePath.contains('localhost')) {
      return imagePath.replaceAll('localhost', '10.0.2.2');
    }
    return imagePath;
  }