// Replies "Hello, world!" to all requests.
// Use the URL https://localhost:4047 in your browser.
// You might get a warning about a potential security risk.
import 'dart:io';

main() {
  var testPkcertDatabase = Platform.script.resolve('pkcert').toFilePath();
  SecureSocket.initialize(database: testPkcertDatabase,
                          password: 'dartdart');
  
  HttpServer.bindSecure(/* InternetAddress.LOOPBACK_IP_V6*/ 'localhost',
                        4047,
                        certificateName: 'localhost_cert').then((server) {
    print('listening');
    server.listen((HttpRequest request) {
      request.response.write('Hello, world!');
      request.response.close();
    });
  });
}