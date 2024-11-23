package demo.util;

import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;


public class MaHoa {
	public static String toSHA1(String str) {
		String salt = "fasdlfa@@12746AhhdWqQJdlasdf;fkQ@#$sd2305";
		String result = null;
		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Loi o package util class ma hoa " + e);
		}
		return result;
	}
	
}
