// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis_auth/auth_io.dart';



import 'package:project1/screens/registration_onboarding_screen.dart';
//1y5mQhDfWm6Q9QElBevZ-FJafgTdr3bhA
String folder_id = '';
var titles_list=[];
 Service_Credentials(){
  final credentials = auth.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "private_key":
    "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU+Vu04hHvzzAg\nHUeENjA3dmx8ZgeWwyYBWv6oK0jaRxOqpkWHvDLFNkiWGCwCN4t2OGbgyk2w8P0/\nhka6cHl0cJRKbY2/5Zh4PBgty3gwx5+rd6eyd5FVuSCQr5317vCiAw8iiaa6OlZL\nqDJfDGawKCop4ukTi6WBuvMXI461fNGo/bedx75x5OpMctF7DCgZBzvHKbr79F74\nAeq71l19JClBQOg+ZKZSpBgA2+SEgU+W3i73aMWsLEFZV1BnTWE6rxLZ3QrR/09k\nHCsKeyb8HFgoYmy9zn5yf66ji+qfF8GtpxFKZ2J5+QNTb3OXHsFh/qOrryEkJvfw\nIm3j1ec3AgMBAAECggEADZ1qfbIJjJ6lWdIDNriTGIaIrKfQer1UDFyqGGl4S4ai\na/6tLRYMl8x5vsnvv7Ye10uZT2L9zbWAl50oeqKL3xHo45J2mXqcwCRR22GUlvSv\niYaye1OFI037hW2fZJoVQOFBsVjeNXfeaiSxkdE600+gZtqXjZM+KYiR7ePwh3KA\nrqvW6H7q+PNWUktjS3zGyRMToprK/CrrncYc3/RCZWNqS0Cs7kITA4n4b4Wirqep\nqSSyyzmSE92IT7Y9cOsh2xeZN8Ib1vC+YA+qGARAdosuW9LI7jOI9gS0eyeyA9AK\nVh1psHQuAuOZCQYSVZsjiQzI6zjCKkqJ+OGUYqEEPQKBgQDD1hC0lsjbEwMCMMhm\nVgslBCWDp1/A7IHF42Rm9U8lriNmOTv+dNUy4cGWsJesH3lMHRiToWhezJ3k3/QN\nw8DQdpQ1xlcSzl3sY7GQbcwvixgadJpSzvLLlQZvH+bqLCbV40zyvFZqst5wbJ2V\nVTkhr+4anNlpERTIL8+qZlMZ5QKBgQDCvbmiGMMdlxMBRvQvvT75ukEb9eJQcUly\negfvRHXOqIW5BcxF4G1EfA/2NjZn9Bf2yiyzrjRR3lrJPaIKfb26UpBunfhnpxzq\n3Rw7GTeiHevGlOURtLW8wetulB0kB+oDDnilJ0zOs0Rg0yd2y0phejAUdX4EtTO6\nMbxNYv566wKBgQC0VWIKubL5sTcbBEr1mZQnoPrekfjl0aPq0us4t/oLC6EDV/77\n4SAV+7dliPYSBOWQhlaEU6SlbyySfvvg1PqvvBHctuilo6zvqhnvknvs59vpOKiH\nSpRfjbpgB/N+fevBF89a0r2NAWs+AXbW9aRndfb/QKIfUyBc+1HyaslpVQKBgQCy\neOpN0l/PGIuEWiCkN84lVDsjgt8cVha34XqwH4/QC8Yx4Uxqpdm+L+z4+oo2DxB/\nTp5VNcwhU6TkVaXR85cT0WMo3YGwjQkFfgrHZr8DxmQ0pHSjG3iLOzWnK/rg8JfY\noUSUJ0ZPESATlLDQQFM0rqStu1f4vJBhjf9C9PzAbQKBgBOi8vo++tN4i+fSiBz2\nSjHR+92iUOWKkA617GMTaLRuh+1BL/dmBxLdbPvUiFC8gda12sKuLGs0HbTUAaOL\nDlfqjt9tzyXWq4WLZV4PHQu5Us0xu3/Nk2lrh/tUxhWn+trKcgiUFe7qn6aiEM+T\nSHtsPLAXVxhBLOJJtzj4XqUC\n-----END PRIVATE KEY-----\n",
    "client_email":
    "services-account-of-dic@snappy-mapper-390405.iam.gserviceaccount.com",
    "client_id": "115092483468043548457",
  });
  return credentials;


}


