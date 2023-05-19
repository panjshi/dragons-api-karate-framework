package api.runners;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {
	@Karate.Test
	public Karate TestRunner() {
		return Karate.run("classpath:features")
				.tags("Regression");
		
	}
	
	
	

	
	}

