package demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import demo.classes.Constants;
import demo.entity.UserGoogleDto;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

@Controller
public class DangNhapGoogle {
	@RequestMapping("/Job4U/DangNhapGoogle")
	public String requestMethodName(@RequestParam String code) {
		String accessToken = getToken(code);
		UserGoogleDto user = getUserInfo(accessToken);
		System.out.println(user.getName());
		return "";
	}

	public static String getToken(String code) {
		// call api to get token
		String accessToken = null;
		try {
			String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
					.bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
							.add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
							.add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
							.add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
					.execute().returnContent().asString();
		
			JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
			accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		} catch (Exception e) {
			System.out.println("Lỗi ở đăng nhập google controller function getToken" + e);
			// TODO: handle exception
		}

		return accessToken;
	}

	public static UserGoogleDto getUserInfo(final String accessToken) {
		String response = "";
		try {
			String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
			response = Request.Get(link).execute().returnContent().asString();

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Lỗi ở đăng nhập google controller function getUserInfo " + e);
		}
		UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
		return googlePojo;
	}
}
