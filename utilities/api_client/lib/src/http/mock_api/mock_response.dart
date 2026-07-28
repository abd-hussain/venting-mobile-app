class MockResponse {
  final int code;
  final String body;
  final String bodyFilePath;
  final int delayInMillis;

  MockResponse({
    this.code = 200,
    this.body = '',
    this.bodyFilePath = '',
    this.delayInMillis = 300,
  }) : assert(
         delayInMillis > 299,
         'Invalid duration value. Should be greater than 299',
       ),
       assert(
         body.isEmpty || bodyFilePath.isEmpty,
         'Both body and bodyFilePath cannot be provided at the same time',
       );
}
