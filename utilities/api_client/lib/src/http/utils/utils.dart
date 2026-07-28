//todo (abdulrahman): replace this logic with mime package
class Utils {
  static String getMimeType(String filePath) {
    final ext = (filePath.split('.').lastOrNull ?? "").toLowerCase();
    switch (ext) {
      case 'jpg':
      case 'jpeg':
        return "image/jpeg";
      case 'png':
        return "image/png";
      case 'pdf':
        return "application/pdf";
      case 'doc':
        return "application/msword";
      case 'docx':
        return "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
      default:
        return "application/octet-stream";
    }
  }
}