void updateGoogleSheet(String name ,String email, String phone) async {
  // Load the service account credentials from a JSON file
 /* var credentials = auth.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU+Vu04hHvzzAg\nHUeENjA3dmx8ZgeWwyYBWv6oK0jaRxOqpkWHvDLFNkiWGCwCN4t2OGbgyk2w8P0/\nhka6cHl0cJRKbY2/5Zh4PBgty3gwx5+rd6eyd5FVuSCQr5317vCiAw8iiaa6OlZL\nqDJfDGawKCop4ukTi6WBuvMXI461fNGo/bedx75x5OpMctF7DCgZBzvHKbr79F74\nAeq71l19JClBQOg+ZKZSpBgA2+SEgU+W3i73aMWsLEFZV1BnTWE6rxLZ3QrR/09k\nHCsKeyb8HFgoYmy9zn5yf66ji+qfF8GtpxFKZ2J5+QNTb3OXHsFh/qOrryEkJvfw\nIm3j1ec3AgMBAAECggEADZ1qfbIJjJ6lWdIDNriTGIaIrKfQer1UDFyqGGl4S4ai\na/6tLRYMl8x5vsnvv7Ye10uZT2L9zbWAl50oeqKL3xHo45J2mXqcwCRR22GUlvSv\niYaye1OFI037hW2fZJoVQOFBsVjeNXfeaiSxkdE600+gZtqXjZM+KYiR7ePwh3KA\nrqvW6H7q+PNWUktjS3zGyRMToprK/CrrncYc3/RCZWNqS0Cs7kITA4n4b4Wirqep\nqSSyyzmSE92IT7Y9cOsh2xeZN8Ib1vC+YA+qGARAdosuW9LI7jOI9gS0eyeyA9AK\nVh1psHQuAuOZCQYSVZsjiQzI6zjCKkqJ+OGUYqEEPQKBgQDD1hC0lsjbEwMCMMhm\nVgslBCWDp1/A7IHF42Rm9U8lriNmOTv+dNUy4cGWsJesH3lMHRiToWhezJ3k3/QN\nw8DQdpQ1xlcSzl3sY7GQbcwvixgadJpSzvLLlQZvH+bqLCbV40zyvFZqst5wbJ2V\nVTkhr+4anNlpERTIL8+qZlMZ5QKBgQDCvbmiGMMdlxMBRvQvvT75ukEb9eJQcUly\negfvRHXOqIW5BcxF4G1EfA/2NjZn9Bf2yiyzrjRR3lrJPaIKfb26UpBunfhnpxzq\n3Rw7GTeiHevGlOURtLW8wetulB0kB+oDDnilJ0zOs0Rg0yd2y0phejAUdX4EtTO6\nMbxNYv566wKBgQC0VWIKubL5sTcbBEr1mZQnoPrekfjl0aPq0us4t/oLC6EDV/77\n4SAV+7dliPYSBOWQhlaEU6SlbyySfvvg1PqvvBHctuilo6zvqhnvknvs59vpOKiH\nSpRfjbpgB/N+fevBF89a0r2NAWs+AXbW9aRndfb/QKIfUyBc+1HyaslpVQKBgQCy\neOpN0l/PGIuEWiCkN84lVDsjgt8cVha34XqwH4/QC8Yx4Uxqpdm+L+z4+oo2DxB/\nTp5VNcwhU6TkVaXR85cT0WMo3YGwjQkFfgrHZr8DxmQ0pHSjG3iLOzWnK/rg8JfY\noUSUJ0ZPESATlLDQQFM0rqStu1f4vJBhjf9C9PzAbQKBgBOi8vo++tN4i+fSiBz2\nSjHR+92iUOWKkA617GMTaLRuh+1BL/dmBxLdbPvUiFC8gda12sKuLGs0HbTUAaOL\nDlfqjt9tzyXWq4WLZV4PHQu5Us0xu3/Nk2lrh/tUxhWn+trKcgiUFe7qn6aiEM+T\nSHtsPLAXVxhBLOJJtzj4XqUC\n-----END PRIVATE KEY-----\n",
    "client_email":
        "services-account-of-dic@snappy-mapper-390405.iam.gserviceaccount.com",
    "client_id": "115092483468043548457",
  });*/

  // Define the scopes required for accessing Google Sheets and Drive APIs
  const scopes = [
    sheets.SheetsApi.spreadsheetsScope,
    drive.DriveApi.driveScope
  ];

  // Authenticate with the service account credentials
  var client = await auth.clientViaServiceAccount(Service_Credentials(), scopes);

  try {
    // Create a Sheets API client
    var sheetsApi = sheets.SheetsApi(client);

    // Get the spreadsheet ID of the Google Sheets file
    var spreadsheetId = "1hM2briySxbtM3mptOpPVF7A3wdBsM6taqYeJmheE6Z8";

    // Retrieve the values from the sheet
    var response =
        await sheetsApi.spreadsheets.values.get(spreadsheetId, 'Sheet1');

    // Extract the values and get the count of filled rows
    var values = response.values;
    int filledRowCount = 0;

    if (values != null) {
      for (var row in values) {
        if (row.any((cell) => cell != null)) {
          filledRowCount++;
        }
      }
    }

    print(filledRowCount);

    var range = "Sheet1!A${filledRowCount + 1}:C${filledRowCount +1}";

    // Prepare the update data
    var data = [
      [name, email, phone],
    ];
    var updateData = sheets.ValueRange()..values = data;

    // Perform the update
    await sheetsApi.spreadsheets.values.update(updateData, spreadsheetId, range,
        valueInputOption: "USER_ENTERED");

    print("Google Sheets updated successfully!");

    // Define the range of cells to update (e.g., "Sheet1!A1:B2")
  } finally {
    // Close the client when done
    client.close();

  }
}

