package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/*Input account info-JavaMail & Activation for SMTP*/

public class Gmail extends Authenticator {
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("google_id", "google_PW");
	}
}
