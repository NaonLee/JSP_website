package util;

import java.security.MessageDigest;

/*For Authentication. Return Hash value*/
public class SHA256 {

	public static String getSHA256(String input) {
		StringBuffer result = new StringBuffer();
		
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] salt = "This is Salt".getBytes();				//to protect data from hackers
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));		//after applying Hash algorithm
			
			for(int i = 0; i < chars.length; i++) {						//Byte To String 
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) result.append("0");
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
}
