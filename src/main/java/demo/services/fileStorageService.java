package demo.services;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;



@Service
public class fileStorageService {
	private final Path fileStorageLocation = Paths.get("uploads").toAbsolutePath().normalize();

    public fileStorageService() {
        try {
            Files.createDirectories(this.fileStorageLocation);
        } catch (Exception ex) {
            throw new RuntimeException("Không thể tạo thư mục lưu trữ các tập tin đã tải lên.", ex);
        }
    }
//    MultipartFilefile
//    Đây là đối tượng đại diện cho file được tải lên từ
    public String storeFile(MultipartFile file) throws IOException {
//    	file.getOriginalFilename() Trả về tên gốc của file được tải lên.
        String fileName = file.getOriginalFilename();
//      Kết hợp thư mục lưu trữ với tên file để tạo ra đường dẫn đích nơi file sẽ được lưu.
        Path targetLocation = this.fileStorageLocation.resolve(fileName);
        Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
//      Nếu file đã tồn tại ở đường dẫn đích, nó sẽ được thay thế.
        return fileName;
    }
}
