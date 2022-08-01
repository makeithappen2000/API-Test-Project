package TestData;

import java.util.Date;

import com.github.javafaker.Faker;
import com.github.javafaker.Job;
import com.ibm.icu.text.SimpleDateFormat;

public class FakeData {

	public static String getEmail() {
		Faker fake = new Faker();
		return fake.name().firstName() + fake.name().lastName() + "@gmail.com";

	}

	public static String getPhoneNumber() {
		Faker fake = new Faker();
		return fake.phoneNumber().cellPhone();
	}
	
	public static String getPhoneExtenstion() {
		Faker fake = new Faker();
		return fake.phoneNumber().extension();	
		
	}

	public static String getFirstName() {
		Faker fake = new Faker();
		return fake.name().firstName();
	}

	public static String getLastName() {
		Faker fake = new Faker();
		return fake.name().lastName();
	}

	@SuppressWarnings("deprecation")
	public static String getDOB() {
		Faker myfake = new Faker();
		Date mydate = myfake.date().birthday();
		SimpleDateFormat myformat = new SimpleDateFormat("yyy-MM-dd");
		return myformat.format(mydate);
		
	}
	
	public static String getStreeAddress() {
		Faker fake = new Faker();
		return fake.address().buildingNumber() + fake.address().streetAddress() + ", " + 
				fake.address().streetAddressNumber();
	
	}
	
	public static String getState() {
		Faker fake = new Faker();
		return fake.address().state();
	}
	
	public static String getcity() {
		Faker fake = new Faker();
		return fake.address().city() + ", " + fake.address().cityName();
	}
	
	public static String getZipCode() {
		Faker fake = new Faker();
		return fake.address().zipCode();
	}
	
	public static String getEmplymentStatus() {
		Faker fake = new Faker();
		return fake.job().title();
		
	}
}

//We will use the methods of this class to auto generate fake random data for our tests.
