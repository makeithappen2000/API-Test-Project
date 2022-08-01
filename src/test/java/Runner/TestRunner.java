package Runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	
	@Karate.Test
	public Karate runTag () {
		return Karate.run("classpath:features").tags("@End-2-End");
	}
}
//This TestRunner class is using Karate framework to speicfy what tag we want run under what feature
// Or what scenario.
