package member;

import conn.SecurityUtil;

public class pwdwp {
	public static void main(String[] args) {
			char pwCollection[] = new char[] {'1','2','3','4','5','6','7','8','9','0', 
			'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
			'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
			'!','@','#','$','%','^','&','*','(',')' }; 
			
			String ranPw = ""; 
			for (int i = 0; i < 10; i++) { 
			int selectRandomPw = (int)(Math.random()*(pwCollection.length));
			ranPw += pwCollection[selectRandomPw]; 
			}; 
//			SecurityUtil security = new SecurityUtil();
//			String pwd = "R27OJBF5iu";
//			String Newpwd = security.encryptSHA256(pwd);
			//R27OJBF5iu
//			System.out.println(ranPw);
//			System.out.println(Newpwd);
			//@ILwcI^yZU
	}

}
