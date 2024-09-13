# Log curl of request going out of spirngboot


### create a interceptor : `CurlLoggingInterceptor`

```java
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

public class CurlLoggingInterceptor implements ClientHttpRequestInterceptor {

    @Override
    public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution) throws IOException {
        logCurlRequest(request, body);
        return execution.execute(request, body);
    }

    private void logCurlRequest(HttpRequest request, byte[] body) {
        StringBuilder curlCommand = new StringBuilder("curl -X ");
        curlCommand.append(request.getMethod())
                .append(" '")
                .append(request.getURI())
                .append("'");

        for (Map.Entry<String, List<String>> entry : request.getHeaders().entrySet()) {
            for (String value : entry.getValue()) {
                curlCommand.append(" -H '").append(entry.getKey()).append(": ").append(value).append("'");
            }
        }

        if (body.length > 0) {
            String requestBody = new String(body, StandardCharsets.UTF_8);
            curlCommand.append(" --data '").append(requestBody).append("'");
        }

        System.out.println(curlCommand.toString());
    }
}
```

### Update your restTemplate config/bean to use above interceptor
```java
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder
                .additionalInterceptors(new CurlLoggingInterceptor())
                .build();
    }
}
```