void createFolderInFolder(String emailPhone) async {
  // Set up authentication
  /*final credentials = auth.ServiceAccountCredentials.fromJson({
    "private_key_id": "18dcdfd9e7903caa9144f5065bcc449a3dd9fad3",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU+Vu04hHvzzAg\nHUeENjA3dmx8ZgeWwyYBWv6oK0jaRxOqpkWHvDLFNkiWGCwCN4t2OGbgyk2w8P0/\nhka6cHl0cJRKbY2/5Zh4PBgty3gwx5+rd6eyd5FVuSCQr5317vCiAw8iiaa6OlZL\nqDJfDGawKCop4ukTi6WBuvMXI461fNGo/bedx75x5OpMctF7DCgZBzvHKbr79F74\nAeq71l19JClBQOg+ZKZSpBgA2+SEgU+W3i73aMWsLEFZV1BnTWE6rxLZ3QrR/09k\nHCsKeyb8HFgoYmy9zn5yf66ji+qfF8GtpxFKZ2J5+QNTb3OXHsFh/qOrryEkJvfw\nIm3j1ec3AgMBAAECggEADZ1qfbIJjJ6lWdIDNriTGIaIrKfQer1UDFyqGGl4S4ai\na/6tLRYMl8x5vsnvv7Ye10uZT2L9zbWAl50oeqKL3xHo45J2mXqcwCRR22GUlvSv\niYaye1OFI037hW2fZJoVQOFBsVjeNXfeaiSxkdE600+gZtqXjZM+KYiR7ePwh3KA\nrqvW6H7q+PNWUktjS3zGyRMToprK/CrrncYc3/RCZWNqS0Cs7kITA4n4b4Wirqep\nqSSyyzmSE92IT7Y9cOsh2xeZN8Ib1vC+YA+qGARAdosuW9LI7jOI9gS0eyeyA9AK\nVh1psHQuAuOZCQYSVZsjiQzI6zjCKkqJ+OGUYqEEPQKBgQDD1hC0lsjbEwMCMMhm\nVgslBCWDp1/A7IHF42Rm9U8lriNmOTv+dNUy4cGWsJesH3lMHRiToWhezJ3k3/QN\nw8DQdpQ1xlcSzl3sY7GQbcwvixgadJpSzvLLlQZvH+bqLCbV40zyvFZqst5wbJ2V\nVTkhr+4anNlpERTIL8+qZlMZ5QKBgQDCvbmiGMMdlxMBRvQvvT75ukEb9eJQcUly\negfvRHXOqIW5BcxF4G1EfA/2NjZn9Bf2yiyzrjRR3lrJPaIKfb26UpBunfhnpxzq\n3Rw7GTeiHevGlOURtLW8wetulB0kB+oDDnilJ0zOs0Rg0yd2y0phejAUdX4EtTO6\nMbxNYv566wKBgQC0VWIKubL5sTcbBEr1mZQnoPrekfjl0aPq0us4t/oLC6EDV/77\n4SAV+7dliPYSBOWQhlaEU6SlbyySfvvg1PqvvBHctuilo6zvqhnvknvs59vpOKiH\nSpRfjbpgB/N+fevBF89a0r2NAWs+AXbW9aRndfb/QKIfUyBc+1HyaslpVQKBgQCy\neOpN0l/PGIuEWiCkN84lVDsjgt8cVha34XqwH4/QC8Yx4Uxqpdm+L+z4+oo2DxB/\nTp5VNcwhU6TkVaXR85cT0WMo3YGwjQkFfgrHZr8DxmQ0pHSjG3iLOzWnK/rg8JfY\noUSUJ0ZPESATlLDQQFM0rqStu1f4vJBhjf9C9PzAbQKBgBOi8vo++tN4i+fSiBz2\nSjHR+92iUOWKkA617GMTaLRuh+1BL/dmBxLdbPvUiFC8gda12sKuLGs0HbTUAaOL\nDlfqjt9tzyXWq4WLZV4PHQu5Us0xu3/Nk2lrh/tUxhWn+trKcgiUFe7qn6aiEM+T\nSHtsPLAXVxhBLOJJtzj4XqUC\n-----END PRIVATE KEY-----\n",
    "client_email":
        "services-account-of-dic@snappy-mapper-390405.iam.gserviceaccount.com",
    "client_id": "115092483468043548457",
    "type": "service_account",
  });*/

  // Create an HTTP client authenticated with the service account
  final client = await auth
      .clientViaServiceAccount(Service_Credentials(), [drive.DriveApi.driveFileScope]);

  // Create a Drive API client
  final driveApi = drive.DriveApi(client);

  try {
    // Search for the parent folder by its ID
    const parentFolderId = '11yjduzsnPqpnbOFHi7DyzE3r6Xc_y-vE';

    // Create a File object with the name and parent folder ID
    final newFolder = drive.File()
      ..name = emailPhone
      ..parents = [parentFolderId]
      ..mimeType = 'application/vnd.google-apps.folder';

    // Call the files.create() method on the Drive API client to create the folder
    final createdFolder = await driveApi.files.create(newFolder);

    folder_id = createdFolder.id!;

    print('New Folder ID: ${createdFolder.id}');
  } catch (e) {
    print('Error creating folder: $e');
  } finally {
    // Close the HTTP client
    client.close();

  }
}


