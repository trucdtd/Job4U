package demo.services;

import org.springframework.beans.factory.annotation.Autowired;

import demo.entity.UsersEntity;

public class UserService {
	
	 	@Autowired
	    private UserRepository userRepository;

	    public UsersEntity updateUser(Integer id, UsersEntity user) {
	        // Tìm người dùng theo ID và cập nhật thông tin
	    	UsersEntity existingUser = userRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found"));
	        existingUser.setName(user.getUsername());
	        existingUser.setEmail(user.getEmail());
	        // Cập nhật các thuộc tính khác
	        return userRepository.save(existingUser);
	    }

	    public UsersEntity  partiallyUpdateUser(Long id, Map<String, Object> updates) {
	        // Tìm người dùng theo ID và cập nhật một phần thông tin
	    	UsersEntity  existingUser = userRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("User not found"));
	        
	        if (updates.containsKey("username")) {
	            existingUser.setUsername((String) updates.get("username"));
	        }
	        if (updates.containsKey("email")) {
	            existingUser.setEmail((String) updates.get("email"));
	        }
	        // Cập nhật các thuộc tính khác
	        return userRepository.save(existingUser);
	    }
}
