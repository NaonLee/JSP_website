package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/*Input account info-JavaMail & Activation for SMTP*/

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("giraffe1254@gmail.com", "infinite100609!");
	}
}
