package api.runners;

import com.intuit.karate.junit5.Karate;

public class SmokeRunner {
	@Karate.Test
	public Karate TestRunner() {
		return Karate.run("classpath:features")
				.tags("Smoke");
	}

}
