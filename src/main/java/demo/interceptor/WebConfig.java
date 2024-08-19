package demo.interceptor;

import demo.interceptor.AdminInterceptor;
/*import demo.interceptor.EmployerInterceptor;*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Autowired
	private AdminInterceptor adminInterceptor;

	@Autowired
	private EmployerInterceptor employerInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(adminInterceptor).addPathPatterns("/admin/**"); // Áp dụng AdminInterceptor cho tất cả
																				// các đường dẫn bắt đầu với /admin

		registry.addInterceptor(employerInterceptor).addPathPatterns("/job4u/employers");
		// Áp dụng EmployerInterceptor cho /job4u/employers
	}
}
