# Sonarqube
### -

#### run sonar on springboot maven project
```bash
mvn clean verify sonar:sonar -Dsonar.projectKey=projectKey -Dsonar.host.url=http://localhost:9000 -Dsonar.login=token
```
