### Fixing "JAXB-API has not been found on module class path" in Spring Boot 3.x

This error happens because, starting from Java 11, the JAXB API (which was previously part of the JDK) has been removed. In Spring Boot 3.x, 
you need to add it back manually to your project.

```xml
 <dependency>
        <groupId>jakarta.xml.bind</groupId>
        <artifactId>jakarta.xml.bind-api</artifactId>
        <version>4.0.0</version>
</dependency>
```
