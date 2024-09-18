# Maven Commands

### dependecncy

#### tree
```bash
mvn dependency:tree
```
#### tree with grep
```bash
mvn dependency:tree | grep slf4j
```

#### install and use external jar into local maven repository
```bash
mvn install:install-file -Dfile=./any-jar.jar -DgroupId=org.abc.xyz -DartifactId=zyx -Dversion=1.0.0 -Dpackaging=jar
```

#### build and skip tests but compile test cases
```bash
mvn clean install -DskipTests
```
