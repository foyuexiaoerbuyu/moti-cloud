package com.moti;

import com.moti.utils.SpringbootUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
public class MotiCloudApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext applicationContext = SpringApplication.run(MotiCloudApplication.class, args);
        SpringbootUtils.printServiceUrl(applicationContext);
    }
}
