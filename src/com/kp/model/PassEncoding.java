package com.kp.model;



	import java.nio.charset.StandardCharsets;
	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;

	public class PassEncoding {	
		
		 public String generateMD5(String password) {
			    
			    MessageDigest md = null;
			    byte[] md5 = null;
			    try {
			        md = MessageDigest.getInstance("md5");
			        md5 = md.digest(password.getBytes(StandardCharsets.UTF_8));
			    } catch (NoSuchAlgorithmException e) {
			        e.printStackTrace();
			    } 
			    return convertToHex(md5);
			}


			/**
			* Converts the given byte[] to a hex string.
			* @param raw the byte[] to convert
			* @return the string the given byte[] represents
			*/
			    private String convertToHex(byte[] raw) {
			    StringBuffer sb = new StringBuffer();
			    for (int i = 0; i < raw.length; i++) {
			        sb.append(Integer.toString((raw[i] & 0xff) + 0x100, 16).substring(1));
			    }
			    return sb.toString();
			}
	}


