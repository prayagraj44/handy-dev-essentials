# junits snippets

### override properties of bootstrap.yml & application.yml
@TestPropertySource will always override any other properties (from application.yml, application.properties, or bootstrap.yml). They are at the highest precedence level in Spring’s environment property hierarchy.

```java
@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource(properties = {
"spring.cloud.vault.enabled=false",  
"spring.application.name=test-application",  
"spring.datasource.url=jdbc:h2:mem:testdb",  
"spring.datasource.username=testuser", 
"spring.datasource.password=testpassword" 
})
public class MyJunits {

    @Test
    public void testSomething() {
        // Test logic
    }
}
```