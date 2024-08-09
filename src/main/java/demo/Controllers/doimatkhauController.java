/*
 * package demo.Controllers;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.servlet.mvc.support.RedirectAttributes; import
 * demo.services.ChangeService;
 * 
 * @Controller
 * 
 * @RequestMapping("/job4u") public class doimatkhauController {
 * 
 * @Autowired private ChangeService changeService; // Đúng tên của service
 * 
 * @PostMapping("/DoiMatKhau") public String
 * doiMatKhau(@RequestParam("oldPassword") String oldPassword,
 * 
 * @RequestParam("newPassword") String newPassword,
 * 
 * @RequestParam("confirmNewPassword") String confirmNewPassword,
 * RedirectAttributes redirectAttributes) {
 * 
 * if (!newPassword.equals(confirmNewPassword)) {
 * redirectAttributes.addFlashAttribute("errorMessage",
 * "New passwords do not match!"); return "redirect:/job4u/DoiMatKhau"; }
 * 
 * boolean isChanged = changeService.changePassword(oldPassword, newPassword);
 * 
 * if (isChanged) { redirectAttributes.addFlashAttribute("successMessage",
 * "Password changed successfully!"); return "redirect:/job4u/DoiMatKhau"; }
 * else { redirectAttributes.addFlashAttribute("errorMessage",
 * "Old password is incorrect!"); return "redirect:/job4u/DoiMatKhau"; } } }
 */