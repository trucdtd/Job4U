//package demo.services;
//
//import com.google.api.client.http.FileContent;
//import com.google.api.client.http.HttpTransport;
//import com.google.api.client.http.javanet.NetHttpTransport;
//import com.google.api.client.json.JsonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.services.drive.Drive;
//import com.google.api.services.drive.DriveScopes;
//import com.google.api.services.drive.model.File;
//import com.google.auth.oauth2.GoogleCredentials;
//import com.google.auth.http.HttpCredentialsAdapter;
//
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.util.Collections;
//
//public class GoogleDriveService {
//
//    private static final String APPLICATION_NAME = "Your Application Name";
//    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
//    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
//
//    private static Drive getDriveService() throws IOException {
//        // Load client secrets.
//        GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream("path/to/credentials.json"))
//                .createScoped(Collections.singleton(DriveScopes.DRIVE_FILE));
//
//        // Build a new authorized API client service.
//        return new Drive.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpCredentialsAdapter(credentials))
//                .setApplicationName(APPLICATION_NAME)
//                .build();
//    }
//
//    public String uploadFile(java.io.File filePath) throws IOException {
//        Drive driveService = getDriveService();
//
//        File fileMetadata = new File();
//        fileMetadata.setName(filePath.getName());
//
//        FileContent mediaContent = new FileContent("image/jpeg", filePath);
//
//        File file = driveService.files().create(fileMetadata, mediaContent)
//                .setFields("id")
//                .execute();
//        return file.getId();
//    }
//}