Future<drive.File> uploadImage(String folderId, Uint8List imageData,String imageName) async {
  /*final credentials = auth.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU+Vu04hHvzzAg\nHUeENjA3dmx8ZgeWwyYBWv6oK0jaRxOqpkWHvDLFNkiWGCwCN4t2OGbgyk2w8P0/\nhka6cHl0cJRKbY2/5Zh4PBgty3gwx5+rd6eyd5FVuSCQr5317vCiAw8iiaa6OlZL\nqDJfDGawKCop4ukTi6WBuvMXI461fNGo/bedx75x5OpMctF7DCgZBzvHKbr79F74\nAeq71l19JClBQOg+ZKZSpBgA2+SEgU+W3i73aMWsLEFZV1BnTWE6rxLZ3QrR/09k\nHCsKeyb8HFgoYmy9zn5yf66ji+qfF8GtpxFKZ2J5+QNTb3OXHsFh/qOrryEkJvfw\nIm3j1ec3AgMBAAECggEADZ1qfbIJjJ6lWdIDNriTGIaIrKfQer1UDFyqGGl4S4ai\na/6tLRYMl8x5vsnvv7Ye10uZT2L9zbWAl50oeqKL3xHo45J2mXqcwCRR22GUlvSv\niYaye1OFI037hW2fZJoVQOFBsVjeNXfeaiSxkdE600+gZtqXjZM+KYiR7ePwh3KA\nrqvW6H7q+PNWUktjS3zGyRMToprK/CrrncYc3/RCZWNqS0Cs7kITA4n4b4Wirqep\nqSSyyzmSE92IT7Y9cOsh2xeZN8Ib1vC+YA+qGARAdosuW9LI7jOI9gS0eyeyA9AK\nVh1psHQuAuOZCQYSVZsjiQzI6zjCKkqJ+OGUYqEEPQKBgQDD1hC0lsjbEwMCMMhm\nVgslBCWDp1/A7IHF42Rm9U8lriNmOTv+dNUy4cGWsJesH3lMHRiToWhezJ3k3/QN\nw8DQdpQ1xlcSzl3sY7GQbcwvixgadJpSzvLLlQZvH+bqLCbV40zyvFZqst5wbJ2V\nVTkhr+4anNlpERTIL8+qZlMZ5QKBgQDCvbmiGMMdlxMBRvQvvT75ukEb9eJQcUly\negfvRHXOqIW5BcxF4G1EfA/2NjZn9Bf2yiyzrjRR3lrJPaIKfb26UpBunfhnpxzq\n3Rw7GTeiHevGlOURtLW8wetulB0kB+oDDnilJ0zOs0Rg0yd2y0phejAUdX4EtTO6\nMbxNYv566wKBgQC0VWIKubL5sTcbBEr1mZQnoPrekfjl0aPq0us4t/oLC6EDV/77\n4SAV+7dliPYSBOWQhlaEU6SlbyySfvvg1PqvvBHctuilo6zvqhnvknvs59vpOKiH\nSpRfjbpgB/N+fevBF89a0r2NAWs+AXbW9aRndfb/QKIfUyBc+1HyaslpVQKBgQCy\neOpN0l/PGIuEWiCkN84lVDsjgt8cVha34XqwH4/QC8Yx4Uxqpdm+L+z4+oo2DxB/\nTp5VNcwhU6TkVaXR85cT0WMo3YGwjQkFfgrHZr8DxmQ0pHSjG3iLOzWnK/rg8JfY\noUSUJ0ZPESATlLDQQFM0rqStu1f4vJBhjf9C9PzAbQKBgBOi8vo++tN4i+fSiBz2\nSjHR+92iUOWKkA617GMTaLRuh+1BL/dmBxLdbPvUiFC8gda12sKuLGs0HbTUAaOL\nDlfqjt9tzyXWq4WLZV4PHQu5Us0xu3/Nk2lrh/tUxhWn+trKcgiUFe7qn6aiEM+T\nSHtsPLAXVxhBLOJJtzj4XqUC\n-----END PRIVATE KEY-----\n",
    "client_email":
        "services-account-of-dic@snappy-mapper-390405.iam.gserviceaccount.com",
    "client_id": "115092483468043548457",
  });*/

  final client = await auth
      .clientViaServiceAccount(Service_Credentials(), [drive.DriveApi.driveFileScope]);
  final driveApi = drive.DriveApi(client);

  // final imageFile =
  //     drive.Media(File(imagePath).openRead(), await File(imagePath).length());
  final imageFile = drive.Media(Stream.value(imageData), imageData.length);

  final image = drive.File();
  image.parents = [folderId];

  image.name = imageName;


  final uploadedImage =
      await driveApi.files.create(image, uploadMedia: imageFile);

  return uploadedImage;
}
Future<void> fetch_title(folderId) async {
  // Load the credentials JSON file


  // Parse the credentials and authorize the client
  /*final credentials = auth.ServiceAccountCredentials.fromJson({
    "type": "service_account",
    "private_key":
    "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCU+Vu04hHvzzAg\nHUeENjA3dmx8ZgeWwyYBWv6oK0jaRxOqpkWHvDLFNkiWGCwCN4t2OGbgyk2w8P0/\nhka6cHl0cJRKbY2/5Zh4PBgty3gwx5+rd6eyd5FVuSCQr5317vCiAw8iiaa6OlZL\nqDJfDGawKCop4ukTi6WBuvMXI461fNGo/bedx75x5OpMctF7DCgZBzvHKbr79F74\nAeq71l19JClBQOg+ZKZSpBgA2+SEgU+W3i73aMWsLEFZV1BnTWE6rxLZ3QrR/09k\nHCsKeyb8HFgoYmy9zn5yf66ji+qfF8GtpxFKZ2J5+QNTb3OXHsFh/qOrryEkJvfw\nIm3j1ec3AgMBAAECggEADZ1qfbIJjJ6lWdIDNriTGIaIrKfQer1UDFyqGGl4S4ai\na/6tLRYMl8x5vsnvv7Ye10uZT2L9zbWAl50oeqKL3xHo45J2mXqcwCRR22GUlvSv\niYaye1OFI037hW2fZJoVQOFBsVjeNXfeaiSxkdE600+gZtqXjZM+KYiR7ePwh3KA\nrqvW6H7q+PNWUktjS3zGyRMToprK/CrrncYc3/RCZWNqS0Cs7kITA4n4b4Wirqep\nqSSyyzmSE92IT7Y9cOsh2xeZN8Ib1vC+YA+qGARAdosuW9LI7jOI9gS0eyeyA9AK\nVh1psHQuAuOZCQYSVZsjiQzI6zjCKkqJ+OGUYqEEPQKBgQDD1hC0lsjbEwMCMMhm\nVgslBCWDp1/A7IHF42Rm9U8lriNmOTv+dNUy4cGWsJesH3lMHRiToWhezJ3k3/QN\nw8DQdpQ1xlcSzl3sY7GQbcwvixgadJpSzvLLlQZvH+bqLCbV40zyvFZqst5wbJ2V\nVTkhr+4anNlpERTIL8+qZlMZ5QKBgQDCvbmiGMMdlxMBRvQvvT75ukEb9eJQcUly\negfvRHXOqIW5BcxF4G1EfA/2NjZn9Bf2yiyzrjRR3lrJPaIKfb26UpBunfhnpxzq\n3Rw7GTeiHevGlOURtLW8wetulB0kB+oDDnilJ0zOs0Rg0yd2y0phejAUdX4EtTO6\nMbxNYv566wKBgQC0VWIKubL5sTcbBEr1mZQnoPrekfjl0aPq0us4t/oLC6EDV/77\n4SAV+7dliPYSBOWQhlaEU6SlbyySfvvg1PqvvBHctuilo6zvqhnvknvs59vpOKiH\nSpRfjbpgB/N+fevBF89a0r2NAWs+AXbW9aRndfb/QKIfUyBc+1HyaslpVQKBgQCy\neOpN0l/PGIuEWiCkN84lVDsjgt8cVha34XqwH4/QC8Yx4Uxqpdm+L+z4+oo2DxB/\nTp5VNcwhU6TkVaXR85cT0WMo3YGwjQkFfgrHZr8DxmQ0pHSjG3iLOzWnK/rg8JfY\noUSUJ0ZPESATlLDQQFM0rqStu1f4vJBhjf9C9PzAbQKBgBOi8vo++tN4i+fSiBz2\nSjHR+92iUOWKkA617GMTaLRuh+1BL/dmBxLdbPvUiFC8gda12sKuLGs0HbTUAaOL\nDlfqjt9tzyXWq4WLZV4PHQu5Us0xu3/Nk2lrh/tUxhWn+trKcgiUFe7qn6aiEM+T\nSHtsPLAXVxhBLOJJtzj4XqUC\n-----END PRIVATE KEY-----\n",
    "client_email":
    "services-account-of-dic@snappy-mapper-390405.iam.gserviceaccount.com",
    "client_id": "115092483468043548457",
  });*/
  final client = await clientViaServiceAccount(Service_Credentials(), [drive.DriveApi.driveFileScope]);

  // Fetch image titles from Google Drive
  final imageTitles = await fetchImageTitlesFromFolder(client, folderId);

  // Handle the fetched image titles as needed
  handleFetchedImageTitles(imageTitles);

  // Close the client
  client.close();

}

Future<List<String?>> fetchImageTitlesFromFolder( client, folderId) async {
  final driveApi = drive.DriveApi(client);


  // Query for images in the specified folder
  final fileList = await driveApi.files.list(
    q: "'$folderId' in parents and mimeType contains 'image/'",
    $fields: 'files(name)',
  );

  // Retrieve the image titles
  final imageTitles = fileList.files!.map((file) => file.name).toList();
  titles_list=imageTitles;

  return imageTitles;
}

void handleFetchedImageTitles(List<String?> imageTitles) {
  // Process the fetched image titles, e.g., display in Flutter UI
  for (var title in imageTitles) {
    print('Image Title: $title');

  }
}

Future<Uint8List> fetchImageFromDrive( String imageTitle) async {
  final client = await clientViaServiceAccount(Service_Credentials(), [drive.DriveApi.driveFileScope]);
  final driveApi = drive.DriveApi(client);


  try {
    /*final fileListUri = Uri.parse(
        'https://www.googleapis.com/drive/v3/files'
            '?q=mimeType="image/jpeg"'
            '&name="$imageTitle"'
            '&$folder_Id%20in%20parents'
    );
    final fileListResponse = await client.get(fileListUri);
    final fileListJson = jsonDecode(fileListResponse.body);
    final fileList = fileListJson['files'];*/
    final query = "name = '$imageTitle' and '$folder_Id' in parents";
    final fileList = await driveApi.files.list(q: query);
    print(fileList);

    if ( fileList.files!.isNotEmpty) {

  final fileId = fileList.files![0].id;


  final fileDownloadUri = Uri.parse('https://www.googleapis.com/drive/v3/files/$fileId?alt=media');
      final fileDownloadResponse = await client.get(fileDownloadUri);

      if (fileDownloadResponse.statusCode == 200) {
        return fileDownloadResponse.bodyBytes;
      }
    }
  } finally {
    client.close();
  }

  throw Exception('Image not found');
}
Future<void> deletePhotoFromDrive(String folderId, String photoName) async {


  final client = await auth.clientViaServiceAccount(Service_Credentials(), [drive.DriveApi.driveFileScope]);
  final driveApi = drive.DriveApi(client);

  // Search for the file ID using the file name
  final fileList = await driveApi.files.list(q: "name = '$photoName' and '$folderId' in parents");
  if (fileList.files != null && fileList.files!.isNotEmpty) {
    final fileId = fileList.files!.first.id;

    // Delete the file
    await driveApi.files.delete(fileId!);
  } else {
    print('File not found');
  }
}



